# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at 3c9746d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** needs changes

**Summary.** The mathematics holds up wherever I could compute it. That covers the Checks of all fifteen sampled sections, the exponent arithmetic of the new clause 4.10d (4), the round bounds of 4.9c (2), 4.9d (2) and 4.10e, and the 4.10c Check against WachLatticesOverTheCyclotomicTower §6.10. None of it is false. Three findings block acceptance:
- 4.9a takes over a target that AnabelianGeometryAndNonabelianChabauty §4.6 on main already states, and names that roadmap as its consumer.
- `Suggested.lean` declares headline (1) not statable, on the claim that neither library has Selmer groups with local conditions. Tau Ceti has them, and a short probe built on them elaborates at the pins.
- No statement drawn from the formal proof has a locator into it.

There are six small corrections and two format notes. The human reviewers have to decide the scope question: the roadmap rests on a formal proof announced the day before this review, with no written proof.

## R01 (P2) — 4.9a (1)–(3) restates a target of AnabelianGeometryAndNonabelianChabauty §4.6 on main and lists that roadmap as its consumer

This gives two owners for the definition of `H¹_g`, the inclusion `H¹_f ⊆ H¹_g` and the crystalline and de Rham extension criteria. It also has an open roadmap claiming to supply a roadmap on main, which cannot wait for it.

AnabelianGeometryAndNonabelianChabauty §4.6 on main, "The Bloch–Kato subgroups `H¹_e ⊆ H¹_f ⊆ H¹_g`", already does all of this, with a route by dimension count of `D_B(E)`:
- it defines `H¹_g(K, V)` as the kernel of the map to `H¹(K, V ⊗ B_dR)`;
- it states that `H¹_f ⊆ H¹_g` and that both are functorial in `V`;
- it states that for de Rham (resp. crystalline) `V` a class lies in `H¹_g` (resp. `H¹_f`) exactly when the extension of `ℚ_p` by `V` is de Rham (resp. crystalline).

That is 4.9a (1)–(3) once the twist by `η` is undone. Other roadmaps already cite §4.6 as the owner, for example HodgeClassesForJacquetLanglands. This README instead says, in Scope and ownership (line 1601), "4.9a proves that description and defines `H¹_g`", and lists §4.6 among the users of 4.9a (line 1583).

The smallest repair:
- cite §4.6 for (1)–(3) in 4.9a, in its *Needs:* line, in Dependencies and in a `From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty` contract;
- keep as targets only what §4.6 lacks: the reduction from an extension of `E(η)`, the passage to `E`-coefficients, and the lattice form (4);
- drop that sentence and the consumer line.

## R02 (P2) — `Suggested.lean` declares headline (1) not statable because the libraries lack Selmer groups with local conditions, but Tau Ceti has them at the pin

An implementer is told that the acceptance test of the roadmap's first headline cannot be written, and the reason given is false. The module docstring (line 27) says that neither library has "Selmer groups of lattices or of discrete `p`-adic coefficients with local conditions at the places of a number field". For headline (1) it adds that it lacks those Selmer groups, the map carrying `ℒ_v` into `H¹(F_v, T ⊗ B)`, and `T^†`.

At the pin, these are all available:
- `TauCeti.ContCohomology.SelmerStructure` and its `selmerGroup` (`TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`): localisation along continuous group maps, with an arbitrary subgroup of each `H¹(H i, N i)` as local condition.
- `TauCeti.inertiaSubgroup` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:112`).
- The instance `isNonarchimedeanLocalField_adicCompletion` (`TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean:243`).
- Mathlib's `Field.absoluteGaloisGroup.map` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:87`).
- Coefficient functoriality `TauCeti.ContCohomology.explicitMap1`, which gives the map induced by `t ↦ t ⊗ b`.
- Mathlib's `cyclotomicCharacter`, which gives `T^†`.

A probe of about 45 lines elaborates against the pins with no error. It specialises `SelmerStructure` to the finite places of a number field, takes given conditions on a set `Sg` of places and the kernel of restriction to `TauCeti.inertiaSubgroup` elsewhere:

