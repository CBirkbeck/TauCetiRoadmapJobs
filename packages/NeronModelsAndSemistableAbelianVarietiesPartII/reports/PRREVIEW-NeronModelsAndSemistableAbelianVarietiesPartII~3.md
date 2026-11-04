# Review of NeronModelsAndSemistableAbelianVarietiesPartII (pull request #870 at fec9eae)

**Verdict:** accepted

This is a full re-review of the repaired head: the folder changed by 349 README lines since cc6f0ae, the head the previous review read; `Suggested.lean` is byte-identical to that head. The repair status of the previous review's seven findings comes first, then two P3 notes, then the verification record. No P1 or P2 finding survived.

**Repair status of the previous review.**

- Previous R01 (§7.4 and §§7.5–7.6 needed each other): repaired. §7.4 (`README.md:10060`) now proves equivalence "to at least one of the fourteen models" with `*Needs:*` §4.14; §§7.1–7.3; §6.1; §§5.9–5.13 (`README.md:10095`); §7.5 and §7.6 prove pairwise inequivalence with `*Needs:*` §6.1; §7.2 only (`README.md:10124`, `10145`); the new §7.7 (`README.md:10147`) draws "exactly one" and the counts eleven and three from §7.4, §7.5, §7.6, §6.1, §7.2. The test instance (models 3, 4, 12 with j=t²) lives in §7.5's Checks and is consumed by §7.7. A parser over all 158 `*Needs:*` lines returns no cycle.
- Previous R02 (Layer 5 and Layer 7 needed each other): repaired. The six normal forms are now §7.3 (`README.md:9992`), after §§7.1–7.2; §5.10 points to "the separate targets of §7.3" (`README.md:9679`); the Layer 5 Dependencies paragraph no longer mentions them. The layer graph computed from the `*Needs:*` lines is 2→1, 3→2, 4→2, 5→{2,4}, 6→{2,4,5}, 7→{4,5,6}: acyclic.
- Previous R03 (N6 excluded (e₀,d₀′)=(0,1) for a false reason): repaired. §7.3 N6 (`README.md:10018–10025`) lists the fibres E₃, E₅, E₃, E₁ at t=1 for (0,0), (1,0), (0,1), (1,1), separates (0,0) from (0,1) by the fibre at ∞ (IV versus wild II, a₆′=s with s²∤a₆′) and names the source's omission; the negative control (`README.md:10051–10054`) carries Δ=t⁸, Δ′=s⁴ and the resolved count 15+3+3=21; §7.4 and §7.7 reuse it. I recomputed all four counts (3, 5, 3, 1), the reversed coefficients (a₃′,a₄′,a₆′)=(s, e₀s, d₀′s) and Δ′=s⁴ (table below); N5's counts 5, 3, 1, 3 in the order (0,0), (1,0), (0,1), (1,1) are also correct.
- Previous R04 (ownership of the general genus-one theory in Scope): repaired. `README.md:18–22` names §2.1, §§2.3, 2.5, §§4.1–4.2, §§4.7–4.8 and §4.17 as owned here, "later roadmaps import these by section and do not restate them".
- Previous R05 (constructions with one Check, definitional Checks): repaired for every listed target. §1.4, §1.8, §2.7, §2.8, §2.25, §2.37, §3.7, §3.10, §4.5, §4.12 and §4.14 now have three or four computed Checks each; §2.47's two definitional bullets were replaced by the F₄ Frobenius-twisted transition and the cusp/nonsplit structure-map comparisons; §5.2's three arithmetic bullets by the trace-ten/trace-six/trace-eight counts and the three-degree-three-points blowup with seven points. Each new Check was recomputed (table below).
- Previous R06 (numbering versus build order): repaired. Layer 1 (`README.md:3773–3776`) and Layer 2 (`README.md:8480–8485`) now state their build orders explicitly; I checked mechanically that every `*Needs:*` reference inside those layers points to an earlier position in the stated order, and that Layers 3–7 contain no forward reference.
- Previous R07 (third-party scan of Lang 1956): repaired. `README.md:4203–4204` cites the journal, theorem and pages and points to the JSTOR record in the References.

## R01 (P3) — Four constructions and one definition still have a single Check

**Location:** `README.md:9459–9476` (§5.1, "define `n_a` to be i for smooth Eᵢ, 2r_a for split multiplicative, 2r_a+2 for … nonsplit … and 2r_a+1 for additive"), `README.md:8505–8508` (§3.1), `README.md:9239–9242` (§4.13), `README.md:4823–4826` (§2.27), `README.md:523–526` (§1.5).

**Claim:** Every definition keeps at least three discriminating Checks.