```lean
def unramifiedCondition (v : HeightOneSpectrum (𝓞 F)) : AddSubgroup (H1 (Gv F v) (LocMod F M v)) :=
  (explicitMap1 (Gv F v) (LocMod F M v) (TauCeti.inertiaSubgroup (v.adicCompletion F)) (LocMod F M v)
    ⟨(TauCeti.inertiaSubgroup (v.adicCompletion F)).subtype, continuous_subtype_val⟩
    (AddMonoidHom.id _) continuous_id (fun _ _ => rfl)).ker

def selmerGroupOf (Sg : Set (HeightOneSpectrum (𝓞 F)))
    (L : ∀ v, AddSubgroup (H1 (Gv F v) (LocMod F M v))) : AddSubgroup (H1 (Field.absoluteGaloisGroup F) M) :=
  SelmerStructure.selmerGroup (G := Field.absoluteGaloisGroup F) (M := M) (H := Gv F) (N := LocMod F M)
    { groupHom := fun v => Field.absoluteGaloisGroup.map (algebraMap F (v.adicCompletion F))
      coeffHom := fun v => (AddMonoidHom.id M : M →+ LocMod F M v)
      continuous_coeffHom := fun _ => continuous_id
      coeffHom_smul := fun _ _ _ => rfl
      localCondition := fun v => by classical exact if v ∈ Sg then L v else unramifiedCondition F M v }
```

Here `Gv F v` is `Field.absoluteGaloisGroup (v.adicCompletion F)`, and `LocMod F M v` is a copy of `M` with the action through that map.

The repair:
- state headline (1) in the form of 3.23, through these carriers: there is a lift `𝐅`, and for every `u` the Selmer group is finite of cardinality `#k′^{v′(𝐅(u − 1))}`, or infinite when that value is `0`;
- state headline (2) the same way if its CM data can be expressed;
- where a carrier really is missing, name it in the docstring instead of the present sentence.

## R03 (P2) — The statements drawn from [FormalProof] carry no locator into it

A reader cannot check any statement whose only support is the formal proof against that source. That includes every explicit constant transcribed from it: `32H/p² + 4S + 10η/(p − 1) + 25(1 + log_p(2H))` in 4.10d (4), the `800` of 4.10d (1), the `80` of 4.10e (3) and the `40` of 4.9c (2).

Sections 3.22–3.26, 4.10a and 4.10g cite no source in their text; only the References entry attributes them to [FormalProof]. Sections 4.9c, 4.9d and 4.10c–4.10f cite "[FormalProof]" as a whole. That includes the sub-statements whose proofs are said not to be given here:
- (G), (D1) and (D2) of 4.9c;
- inputs (a)–(c) of the route of 4.10d (4), and the universal part and one-coordinate lifting of 4.10d (3);
- (U)_s and (H)_s of 4.10e (0);
- the eleven component statements of 4.10f;
- 3.25b (2).

The formalisation is large: its export lists about 2.7 million constants. Declaration-level locators do exist; its names include `selmerPresentationMatrix_of_galois_cohomology`, `alternatingWord_numerical_bounds`, `alternatingWord_hypotheses_every_lattice_surjection` and `TwistSelection`.

The repair: at each statement, and at each sub-statement whose proof is not given, name the fully qualified declaration (or the file) in [FormalProof] that it transcribes.

## C01 — The Fitting ideals are attributed to Mathlib, which has none at the pin

The *Needs:* lines of 3.22 (line 136) and 3.25a (line 482) cite "Mathlib `Ideal.fittingIdeal`", and the `From Mathlib` contract (line 1661) lists Fitting ideals. Mathlib has no Fitting ideal at the pin. Tau Ceti has `TauCeti.fittingIdeal` (`TauCeti/RingTheory/FittingIdeal/Basic.lean:334`) and `TauCeti.fittingIdeal_coker_zero_eq_span_det` (`Determinant.lean:170`), which is the fact 3.22 (2) uses.

The route of 3.25a (2) also uses the inclusion `Fitt_a(𝔑)·Fitt_b(𝔐₁) ⊆ Fitt_{a+b}(𝔐′ ⊗ Λ₁)` for an exact sequence. Neither library has it.

Point these lines to Tau Ceti, with a `From Tau Ceti` contract, and name the exact-sequence inclusion as an input of that route.

## C02 — The ramified-coefficients Check of 4.10d puts `n = 2` inside clause (2), which needs `2j < n`

The Check at line 1270 says "In (2), take `p ≥ 11`, `n ≥ 2`, `j = 1`". But (2) assumes `2j < n`, so for `n = 2` it does not apply. The rest of the example is right: the cokernel is `O/p`. Write `n ≥ 3`.

## C03 — The size-conditions Check of 4.10d reads false in the route's notation

At line 1282, `2a + η + 1 < 65` holds for `a = a(11, 110) ≈ 29.35`, which gives `64.7`. But the route of (4) defines `a := ⌈a(p, H)⌉ = 30`, which gives `66`. Write `2a(11, 110) + η + 1 < 65`, as (S1) does.

## C04 — The dimension formula of SelmerIwasawaCohomology §4.9 is applied to de Rham representations, but §4.9 states it for crystalline ones

Three places use it for de Rham `V`: the route of 4.9b (line 673), the route of 4.10g (line 1553) and the Check of 4.10b (line 904). SelmerIwasawaCohomology §4.9 on main derives the formula from the crystalline exact sequence, and this README's own contract for §4.9 (line 1609) says "for crystalline `V`". The formula is true for de Rham `V`; §4.9's own locator cites Bloch–Kato Corollary 3.8.4. Cite it that way, or say that it follows from §4.9's de Rham exact fragments, and extend the contract line.

## C05 — Two sentences of the description do not match the head

The sentence "The family index … is carried, with identical content, by every pull request of the family" is false. The head of #2922 (GluedTargetAndDivisionInequality) changes `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` differently in three places: the paragraph on the formal proof, a sentence on section numbers, and the entry for ChowFormsAndHeightsOfSubvarieties. The two heads conflict, so say which is rebased on which, or align them.

The sentence "the targeted Lake build succeeds with `sorry` as the only warning" does not match the file. `Suggested.lean` declares nothing, so the build has no warning at all.

## C06 — Downstream consumers omits GluedTargetAndDivisionInequality

GluedTargetAndDivisionInequality §8.19e uses 3.25b (2) and 3.26: it treats the theta conditions as polynomial conditions of the second kind. Yet the entries for 3.25b and 3.26 (lines 1581–1582) name only CongruenceModulesOfThetaLifts §7.8.

## N01 — The reference key "Berger-Wach-2004" names Wach as if a co-author; the paper is Berger's alone.

## N02 — The section ids continue SelmerIwasawaCohomology's numbering

This roadmap's 3.22 follows that roadmap's 3.21, and its 4.9a–4.10g sit beside that roadmap's 4.9–4.11. A citation of "§4.10" is therefore easy to confuse with "4.10a" here. Numbering of this roadmap's own would avoid that.

## Questions for the author