**Witness:** §5.1 defines the count data `n_a` and has the one Check "The formula 2r+2 is used only after establishing nonsplit incidence". A rule that used 2r_a for every multiplicative fibre would give model 4 (III*, E₂, Ĩ₂) the sum 17+2+4=23 instead of 17+2+6=25, and model 13 (I₃*, E₄, Ĩ₁) 17+4+2=23 instead of 25; a rule that used 2r_a+1 for smooth fibres would give E₁ the value 3 instead of 1. §3.1 (the horizontal divisor D=Spec R′), §4.13 (the cubic Z), §2.27 (the proper one-point pinch) and §1.5 (the glued scheme P) are constructions with one Check each.

**Repair:** Add two computed Checks to each. For §5.1: the three model-4 and model-13 sums above as a negative control for the split formula, and the value table n(E₁)=1, n(II)=3, n(split I₁)=2, n(Ĩ₁)=4 over F₂ as a positive one. For §3.1: m=1 gives D⊗_R k=D∩X_red of length one, m=2 gives length two on a point of residue degree one. For §4.13: on a fibre of type I₂ the component disjoint from O is contracted to an A₁ point of Z while an I₁ fibre contracts nothing, and for E×P¹ the contraction is an isomorphism. For §2.27: E/k purely inseparable of degree two gives the proper cusp of §2.7's last Check, and Y=A¹ gives a nonproper pinch. For §1.5: Z=∅ gives P=Y⊔Z′, and Z=Y gives P=Z′.

## R02 (P3) — Layer 6 numbers its three targets 6.1, 6.16, 6.17

**Location:** `README.md:9792`, `9871`, `9890`.

**Claim:** Subsections are numbered `### k.n` consecutively in build order (shape rule 6).

**Witness:** Layer 6 has exactly three targets, numbered 6.1, 6.16 and 6.17; the fourteen gaps are referenced nowhere (`§§6.16–6.17` at `README.md:10201–10202` is the only cross-reference). The gate's layer and target scanners accept the file, so this is cosmetic.

**Repair:** Renumber §6.16 and §6.17 as §6.2 and §6.3 and update the two references in Downstream consumers and the Layer 7 Dependencies paragraph.

## Verified sound

**Gate and build.** The worker's gate at fec9eae passes every check (`gate.md`). I elaborated `Suggested.lean` with `lake env lean` from the worktree: exit 0 and exactly five `declaration uses sorry` warnings. Its three `TauCeti.*` imports have object files at the pin (`Genus`, `ProjModel`, `AffineDynkinType/Basic`). The diff outside the roadmap folder against `origin/main` is empty.

**Dependency check.** Output of the depcheck command from the brief:

```text
depcheck: 201 roadmaps, 1317 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier is on main or earlier in the merge order: AlgebraicModuliForArithmeticGeometry (22), ComplexComparisonPartII (29), InverseGaloisAndArithmeticFundamentalGroups (34), NeronModelsAndSemistableAbelianVarieties (37) against this roadmap at 40; StableReduction, JacobianChallenge, SchemeAndStackFoundations, ReductiveGroupsPartII, EtaleCohomologyFoundations, ModularCurves, EllipticCurves, IntegralLattices, ZigzagPreprojective and AlgebraicCurves on main. K3SurfacesAndSymplecticBoundedness (289) is cited nowhere in the README.

**Needs-graph pass.** A parser over the 158 `### k.n` sections (supplier-qualified section numbers such as "SF.5 §§5.9–5.10" excluded) finds: no reference to a nonexistent section, no target cycle, no self-reference, the acyclic layer graph above, 45 within-layer forward references all in Layers 1 and 2, and both stated build orders consistent with every edge.

**Lean form, signatures and padding.** On a scratch copy I appended `#check @name` for all six declarations and replaced each `sorry` by `first | rfl | (simp; done) | infer_instance | sorry`. The elaborated types keep every binder: `[Field k] [Finite k]`, `[Smooth] [IsProper] [GeometricallyConnected]`, the explicit `FiniteDimensional` instance on H¹, `topologicalKrullDim X = 1`, `X.genus k = 1`, the primitive positive null vector with `Finset.univ.gcd … = 1`, `[∀ x, IsRegularLocalRing (stalk x)]`; nothing disappeared. None of the five theorems closed under the probe. No `set_option`, no sorry'd data, no `lemma`, single `import Mathlib` plus three existing `TauCeti.*` modules. The five headlines statable at the pins (§1.5, §2.5's matrix classification, §2.15, §2.22, §4.16) are present at the README's generality; the docstring names the unstatable ones (algebraic-space pinching, geometric Kodaira classification, Layer 3 comparisons, Layer 4 bundle formulas and lattices, Picard constancy, the fourteen-model classification) with the missing carriers. `F2Model` is the only definition and matches Schröer's table (schroer lines 489–494) in the a-coefficient order. No padding finding.

**Pinned definitions behind the headlines.** `AlgebraicGeometry.Scheme.genus` is `dim_k H¹(X,𝒪_X)` guarded by the `FiniteDimensional` instance (`TauCeti/AlgebraicGeometry/Cohomology/Genus.lean`, lines 60–69). `TauCeti.AffineDynkinType.cartanMatrix` is `2·1 − adjMatrix` for every type except `A 1 = !![2,-2;-2,2]` and `E8` (a reindexed `CartanMatrix.E 9`), `marks` is the vector with `2δᵢ = Σ_{j∼i} δⱼ` (A: all ones; D: 2 on the interior; E₆ `![3,2,1,2,1,2,1]`; E₇ `![4,2,3,2,1,3,2,1]`; E₈ `![6,3,4,2,5,4,3,2,1]`), and `Valid` is `1 ≤ n` for A, `4 ≤ n` for D (`TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean`, lines 154–157, 368–372, 500–505). So `−cartanMatrix` has diagonal −2 and nonnegative off-diagonal entries and `marks` is its positive primitive null vector, as the headline states. `WeierstrassCurve.frobeniusTrace_eq_one_of_splits` has hypotheses `Δ = 0`, `c₄ ≠ 0`, `nodePolynomial.Splits` (`TauCeti/AlgebraicGeometry/EllipticCurve/SingularPointCount.lean`, line 261), as the supplier contract says. The instance `[IsIntegralHom f] : IsIso f.toNormalization` cited by §2.54 is at `Mathlib/AlgebraicGeometry/Normalization.lean` line 282.

**Library declarations opened at the pins** (file under the pinned Mathlib or Tau Ceti): `WeierstrassCurve.j_eq_zero_iff_of_char_two` (Weierstrass.lean), `IsLocalization.Away.map_injective_iff`, `Away.map_surjective_iff` (Localization/Away/Basic.lean), `Polynomial.degreeLT_succ_eq_degreeLE`, `pointCount_eq_card_point` (TauCeti PointCount.lean), `isPushout_tensorProduct`, `mk'_mem_map_algebraMap_iff`, `IdealSheafData.ext_of_iSup_eq_top`, `app_basicOpen_eq_away_map`, `isIso_pushoutSection_of_isAffineOpen`, `germToFunctionField_injective`, `functionField_isFractionRing_of_isAffineOpen`, `normalizationObjIso_hom_val`, `normalizationDesc`, `toNormalization_normalizationDesc`, `normalizationDesc_comp`, `normalization.hom_ext`, `IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`, `flat_appLE`, `finite_app`, `IsZariskiLocalAtTarget.iff_of_iSup_eq_top`, `isIso_morphismRestrict_iff_isIso_app`, `Hom.isoOpensRange`, `Scheme.PartialIso`, `BirationalOver`, `IsLocallyDirected.ι_eq_ι_iff`, `IsLocallyDirected.openCover`, `UniversallyClosed.of_comp_surjective`, `IsOpenImmersion.of_isLocalization`, `Cover.mkOfCovers`, `finrank_eq_one_iff_of_nonzero'`, `Module.natCard_eq_pow_finrank`, `FiniteField.nonempty_algHom_iff_finrank_dvd`, `includeRight_injective`, `IsProper.eq_valuativeCriterion`, `zmodAddEquivOfGenerator`; Tau Ceti `quotientComapEquivOfCoprime` (Ideal/Conductor.lean), `degreeOneEquivPicZero` (WeilDivisor/Scheme/GenusOne.lean), `frobeniusTrace_eq_neg_one_of_not_splits`, `frobeniusTrace_eq_zero_of_c₄_eq_zero`, `nodePolynomial`, `checkerboardLattice_form_checkerboardVector_self` (TypeD/Basic.lean), `discriminant_typeE₆RootLattice` (TypeE.lean), `projModelVariableChangeIso`, `projModelZero_projModelVariableChangeIso_hom` (ProjModel.lean), `rationalFunctionsRingEquiv_map`, `fromSpecFunctionField_preimage`, `instUniqueSpecFunctionField` (Modules/RationalFunctions.lean). All exist.