- The announcement points to tarballs on its author's site for the code, while [FormalProof] gives a GitHub repository. Are these the same code, and at which commit should the locators of R03 be read? I could open neither: the sources service does not fetch that host, and the operator-held copy is a kernel export without readable statements.

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result | Change |
|---|---|---|---|---|
| 3.22 (sample) | (3) with `Λ′ = O`, `Hom(O/λ², −)`; `J = ∅`; "split over `F⁺`" Check | `n = 1`, `Φ = (λ²)`; cokernel ≤ `#Ext¹(O/λ², k) = #k`; `c` trivial on tame inertia ⇒ `χ′ − χ′∘c` unramified | holds | none |
| 3.22 Euler characteristic | torsion of `H¹(F_v, T)` | `h⁰(T̄) − dim ℒ_v(k) = rank H⁰ − rank ℒ_v`; torsion adds `dim H¹(T)[λ]` to both | holds | none |
| 3.23 | `n_Q = 1`, `Φ = [e] − 1`, `u` of order `p^m`, `u = 1` | length `e(O′/ℤ_p)/(p^{m−1}(p − 1))` both sides; `u = 1`: ∞ | holds | none |
| 3.24 | (2) at `p = 2`, `N ≡ 3 (4)`; (4a) with an extra place | `N(N−1)/2` odd ✓; difference `h⁰(F_v, T̄^†) > 0` ✓ | holds | none |
| 3.25 | lift independence; `n_Q` bound | `C(p^M, k) ≡ 0 (p)` for `0 < k < p^M` ✓; `n_Q ≤ 2rR + e` ✓ | holds | none |
| 3.25a (sample) | binomials; bordered ring; `f = X − λ`, `g = X + λ`, `𝔞 = λ²`; (3′) counting | `v_p C(p^M, k) = M − v_p(k) ≥ ν + 1` for `k < p^{M−ν}`, `= ν` at `p^{M−ν}`; `fg ≡ X²`; `N − 1 = 2(ν_λ + 1)w + 1` | holds | none |
| 3.25b (sample) | `p = 3`, `m = D = v₀ = 1`; product of `I` factors | `v(f(u − 1)) = 1/2` ✓; vanishes at `(ζ^{p^i}, ζ)` ✓; edges ≤ `D + e′μ′` | holds | none |
| 3.26 (sample) | `[F(μ_p):F] ∤ tr`; `p = 2`; `t_s r_s = 0` | `ν_s = 0`; `ν_s ≥ 1`; `t_s = 0` ⇒ clause 2 void; sum ≤ `4Rε` | holds | none |
| 4.9a (sample) | `ℚ_p(1)`, `ℚ_p` | `H¹_g` dim 2, `H¹_f` dim 1; unramified line ✓ | holds; duplicates main §4.6 | R01 |
| 4.9b (sample) | `F` imaginary quadratic, `V = E(1)`; `ℚ(i)`, `p = 3`; CM pairs | LHS 2 vs RHS 1 ✓; `O^×/3 ⊕ Cl[3] = 0` ✓; pairs give `r[F:ℚ]/2` ✓ | holds | C04 |
| 4.9c (sample) | `e = s = 1`; `a ≥ β + …`; `p = 7`, `N = 91`; round bound | `β = −1` ✓; `ord₁₃ 7 = 12`, `[K′:K] = 24`, `v₇ = 0` ✓; `3t(n+1) + 2t + 7 ≤ (n+1)(5t+7)` ✓ | holds | R03 |
| 4.9d (sample) | `ℚ_p(u)`; `μ_n ⊕ ℚ_p(1 − k)`; (2) bound | exponent `m + v_p(u)` vs `m + v_p(u) + 2` ✓; `ℤ/p^n ⊆ H⁰(V/T)` ✓; `2 + 3nλ ≤ 20(n+1)λ` | holds | R03 |
| 4.10a (sample) | `n = 2`, `h = 60`, `p = 41`; rank of `H¹_f` | `σ = ⌊60/40⌋ = 1`, `η ≤ 30` from `η + 10 < 41` ✓; rank `d` ✓ | holds | R03 |
| 4.10b (sample) | `I = 0`, `I = H¹_f(T′)` | `I^⊥/I′^⊥ ≅ (I′/I)^∨` ✓; corank equals rank ✓ | holds | none |
| 4.10c (sample) | span `p − 1` lattice; round bound at `p = 3` | `cost(0, p−1) = 1`, `a = 1`, `Σ v_p(J) = 0` ⇒ `e° = 3` ✓; coker length `n` ✓; coefficient `3.75 ≤ 4` | holds | none |
| 4.10d (sample) | (4) exponent; 78,204-point grid; size Check; ramified-coefficients Check | `H`-coefficient `≤ 31.11/p² ≤ 32/p²`; constants `13.4 + 9.8δ ≤ 25δ`; `64.7 < 65` but `66` with ceiling; `n = 2` violates `2j < n` | holds | C02, C03, R03 |
| 4.10e (sample) | `p = 3`, `h = 1`; `p = 5`, `[−1, 0]`; `ℚ_3`, `E = ℚ_3(μ_3)` | `e_1 = 10 + 2 + 1 = 13 ≤ 18` ✓; `v(P(1)c_Γ) = 2` ✓; rank 1 vs 2 ✓; `ι_s(Q) = ξ̃` ✓ | holds | R03 |
| 4.10f (sample) | `N = 2`, `η = r′ = 1`; orbit bound | `k = 4 + 6 = 10` ✓; `4r′ ≤ N²` via `(N − 2)² ≥ 0` ✓; `p^r − 1 \| p^{(p−1)!} − 1` | holds | R03 |
| 4.10g (sample) | `U = E`, `K = ℚ_p` | bound `e(1 + 1) = 2e` ✓; `rank M ≤ [K:ℚ_p] dim U` ✓ | holds | C04 |
| Headline (1) | 3.22 (2) with 3.23; statability probe | consistent with 3.22, 3.23; Selmer group probe elaborates | true; statable | R02 |
| Headline (2) | 3.26 hypotheses vs summary | (H1), (H2), (H5), (H6), balance, `ν_s`, `ε′` all match | consistent | none |
| Headline (3) | 4.9d (1) | `c = 2 + Σ_u(2s + n₀ + 1 + v_p(u))` matches | consistent | none |
| Headline (4) | 4.10c (3), 4.10e (1′) | `23(2 + H/p + log_p(H+1))` ✓; `28hs_N ≤ 32(2hs_N + 1)` ✓ | consistent | none |
| Fitting ideals | Mathlib and Tau Ceti at the pin | no `Ideal.fittingIdeal`; `TauCeti.fittingIdeal` at `Basic.lean:334` | pointer wrong | C01 |