**Cross-roadmap citations resolved** (line in the cited roadmap on main, or at the head the brief gives): NeronModelsAndSemistableAbelianVarieties §2.7 (1234), §2.8 (1270), §3.8 (1648), §3.9 (1694), and its line 216 naming Part II as owner of Ferrand pinching, conductor squares and the F₂ models; ReductiveGroupsPartII §RG2.3.7 (5202) with the prose target *lang-theorem* (5204) and the affine carrier `FiniteTypeCommHopfAlgCat`; AlgebraicModuliForArithmeticGeometry §1.1 (306), §3.5 (1811) with `finiteQuotientComparison` (1823) and `polarizedDescentComparison` (1843), §7.3 (9312) with `RaynaudNStar` (9426) and `raynaud_degree_one_cohomologicallyFlat` (9448); StableReduction Layer 6 numerical types (510–530) and the valuative criterion entry (206–208); ZigzagPreprojective Layer 0, the affine simply-laced diagrams with Cartan matrix `2I−A`, `Ã₁ = !![2,-2;-2,2]` and the marks δ with `Cδ=0` (206–215); EllipticCurves Layer 4 `ReductionSymbol` (820, 866); AlgebraicCurves Layer 10 with Stichtenoth 6.1.2 (930); EtaleCohomologyFoundations §F.0.3 (232), §F.3 (677), §F.10.2b (1109), §0.9 (1121), §0.11 (1158); InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (336–339); ComplexComparisonPartII §C3.2d.2 (1976), §C3.2d.3 (1994), §C3.2d.4 (2012); SchemeAndStackFoundations §0.9 (849), §0.14 (1069), §0.27 (1719), §0.28 (1766), §1.3 (2106), §2.16 (3897), §3.4 (4790), §3.6 (4906), §5.9 (7130), §5.10 (7176); IntegralLattices 6C (1655) and 6F (1676) on main; ModularCurves Layer 4D strict henselisation (1166, 1184–1222); JacobianChallenge Layers A–F (112–449). The resolver (`roadmaps resolve`) reports no citation and no Lean name found nowhere.

**Ownership.** `roadmaps grep` over the open pull requests and main: "Ferrand" and "conductor square" occur only here and in the base roadmap's pointer; "pinching" elsewhere only in unrelated senses (RicciFlow, Poincare3D); "rational elliptic surface" and "fourteen" in EnriquesSurfacesAndIntegralNonexistence (#1488), which imports §§2.1–2.16, 3.7–3.11, 4.1–4.18, 5.1–5.8, 6.1 and 7.4 of this roadmap by section ("These inputs are imported rather than constructed here", its README line 76) and is a consumer. The K3SurfacesAndSymplecticBoundedness head (merge position 289) still says at its README lines 795 and 1443 that its §6.0b supplies this roadmap's §§2.1, 2.3, 2.5, 4.1–4.2, 4.7–4.8 and 4.16–4.17; this roadmap cannot consume a later roadmap, its Scope now states the ownership (previous R04), and the reverse claim must be dropped in the K3 pull request, outside this folder. Ownership against open pull requests whose files the brief does not give was not checked beyond the grep.

**Seeded source sample: 15/15 read at legal texts.** Source ids: schroer (arXiv 2004.07025v3, printed pagination), ferrand (Numdam), witaszek (NSF Public Access Repository copy of the Annals paper, fetched as an institutional copy; printed pagination 655–705), stacks-07T8 (Stacks algebra chapter).

| Target | Locator read | Result |
| --- | --- | --- |
| 1.6 | ferrand lines 720–746 (Lemme 4.4, p. 567); witaszek lines 742–748 (Lemma 2.23, p. 672) | Flat base change of a cocartesian square under qcqs maps and a universally submersive X′⊔Y→X (Ferrand), of a geometric pushout square (Witaszek). Finite pinching satisfies both; the README's "all four maps qcqs" is the Ferrand hypothesis and submersiveness is automatic for the finite surjective disjoint union |
| 1.21 | ferrand lines 165–194 (Lemme 1.3 and its converse, pp. 556–557), 780–791 (Théorème 5.1, p. 568) | The converse needs f(I) an ideal and ker f ∩ I = 0; the principal-localization paragraph proves A_t ≅ A′_{h(t)} for t ∈ I by exactly the injectivity/surjectivity argument §1.21 restates |
| 1.24 | stacks-07T8 lines 4457–4465 (Lemma 10.40.4); ferrand lines 49–51 (introduction, p. 554) | Ann_R(M)S = Ann_S(M⊗S) for flat S and finite M, proved by intersecting the annihilators of finitely many generators: the finite-generation step the target isolates; the conductor is the annihilator of A′/A |
| 2.7 | schroer lines 424–436 (p. 10) | One-component conductor square Spec R → P¹, Spec k → C with R of length two; R = E a field gives the twisted Ĩ₁ with a nonrational point of P¹ identified with a rational point of C |
| 2.11 | schroer lines 468–473 (Proposition 3.2, p. 11) | Table: Ĩ₁ has q+2 points |
| 2.13 | schroer lines 468–473 (Proposition 3.2, p. 11) | Table: unstable fibres have rq+1 points; the proof is "left to the reader", which the README supplies |
| 2.16 | schroer lines 460–467 (proof of Proposition 3.1, p. 11), 753–759 (proof of Theorem 5.6(iii), p. 17) | Forms of P¹ over F_q are trivial by Wedderburn (Brauer–Severi curve), and a (−2)-curve with a degree-one invertible sheaf is P¹ |
| 2.18 | schroer lines 487–494 (Proposition 3.3, p. 11) | E₂: y²+xy=x³+x²+x, ordinary with j=1; `F2Model 1 = ⟨1,1,0,1,0⟩` matches |
| 2.24 | schroer lines 480–494 (p. 11) | Five curves indexed by the order of E_i(F₂); the README's count classifier is the restatement with smoothness made explicit |
| 2.29 | schroer lines 437–445 (p. 10), 468–473 (Proposition 3.2) | Two-component square Spec(R×R) → P¹⊔P¹, Spec R → C; Ĩ₂ has 2q+2 points |
| 2.30 | schroer lines 446–449 (p. 10) | Over perfect fields only Ĩ₁ and Ĩ₂ occur as twisted forms; the README keeps the imperfect cases visible elsewhere (§2.6) |
| 3.4 | schroer lines 1044–1069 (Lemma 8.4, pp. 23–24) | Norm argument N(L|C)=L^{⊗d}, h¹≥1; h¹=1 forces regularity via the constant fields; the README's inseparable-map remark is consistent with the norm proof |
| 4.17 | schroer lines 822–828 (§6, p. 19), 976–1010 (§8, pp. 21–22) | J_η is Pic⁰ or the regular compactification of a twisted G_a; relatively minimal Jacobian fibration with zero section; henselization and the transverse divisor as restated in §§3.1–3.2 |
| 5.8 | schroer lines 1162–1174 (Theorem 9.4, p. 26) | Conditions (i)–(v) of Proposition 9.3 and Σn_a = 25 give constant Picard scheme; proof by fixing the Shioda–Tate generators, as restated |
| 5.13 | schroer lines 1289–1304 (Proposition 10.3, p. 29) | r_a ≤ 5 forces ≤ 3 components, III+I₆ or III+I₈ by Lang, and 25 = 5+2m+2n gives m=8, n=2 |

Other locators read this round: schroer lines 1105–1138 (Proposition 9.3 and proof, p. 25; the Tsen step at 1127–1128), 1250–1266 (Proposition 10.1, p. 28), 1269–1284 (Proposition 10.2), 1306–1395 (Theorem 10.4 and proof, pp. 29–31), 1397–1446 (Theorem 10.5 and proof, pp. 31–32), 1145–1152 (the definition of n_a, p. 26: i, 2r_a, 2r_a+2, 2r_a+1 as in §5.1); witaszek line 622 (Definition 2.17), 847 (Definition 2.27), 869–880 (Lemma 2.28, p. 675: triples (L_X, L_C, φ) with φ an isomorphism, as §1.8 restates).

**Computed adversarial pass.** Rows cover the sampled targets, the five headlines, every target a finding touches, and every passage changed since cc6f0ae. Each row records values computed on both sides.

| Target | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.4 (new Checks) | Y=P¹, Z={0,∞}; doubled plane; Z=∅; g=id | U=P¹∖{1} contains both points and U∩Z=g⁻¹(Spec k); U=P¹∖{0} meets Z in {∞}, not a fibre; an open containing both origins is non-separated, so no affine neighbourhood; closed subscheme of affine is affine | Pass |
| 1.5 headline `ferrand_scheme_pushout_exists` | Z=∅; Z two points of P¹ | Z=∅: U=⊥ is an affine open, P=Y⊔Z′, a open-closed finite, b closed, Y×_P Z′=∅; two points lie in P¹∖{third point} | Pass |
| 1.6 | cusp C=k[t²,t³], F=C[ε]; F=C/(t²) | (B×_C A′)⊗F = C[ε] both sides, conductor I+εI with εt²∈, εt∉; nonflat quotient kills [t³] | Pass |
| 1.8 (new Checks) | nodal cubic from P¹ pinching {0,∞}; zero map in place of φ | gluing data (u₀,u₁)∈(k*)², automorphisms λ,μ rescale both by λμ⁻¹, classes (k*)²/k* ≅ k* via u₀/u₁ = Pic⁰; kernel I_Z⊕O_{Z′} has fibre dimension 1+1+1=3 ≥ 2 at the node | Pass |
| 1.21 | f=id_ℤ, I=ℤ, t=2; diagonal ℤ→ℤ×ℤ, I=ℤ; first projection ℤ×ℤ→ℤ, I=ℤ×ℤ; ℤ/4, t=2 | E⁻¹([3])=6/2; image of I is the diagonal subring, not an ideal, so not surjective; ker f ∩ I = 0×ℤ ≠ 0, not injective; ℤ/4[1/2]=0 and the map is bijective | Pass |
| 1.24 | diagonal F₂→F₂×F₂, family {1}; n=0, B=0 | 1·1∈im f but 1∉c(im f)=0, so the spanning hypothesis is needed; empty family gives the unit ideal for the zero module | Pass |
| 2.5 headline matrix classification | [[−2,2],[2,−2]]·(1,1); [−2]; [[−2,3],[3,−2]]; D̃₄ star | Ã₁ with marks (1,1) at the pin; [−2]·m=−2m≠0 so hypotheses are contradictory; null vector needs (9−4)m₂=0, excluded; central node −2·2+4·1=0 with marks (2,1,1,1,1)=`dMarks 4` | Pass |
| 2.7 / 2.11 (new Checks) | q=2 over F₂, F₄; E=k; two rational points; inseparable E | 3+1=4 and 5−2+1=4; trace 3−4=−1 then 5−4=+1; pinching one rational point: h¹=0; two rational points: split node, h¹=1, count q; E⊗k̄=k̄[ε] gives the cusp (schroer line 432) | Pass |
| 2.8 / 2.12 (new Checks) | q=2, q²=4; pinch to Spec k instead | 2·3=6, 2(4+1)−2=8; k²→E has kernel diagonal and cokernel of dimension 1, so h⁰=h¹=1; to Spec k the quotient E²/k has dimension 3, cokernel 2, p_a=2 | Pass |
| 2.13 | q=2: II, III, IV, I₁*, IV*, III*, II* | q+1=3; 2q+1=5; 3q+1=7; 6q+1=13; 7q+1=15; 8q+1=17; 9q+1=19, the values in the §6.1 table | Pass |
| 2.15 headline | genus at the pin; constant ℤ/2 torsor | genus = dim H¹(O); a disconnected torsor over F₂ can have no point, so geometric connectedness is used | Pass |
| 2.16 | conic x²+y²+z²=0 over ℝ | a form of P¹ without points: finiteness of the field is needed, as stated | Pass |
| 2.18 / 2.22 headline / 2.23 / 2.24 | all five tuples; (0,0,0,0,0) | Δ=a₃ if a₁=0, Δ=a₆+a₄+a₃(a₄+a₂) if a₁=1; model 1 tuple (1,1,0,1,0): Δ=0+1+0=1, affine solutions {(0,0)}, count 2, j=1; counts 1,2,3,4,5; 8+8=16 smooth tuples; the zero tuple has Δ=0 and count 3 | Pass |
| 2.25 (new Checks) | E₄ P=(1,0); E₅ P=(0,0); E₃ P=(0,0) | multiples (1,0),(0,0),(1,1),∞: order 4, 2P=(0,0); (0,0),(1,1),(1,0),(0,1),∞; (0,0),(0,1),∞: order 3 | Pass |
| 2.29 / 2.30 / 2.31 | n=1,2,3 at q=2 | nonsplit I₁ counts 4,4,10; nonsplit I₂ counts 6,8; E⊗K splits iff [K:k] even; trace +1 at n=2 | Pass |
| 2.37 (new Checks) | q=t²+t+1; q=t²; q=1; q=0 | t∉A_q, qt and q ∈ A_q, t=(qt)/q; t=t³/t² with t²/t illegal; identity; zero ring, no division | Pass |
| 2.47 (new Checks) | k=F₄, Frobenius-twisted transition | a↦a² is not F₄-linear, so the two composites to Spec k differ on the overlap | Pass |
| 3.3 | wild double fibre (P,s)↦(P+τ,s/(1+s)) | s/(1+s)≡s mod s², conormal trivial, (h⁰,h¹)=(2,2), χ=0 | Pass |
| 3.4 | C→E of degree d; d=1 | N∘pullback=[d]; h¹=0 would kill Pic⁰, contradiction with points outside E[d]; d=1 gives C≅E regular | Pass |
| 3.7 (new Checks) | trivial torsor; §3.10 quotient of order n | identity isogeny; A→A/G of degree n equal to the multiplicity | Pass |
| 3.10 (new Checks) | k=F₂, odd n; u²+u=1/s | tame totally ramified Galois of degree n needs Gal ↪ μ_n(F₂)={1}, so none; Artin–Schreier is wild of degree 2 with residue field F₂; E₂/⟨τ⟩ has 2 points hence is E₂ | Pass |
| 4.5 / 4.6 / 4.9 (new Checks) | adjunction; Gram matrix; v_P | −2 = O² + K·O = O² − 1 so O² = −1; det[[0,1],[1,−1]]=−1, inverse [[1,1],[1,0]], projection (D·O+D·F)F+(D·F)O gives O↦O, F↦F; v_P·F=0, v_P·O=0, v_P²=−2−2P·O; U⊕E₈(−1) is even of rank 10 and signature (1,9); P² blown up in 8 points: rank 9, K²=1 | Pass |
| 4.12 (new Checks) | Ext groups on P¹ | H¹(O(2))=H¹(O(3))=H¹(O(1))=0; degree 0−2−3=−5; wrong sign gives +5; at n=1 the map f_*O(O)→O(−1) is zero and O(−1)≅R¹f_*O | Pass |
| 4.14 (new Checks) | model 1 reversed; a₆ of degree 7 | (1,s,s,1,1+s) within weights, Δ′=s⁴, I₄ split at s=0 (node polynomial T²+T splits); s⁷ reverses to s⁻¹ | Pass |
| 4.16 headline | p=5; perfect k | (5−1)/2=2 ∤ 1 so no positive delta; regular over perfect k is smooth, hypotheses contradictory, conclusion vacuous-true | Pass |
| 4.17 | smooth C; §3.10 double fibre | X minimal regular model; no section of X, identity section of J (schroer lines 822–828) | Pass |
| 5.1 | model 4; model 13; E₁ | 17+2+6=25 versus 17+2+4=23 with 2r for nonsplit; 17+4+4=25 versus 23; n(E₁)=1 versus 3 | Pass; R01 for Checks |
| 5.2 (new Checks) | q=2,3; three degree-three points; traces 6, 8, 10 | 25, 40; trace 1+0=1 on the lattice gives 1+2+4=7=#P²(F₂); 1+12+4=17; 1+16+4=21; 25 | Pass |
| 5.8 | Theorem 9.4 hypotheses | (i)–(v) and Σn_a=25 as restated; the count sum is §5.1 | Pass |
| 5.10 (C4)/(C5) arithmetic | r_a+i+r_c = 12 or 11, i≤2, r_c≤2 | (C5): eight solutions (I₂*,IV*)+E₄+Ĩ₂, (III*,I₃*)+E₂+Ĩ₂, (III*,I₃*)+E₄+Ĩ₁, (II*,I₄*)+E₂+Ĩ₁ = the five of (C5) plus the three excluded, r_a≥7; II+E₄+I₉: 3+4+18=25; IV*+E₄+I₃: 15+4+6=25 | Pass |
| 5.13 | 25=5+2m+2n | m+n=10, n≤2, m∈{6,8} forces (8,2); (6,4) violates n≤2 | Pass |
| 6.1 fourteen models | all 14 over F₂[t] | Δ, c₄=a₁⁴, count at t=1, Δ′=s¹²Δ(1/s) and v_∞ recomputed (table below); Ogg consistency Σe(F)+Σδ=12 holds for every model with the wild δ at the listed places | Pass |
| 7.3 N1 | c₂=c₃=1, deg c₁≤1, deg c₄≤4 | Δ=t⁴(1+t³+t³c₁+t⁴c₄) for all 64 pairs; Δ=t⁴ iff (c₁,c₄)=(1,0) (count 4) or (1+t,1) (count 2) | Pass |
| 7.3 N2 | deg d₁≤1, deg c₂≤2 | Δ=t⁸ iff (c₂,d₁)=(t²+t,1), reversing to (1,s,s,1,1+s), or (1+t+t²,1+t), reversing to (1,1+s,s,1,1+s+s²) with a nonsplit node at s=0 | Pass |
| 7.3 N3 | d₁∈{0,1,t,1+t} | Δ=t¹² in all cases; counts 4,2,2,4; d₁=1 is model 7 with E₂ | Pass |
| 7.3 N4 | d₀∈{0,1}, deg f₁≤1 | Δ=t¹⁰(1+tf₁); f₁=1+t gives t¹⁰(t²+t+1); counts 4 (d₀=0) and 2 (d₀=1) | Pass |
| 7.3 N5 | (e₀,d₀)∈{0,1}² | Δ=t⁸ throughout; counts 5,3,1,3 for (0,0),(1,0),(0,1),(1,1); c₁=1+t gives Δ=t⁸(1+t)⁴ | Pass |
| 7.3 N6 (R03 repair) | (e₀,d₀′)∈{0,1}² | counts 3,5,3,1 for (0,0),(1,0),(0,1),(1,1); reversed (a₃′,a₄′,a₆′)=(s,e₀s,d₀′s); (0,1): y²+sy=x³+s singular at the origin, s²∤a₆′, type II, Δ′=s⁴, count 15+3+3=21; (0,0): IV at ∞ | Pass |
| 7.4 / 7.5 / 7.6 / 7.7 | Needs graph; j-invariants | 7.7←{7.4,7.5,7.6}, no cycle; seven j-classes t⁴, t²/(t²+t+1), t², t, 1, t⁸, t⁴/(t²+t+1); degree-four pair separated by pole divisors | Pass |