- Source locators checked: Bhatt–Scholze Theorem 1.2 (Theorem 5.6 in the body; any `p`, perfect residue field) at BS23-FCRYS line 65 ✓; the announcement read in full; [FormalProof] and Bloch–Kato could not be read as text.
- Library declarations opened at the pins: 14 (Tau Ceti `SelmerStructure.lean:69`, `Inertia/Basic.lean:112`, `ValuativeRel.lean:243`, `ExplicitFunctoriality.lean:358`, `FittingIdeal/Basic.lean:334`, `Determinant.lean:170`, `Prod.lean:133`; Mathlib `AbsoluteGaloisGroup.lean:87`, `ContCohomology/Sha.lean:72`, `ContCohomology/Basic.lean:131`, `BDeRham.lean:75`, `CMField.lean:70`, `SelmerGroup.lean:161`, `CyclotomicCharacter.lean:308`).
- Cross-roadmap citations resolved: 49 supplier ids on main (SelmerIwasawaCohomology, ArithmeticGaloisDuality, ClassFieldTheory, ProfiniteCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicPeriodRings, PrismaticCohomology, PrismaticCohomologyPartIII, NewtonPolygons, PhiGammaModulesAndIwasawaCohomology, Chebotarev, ArithmeticDirichletSeries, AnabelianGeometryAndNonabelianChabauty §4.6); WachLatticesOverTheCyclotomicTower §§6.4–6.10 at #2899; the consumer ids in #2921 and #2898. All exist.
- Dependency check output: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`.
- Automatic checks: the worker's gate passed; my rerun flags only the family index and the merge order (set aside below).
- Elaboration: `lake env lean` on `Suggested.lean` gives no output and exit code 0; it declares nothing, so there is no `#check @name` to compare. The Selmer-group probe of R02 elaborates with no error.
- Arithmetic: 4.10d (4) exponent recomputed symbolically and on 78,204 parameter points with no violation; 4.9c (2), 4.9d (2), 4.10c (3), 4.10e (1), (1′), (3) round bounds recomputed.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, UniformWildKernelBounds and GluedTargetAndDivisionInequality (open), and PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology and SelmerIwasawaCohomology (main). None of them shares an object: WachLatticesOverTheCyclotomicTower hands 4.10e (0) and the lifting theorems to this roadmap, and the other family members cite it. An object search found AnabelianGeometryAndNonabelianChabauty (main), which shares 4.9a's `H¹_g` and extension criteria; its owner is AnabelianGeometryAndNonabelianChabauty §4.6 (R01). Ownership against open pull requests was checked with the roadmap search over all open heads.

Source independence: 2 passages compared with 2 readable sources (Bhatt–Scholze Theorem 1.2 against the PrismaticCohomologyPartIII §7.22 contract and the BS23-FCRYS entry; the announcement against its References entry), none shared beyond forced terms. Largest share: [FormalProof], 24 of 30 in-text source locators. Its text and table of contents could not be read, so neither wording nor arrangement was compared against it.

Research link: Layer 4 extends the integral `p`-adic Hodge theory of Wach lattices (Wach 1996; Berger 2004), the Herr complex (Herr 1998) and prismatic `F`-crystals (Bhatt–Scholze, arXiv 2106.14735) to explicit lifting exponents. By the README, Layers 3 and 4 are inputs to Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026). This rests on the README and BS23.

## Not verifiable

- [FormalProof] (3.22–3.26, 4.9c, 4.9d, 4.10a, 4.10c–4.10g): the sources service does not fetch the GitHub host. The operator-held copy is a kernel export; I scanned its declaration names, but its statements cannot be read as text.
- Bloch–Kato §3 (4.9a, 4.10c): published by Birkhäuser behind a paywall; no legal copy found.
- Wach 1996, Berger 2004, Herr 1998: cited only as background for the objects, with no theorem locator to check; not fetched.

Automatic checks set aside as false positives: the rule that a pull request change nothing outside its roadmap folder, which keeps a review's scope honest, flagged the three files of the family index (they are this pull request's own); and the rule that every roadmap be placed in the merge order, which keeps suppliers before consumers, flagged this roadmap as unplaced (it is new, so it is placed after its last supplier).

## Source issues

- none

## For the human reviewers

- Scope: nearly every target rests on [FormalProof], an unrefereed Lean formalisation announced on 20 November 2026 by one author. The announcement (Announcement lines 45–49, 72–76) says no written proof exists and that only Lean is presented.
- Licence: I could not read a licence for the formal proof. The README's GitHub repository could not be fetched, the announcement points to tarballs on its author's site instead, and the operator-held export carries no licence file.
- Not tested: [FormalProof] holds the largest share of locators (24 of 30), and neither its text nor its table of contents could be read, so the wording and arrangement checks were not run against it.