Fourteen-model recomputation over F₂[t] (Δ from b₂²b₈+b₆²+b₂b₄b₆ with b₂=a₁², b₄=a₁a₃, b₆=a₃², b₈=a₁²a₆+a₁a₃a₄+a₂a₃²+a₄²; count at t=1 from the specialized equation; Δ′=s¹²Δ(1/s)):

| Model | Δ | j | count at t=1 | v_∞(Δ′) | reversed (a₁′,…,a₆′) |
| --- | --- | --- | --- | --- | --- |
| 1 | t⁸ | t⁴ | 4 | 4 | (1,s,s,1,1+s) |
| 2 | t¹⁰(t²+t+1) | t²/(t²+t+1) | 4 | 0 | (1,0,0,s,1+s) |
| 3 | t¹⁰ | t² | 4 | 2 | (1,0,0,s,0) |
| 4 | t¹⁰ | t² | 2 | 2 | (1,1,0,s,0) |
| 5 | t¹¹ | t | 4 | 1 | (1,0,0,0,s) |
| 6 | t¹¹ | t | 2 | 1 | (1,1,0,0,s) |
| 7 | t¹² | 1 | 2 | 0 | (1,s,0,1,0) |
| 8 | t⁴ | t⁸ | 4 | 8 | (1,s,s²,s³,0) |
| 9 | t⁸ | 0 | 5 | 4 | (0,s,s,0,0) |
| 10 | t⁸ | 0 | 5 | 4 | (0,0,s,s,0) |
| 11 | t⁸ | 0 | 3 | 4 | (0,0,s,0,0) |
| 12 | t¹⁰ | t² | 4 | 2 | (1,s²,1,0,0) |
| 13 | t¹¹ | t | 4 | 1 | (1,s,1,0,0) |
| 14 | t⁸(t²+t+1) | t⁴/(t²+t+1) | 4 | 2 | (1,1,s,0,0) |

All fourteen agree with the §6.1 table. The resolved fibre types were not re-derived by blowups this round; their consistency with Ogg's formula (for each model Σe(F)+δ=12 with e(Iₙ)=n, e(Iₙ*)=n+6, e(II,III,IV)=2,3,4, e(IV*,III*,II*)=8,9,10 and the wild δ equal to the excess of v(Δ) at the additive place) was checked for every model and for the N6 negative control (8+2+2=12), and the earlier review's blowup computation stands.

**Shape.** The README has the required sections in order, prose targets with locators, `### Examples` and `### Dependencies` in every layer, Unicode mathematics, no LaTeX delimiters, no process words, no pull-request numbers (the gate's scanners agree). Constructions with one Check are R01; the Layer 6 numbering is R02.

## Not verifiable

- **Shioda (1990), §1 (§4.8):** the sources service finds no legal copy (recorded in `needs-references.toml` under `shioda`, as in the previous round). The general-base Picard form is derived from §4.7 in the README, so nothing is imported from the unread text; the locator itself was not read.
- **William E. Lang (2000), Communications in Algebra (§5.10, §7.3):** paywalled, cited by DOI and uncertified; (C1)–(C6) are stated as independent targets, so the exclusions I₃*+E₄+I₂, I₂*+E₄+I₃, I₄*+E₄+I₁ and IV*+E₂+I₄ in (C4), which the 25-point count and Ogg's formula do not exclude, rest on that target's own proof.
- **Hartshorne, Chapter V, Prop. 3.2–3.3, "Theorem 3.4", Cor. 3.5 (§4.0); Kac, Chapter 4, Theorems 4.3 and 4.8 (§2.5):** no open text. The Picard and intersection comparison was checked by computation (rank+K²=10, E²=−1), and the affine ADE matrices and marks against the pinned `AffineDynkinType` file instead.
- **Lang (1956):** JSTOR record is the legal locator; the content was checked through ReductiveGroupsPartII's prose target *lang-theorem* at its line 5204.
- **Milne LEC §16, Theorem 23.2, Lemma 33.2 (§5.0); Cossec–Dolgachev–Liedtke 2024 (§§4.11, 4.16); Bombieri–Mumford (§§4.1–4.3); Raynaud 1970 (§§3.2–3.3); EGA IV₄ 18.5.11 (§3.1); Liedtke (§6.1); Szydlo; Temkin–Tyomkin (§§1.9–1.11); Stacks tags other than 07T8:** open copies exist but were not re-read this round; the statements attributed to them were checked by computation (table) and the previous two reviews read Temkin–Tyomkin, Raynaud, Bombieri–Mumford and the Stacks tags 00DF, 0C5X, 0C5R at the cited places.

## Source issues

- **Error** in schroer at Theorem 10.5 proof, printed p. 32 (lines 1445–1446): the source says only e₀=d₀′=0 in y²+t²y=x³+t³e₀x+t⁵d₀′ yields the fibre E₃ at t=1; it should say (0,1) also gives E₃ there and is excluded by its wild type-II fibre at infinity; affects the proof.
- **Error** in schroer at Proposition 9.3(v) proof, printed p. 25 (lines 1127–1128): the source says Br(F)=0 by Tsen for F=F₂(t); it should restrict to algebraically closed constants or use the zero section; affects the proof (corrected by §§4.8 and 4.18 here).
- **Gap** in schroer at Theorem 10.4 proof, printed p. 31 (lines 1372–1376): the source says the twisted semistable case is "similar" and lists two configurations; it should list the five of (C5), three of which give models 12–14; affects a stated result (completed by §§5.10 and 6.1 here).
- **Misprint** in schroer at Theorem 10.4 proof, printed p. 30 (line 1365): the source says r_a ≥ 3 for r_a = 7; it should be r_c ≥ 3; affects the proof.
