# Review of GlobalGaloisDeformations (pull request #920 at b0adf32)

**Verdict:** needs changes

The mathematics of the roadmap holds up under the sampled source checks and the adversarial pass: every one of the fifteen sampled targets matches its source at the stated locator, the two Lean statements are true at the stated generality (one of them more general than its source, with a proof recorded below), and the numerical identities of Layers R04.3–G7 recompute correctly. What blocks acceptance is a cluster of supplier declaration names that do not exist in the suppliers (R01), together with the failing gate (the residue rule on anchor tags, R02). The remaining findings are repairs of a Check, of link fragments and of one unsourced attribution.

## R01 (P2) — Five cited supplier declarations do not exist in the cited suppliers

Location: `TauCetiRoadmap/GlobalGaloisDeformations/README.md` lines 83, 93, 98, 308, 429, 1174, 1749, 1919.

Claim: the README names Lean declarations as supplied by LocalGaloisDeformationRings, ArithmeticGaloisRepresentations and IntegralHeckeAndGaloisDeterminants, in `*Lean:*` lines and in the supplier contracts.

Witness (each checked against the supplier's README and `Suggested.lean` at the open head):

- line 429, "LocalGaloisDeformationRings §F.2.6 supplies `TFramedLift`, … `TFramedLift.localLift`, `TFramedLift.localLift_smul` and `UnrestrictedTFramedDef`": §F.2.6 defines `TFramedLift` and `UnrestrictedTFramedDef` in prose; the names `TFramedLift.localLift` and `TFramedLift.localLift_smul` occur nowhere in that roadmap.
- line 1919, "LocalGaloisDeformationRings §F.2.9 supplies `exists_unique_nthRoot_of_residue_eq_one`": §F.2.9 states the `n`-th root bijection in prose only; the name occurs nowhere in that roadmap (its `Suggested.lean` has 105 lines, none with `nthRoot`).
- lines 83, 308, 1749, `Determinant.exists_ofMatrix_eq_of_henselian`: IntegralHeckeAndGaloisDeterminants §1.3 names this result `Determinant.exists_realization_of_henselian` (its `*Lean:*` line).
- lines 93 and 1174, `GL2Subgroup.sl2_submodules_charTwo`: ArithmeticGaloisRepresentations §4.7 states the target as **Characteristic two** with no Lean name; ArithmeticGaloisDuality cites it as "§4.7 / **Characteristic two**".
- line 98, `GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`: ArithmeticGaloisRepresentations §7.2 states **Schur's lemma over a local ring** with no Lean name.

The statements themselves exist in the suppliers; only the names are invented, so an implementer searching the suppliers for them finds nothing. The worker's citation scan already lists all five as "found nowhere".

Repair: replace each name by the supplier's actual name or target title: `Determinant.exists_realization_of_henselian`; "ArithmeticGaloisRepresentations §4.7, *Characteristic two*"; "ArithmeticGaloisRepresentations §7.2, *Schur's lemma over a local ring*"; and in §3.3 and §7.4 cite §F.2.6 and §F.2.9 by their prose statements (the invariant local lift `α_v⁻¹ρ|_{G_v}α_v` and the `n`-th root bijection on `1 + 𝔪_A`), keeping `TFramedDef.localLift` as this roadmap's own target.

## R02 (P3) — Gate: 47 `<a id=` anchor tags fail the residue rule

Location: `TauCetiRoadmap/GlobalGaloisDeformations/README.md` lines 137, 149, 405, 440, …, 2195 (the gate lists them).

Claim: the gate's residue rule forbids `<a id=` anchor tags in the README; the worker's gate reports `residue=47 … FAIL`.

Witness: `gate GlobalGaloisDeformations: … residue=47 … FAIL`; e.g. line 405 `<a id="global-deformation-type"></a>`. Only three READMEs on main use such tags.

Repair: delete the anchor lines and cite targets by section number in prose and in `*Needs:*` lines (as the sibling roadmaps on main do); where an intra-document link is wanted, use the heading's own fragment. The gate must pass before acceptance.

## R03 (P3) — Dependency check line, judged a false positive

Location: the dependency check output (below), line `UPWARD: GlobalGaloisDeformations (#82) -> ClassFieldTheory (#254) at README lines [315, 317, 972, 1058, 1098, 2142]`.

Claim: the check reports an upward edge to ClassFieldTheory.

Witness: ClassFieldTheory is on the content repository's main branch (`TauCetiRoadmap/ClassFieldTheory/README.md`), and the three layers cited there exist on main: `### Layer 5: local coefficients, the Brauer group, the local invariant, and duality` (with `finite_H`), `### Layer 7: the absolute local Artin map, …`, `### Layer 12: separate arithmetic global existence, the norm index, and the global correspondence`. The merge order's own header allows consuming roadmaps on main; the entry at #254 is the open revision pull request, which is never a dependency.

Repair: none in the README; the board settles the tool's line. I record it so that the failing `depcheck=1` is not read as a design defect.

## R04 (P3) — Check **dyadic_count_identity** displays arithmetic that does not evaluate

Location: `TauCetiRoadmap/GlobalGaloisDeformations/README.md` line 1278, "At `|S| = 3`, `|Q_n| = 0`, it truncates `t` to `0` and gives `0 + 11 + 0 − 9 = 2 ≠ 1`."

Claim: the Check is meant to show that natural-number truncation of `t = 2 − |S| + |Q_n|` breaks identity (8).

Witness: substituting (4) and (7) into (8) gives `(2 − Σ + 2|Q| − (2 − |S| + |Q|)) + (Σ − 1) = |Q| + |S| − 1`, so at `|S| = 3`, `|Q_n| = 0` the correct value is `2`; with `t` truncated to `0` the left side is `(2 − Σ) + (Σ − 1) = 1`. The displayed numbers `11` and `9` correspond to nothing in the identity, and the inequality is written the wrong way round (the truncated version gives `1`, the true value is `2`).

Repair: write the Check as: "at `|S| = 3`, `|Q_n| = 0`, the true `t` is `−1` and (8) evaluates to `2 = |Q_n| + |S| − 1`; truncating `t` to `0` gives `1 ≠ 2`."

## R05 (P3) — Three cross-roadmap link fragments point at anchors that do not exist

Location: `TauCetiRoadmap/GlobalGaloisDeformations/README.md` lines 86–87 and 1713–1714 (`#residual-and-torsion-hecke-eigenclasses`, `#hecke-and-diamond-normalization-for-gl₂`), line 1764 (`#uniqueness-and-gluing-of-continuous-determinants`).

Witness: AutomorphicFormsOnReductiveGroups has headings `### 5.8 Residual and torsion Hecke eigenclasses` and `### 7.3 Hecke and diamond normalization for GL₂` but its explicit anchors near them are `anemic-eigensystems`, `galois-anemic-eigensystem` and `arithmetic-hecke-normalization`; IntegralHeckeAndGaloisDeterminants has `### 4.1 Uniqueness and gluing of continuous determinants` and no explicit anchor, so the heading fragment is `#41-uniqueness-and-gluing-of-continuous-determinants`. The sections exist; the fragments are dead.

Repair: use the heading fragments (`#58-…`, `#73-…`, `#41-…`) or cite by section number without a link, as the other citations in the same bullets do.

## R06 (P3) — Unsourced attribution in §6.7

Location: `TauCetiRoadmap/GlobalGaloisDeformations/README.md` line 1705, "This universal-property interface uses prior art from the Imperial College London FLT project through the deformation functors of LocalGaloisDeformationRings Layer F."

Claim: the sentence attributes the interface to an external project.

Witness: the project is not among the References and no locator is given; every other claim in the paragraph carries one (KW final, Lemma 9.1; Chenevier, Example 3.4).

Repair: either cite the specific blueprint section with a locator under References, or delete the sentence (the mathematical content is already sourced).

## Verified sound

**Gate and build.** The worker's gate at b0adf32 fails only on `residue=47` (R02) and `depcheck=1` (R03); `build=0`, `sorry-data=0`, `set_option=0`, `imports=0`, `readme-ids-missing=0`. I elaborated a scratch copy of `Suggested.lean` with `#check @name` for its three declarations: the elaborated types carry exactly the binders of the source (`[IsLocalRing A] [Finite (ResidueField A)] [CharP (ResidueField A) 2]` on the twisting theorem; `[NumberField F] [FiniteDimensional k H]` on the selection theorem), so no section variable was lost, and both match the README's generality (§4.10: "every local ring with finite residue field of characteristic two"; §5.6: finite-dimensional `k`-space, finite Galois quotients, residue degree one). `sorry` is the only warning on the original file.

**Dependency check** (run as instructed):

```text
not movable: GlobalGaloisDeformations consumes ClassFieldTheory (#254) and is consumed by SelmerIwasawaCohomologyPartII (#183), which comes first: moving GlobalGaloisDeformations after ClassFieldTheory would put a supplier after a consumer, a cycle through GlobalGaloisDeformations
UPWARD: GlobalGaloisDeformations (#82) -> ClassFieldTheory (#254) at README lines [315, 317, 972, 1058, 1098, 2142]
depcheck: 163 roadmaps, 1160 edges, 1 problem(s)
```

No CYCLE line. The UPWARD line is R03 (ClassFieldTheory is on main). All other suppliers (LocalGaloisDeformationRings #82 immediately above at #82/#83, ArithmeticGaloisRepresentations #47, ArithmeticGaloisDuality #48, SelmerIwasawaCohomology #57, IntegralHeckeAndGaloisDeterminants #28, AutomorphicFormsOnReductiveGroups #73, SchemeAndStackFoundations #2) precede this roadmap. No edit outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Principles.** No route-specific shortcut (all statements are for general `F`, `n`, `p`, with the dyadic and odd cases kept separate and both built); no re-planning (the generic deformation framework is imported from LocalGaloisDeformationRings Layer F by section, the coefficient categories from SchemeAndStackFoundations §§4.2–4.4, the complexes from SelmerIwasawaCohomology §§2A.3–2A.4); no copied passages (every sampled statement is paraphrased); no algorithm; no sorry'd data; no `set_option`; no pull-request numbers in the README. `GlobalGaloisDeformationsPartII` appears in the merge order but has no folder on main or in any open pull request, so there is no second owner of these objects; ownership against the open pull requests listed in the brief was checked by object (global framed rings, twisting torsors, Taylor–Wiles data) through the roadmap index and found none.

**Sources: the seeded sample (15 targets), each read at the locator.**

| Target | Locator | Found |
| --- | --- | --- |
| 3.4 | Gee, Lemma 3.22, p. 15 | representability of `T`-framed type-`𝒮` deformations, proof by CHT Prop 2.2.9; hypotheses (absolutely irreducible `ρ̄`, `Φ_p`) as stated |
| 3.6 | Gee §3.23 pp. 15–18, Prop 3.24(1) p. 18; KW ESI Lemma 4.3 printed p. 31 | the complex with `C⁰(G, ad)` in degree 0 and `ad⁰` above, local degree 0 only at `T`; tangent isomorphism; KW's count with `δ_p` |
| 3.8 | Gee Prop 3.24(3) p. 18; KW ESI Prop 4.4 p. 32; KW final Prop 4.5 p. 42, Cor 4.7 p. 45 | Gee's bound equals the README display term by term; KW: `dim R̄^ψ_S ≥ 1`, `abs.dim R̄^{□,loc,ψ}_S = 1 + 3|S|` (p. 45) |
| 4.4 | KW final Lemma 7.10 p. 69; BLGGT Lemma 1.2.3(2) p. 16 | finite-order twist after a totally real solvable (cyclic) base change, `p = 2` via Grunwald–Wang; twisting finiteness |
| 4.5 | KW final §2.5 p. 12, Prop 2.8 p. 14 | diagonalizable group as completion at the identity of the special fibre, `p`-power torsion; `T_{p^m}^{[m+1]} ≅ T^{[m+1]}` from `(1+X)^{p^m} − 1 ∈ (p, X)^{m+1}` |
| 4.11 | KW final Prop 9.3 proof pp. 84–87, Lemma 9.4 p. 87 | `d(tx′) = t²d(x′)`, `X_∞ = {d = 1}`, `R_∞` a `T₂`-torsor over `R^inv_∞`, dimension count in Lemma 9.5 |
| 5.5 | KW final Prop 5.11 and Lemma 5.12 p. 53 | "p may be odd or even"; `γ_{α_v}|_{I_v} = γ_{β_v}|_{I_v}⁻¹`, `𝒪[Δ′_Q]`-structure, augmentation quotient; `a_χ ∘ δ = χ(δ)(δ ∘ a_χ)` |
| 6.4 | KW final Prop 9.2 proof, display (∗∗) p. 82; Gee p. 39 | `h + j − d` generators, `𝒪[[y]]`-structure with `y_i ↦ δ_i − 1`; Gee: `b_N ⊆ ((1+y_i)^{p^N} − 1)` |
| 6.6 | KW final Prop 9.3 (I)(3) p. 84, proof pp. 84–87 | `G′_n = G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t`, `ℤ^t ↠ G_n` compatible, `d = det ρ·(χ_pψ)⁻¹`, level `n + a`, `a ≥ 2`, `2h + 1 = h + j + t − d` |
| 6.7 | KW final Lemma 9.1 pp. 80–81; Chenevier Example 3.4 p. 42 | charpoly `X² − T_v X + N(v)ψ(π_v)` at arithmetic Frobenius; surjectivity via points and traces |
| 7.3 | ACC v2 §6.2.22, Prop 6.2.24 pp. 143–146; published Prop 6.2.25 printed p. 1041 | `g` formula identical term by term; `T` nonempty, `Λ_v = 𝒪` off `T`; `h⁰_{S,T} = 0` |
| 7.4 | ACC v2 §§6.1–6.2 opening pp. 135–136 | "we do not fix the determinant", `p ∤ 2n`, `Λ_v ∈ CNL_𝒪` |
| 8.1 | CHT Lemma 2.1.1 p. 7; Defs 2.2.1, 2.2.7 pp. 17, 21; §2.3 p. 26 | the two triple identities verbatim in content; `ν(j) = −1`; `F(S)/F⁺` may ramify outside `S` where `F/F⁺` does; `S̃` |
| 8.2 | CHT Prop 2.2.9 pp. 22–24 | Schur `r̄`; `R^univ[[X_{q,i,j}]]_{q∈T} ≅ R^{□T}` with `n²|T|` variables (no scalar removed; Lemma 2.1.11) |
| 8.4 | CHT Cors 2.2.12, 2.2.13 p. 25, 2.3.5 p. 32 | both displayed formulas of §8.4 identical to Cor 2.3.5; liftability hypothesis for the relation bound |

Also opened: KW final §4 p. 37, §4.1.1 pp. 37–38, Prop 4.1 p. 38, Lemma 4.6 pp. 43–45, §5.1 p. 46, Lemma 5.1 pp. 46–47, Lemmas 5.2–5.4 and Prop 5.5 pp. 47–48, §5.5.1 Prop 5.6 and Lemmas 5.7–5.9 pp. 48–50, Lemma 5.10 pp. 50–53, §9.1.1 pp. 78–79, §10.1 p. 91, §2.1 p. 6, §2.4 Props 2.5–2.7 pp. 10–14; Gee Exercises 3.9, 3.11, Cor 3.12, Lemma 3.13, Cor 3.14 pp. 13–14, §3.18–3.19 p. 15, Thm 5.2 p. 29, §§5.5–5.6 p. 33, Prop 5.10 pp. 38–39, p. 40 (`dim R_∞ = 4#T + r`); CHT Lemmas 2.1.3 p. 9, 2.1.8–2.1.11 pp. 13–15, 2.2.8 p. 22, 2.2.11 p. 24; ACC v2 Def 6.2.2 p. 136, Thm 6.2.3 and Lemma 6.2.4 p. 137, Lemma 6.2.19 p. 143, Def 6.2.28, Lemma 6.2.29, datum p. 149, Lemma 6.2.31 pp. 149–151, Prop 6.2.32 p. 151; ACC published: printed = PDF + 896 confirmed on ten pages, renumbering (6.2.29, 6.2.32, 6.2.25, 6.2.33) confirmed, Artin map normalised to geometric Frobenius on printed p. 906; BLGGT Lemma 1.2.3 pp. 16–17 (proof via the nilpotent trace polynomial as in §4.2); Chenevier Cor 1.14 p. 14, Thm 2.22 p. 34, Example 2.32 p. 38; Taylor Lemma 2.5 pp. 749–750; Kisin Lemma (1.3.1), Thm (1.4.1), Remark (1.2.2). The ESI numbering note (Lemma 4.3 / Prop 4.4 / Lemma 4.5 ↔ final 4.4 / 4.5 / 4.6, PDF page = printed + 1) is correct.

**Cross-roadmap citations resolved** (at the open heads, or on main for ClassFieldTheory, Chebotarev, LocalGaloisGroups, ModularCurves): all 18 LocalGaloisDeformationRings anchors cited (`completed-coefficient-products`, `minimal-relative-presentations`, `local-deformation-problem`, `restriction-of-deformations`, `fixed-determinant-functors`, `strict-deformation-functor`, `deformation-problem-ideal`, `universal-deformation-ring`, `fixed-determinant-rings`, `phi-p-global`, `universal-lifting-ring`, `framed-unframed-comparison`, `carayol-trace-theorem`, `change-of-residue-field`, `change-of-coefficients`, `lifting-functor`, `strict-vs-full-conjugacy`, `determinant-comparison-isomorphism`) exist; its sections F.0.1–F.0.2, F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2, F.4.12, 1.1, 1.10, 1.11, 1.14, 1.15, 2.5, 2.9, 2.10, 2.16, 2.23, 3.8, 8.2, 8.17 and its names `UnrestrictedTFramedDef`, `KWCondition.points`, **traceGen_framed_fails** exist. ArithmeticGaloisRepresentations §§1.2, 4.6, 4.7, 5.10, 7.2, 7.4, 7.10 and `GaloisRep.IsBadDihedral`, `GaloisRep.carayol_conj_of_trace_eq`, `ContinuousRep.ad`, `adZero`, `CHTGroup`, `ResidualImage.IsEnormous` exist; its §7.10 definition (no `p`-power quotient, `H⁰ = H¹ = 0` on `ad⁰`, regular semisimple detector per simple submodule) is exactly what §8.6 restates. ArithmeticGaloisDuality Layers R02.2–R02.6, D7, D8.1, §R02.5.1 *The Greenberg–Wiles formula*, §D7.7, and the ten named targets exist; its *Dyadic auxiliary primes* target states `|Q_n| = h¹(S, ad) − 2`, `h¹ = 2 − Σ_S h⁰ + 2|Q_n|`, `t = 2 − |S| + |Q_n|`, matching §5.4 (1)–(7); its *Odd-prime* target gives the count `|Q_n| + |S| − 1` used in §5.8; its *Archimedean adjoint dimensions* gives `h⁰(G_v, ad⁰) = a² + b² − 1` used in §3.8. SelmerIwasawaCohomology Layer 2, §2.2, §2.21, §2A.3, §2A.4 exist with the stated titles; §2A.4 derives the trace mapping fibre exactly as §3.6 assumes (`tr(E₁₁) = 1`, valid for `p | n`). IntegralHeckeAndGaloisDeterminants Layers 0–1, §1.3, §4.1, `coefficient_descent`, `Determinant.existsUnique_isCoefficientChange_of_compact` exist. AutomorphicFormsOnReductiveGroups §7.3 gives the arithmetic polynomial `X² − a_p X + χ(p)p^{k−1}` with `s_p = χ(p)p^{k−2}`, i.e. `X² − t_v X + Nv·s_v` as §6.7 requires. SchemeAndStackFoundations §§0.16, 0.20, 0.21, 4.2, 4.3, 4.4 exist and the three heading fragments used resolve. DeformationAndDerivedPatchingAlgebra §1.12 and §§2.1–2.7 exist. ClassFieldTheory Layers 5 (with `finite_H`), 7, 12; Chebotarev Layers 10 and 11.3 (the four discard estimates); LocalGaloisGroups Layer 3; ModularCurves 0C exist on main.

**Library declarations at the pins** (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`, both equal to `lake-manifest.json`): `Matrix.GeneralLinearGroup.scalar`, `scalar_commute`, `map`, `det` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`), `MonoidHom.noncommCoprod`, `Ideal.inertiaDeg` (`Mathlib/RingTheory/RamificationInertia/Inertia.lean` line 44: `finrank` of residue fields, junk `0` off primes; `v.asIdeal` is prime, so the Lean's `inertiaDeg ℤ = 1` is the absolute residue degree), `IsLocalRing.residue`, `Continuous.matrix_mul`, `Continuous.matrix_map`, `MulAction.orbitRel`, `IsAdicComplete`, `Algebra.FormallySmooth`, `DualNumber`, `OpenSubgroup`, `ProfiniteGrp`, `ContinuousMonoidHom`; Tau Ceti `NumberField.Chebotarev.frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` line 93: primes unramified in `L` with Artin class `C`), `FiniteGaloisIntermediateField.instNumberField`, `Representation.charTwist` and its four lemmas, `TauCeti.ContCohomology.Z1/B1/H1`, `B1_le_Z1` (line 669), `TauCeti.IsTopologicallyFinitelyGenerated` (Generation.lean line 73) with `of_openSubgroup` and `finite_monoidHom_isOpen_ker`, `maximalProPQuotient`, `continuousZModDual`, `finite_continuousZModDual`, `topologicalGeneratorRankNat_le_of_openSubgroup`, `IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`, `DiagonalizableGroup.pointEquiv` (Basic.lean line 129), `pointsMulEquiv`, `completedGroupAlgebra`; all ten Tau Ceti module paths named in the supplier contracts exist.

**Headline theorems and padding.** The README's end theorems are the presentation and dimension bound (§§3.7–3.8), the Taylor–Wiles systems (§§6.4, 6.6) and the presentations of G8 and G7 (§§7.3, 8.4). None is statable at the pins (no deformation functors, coefficient categories or Selmer complexes exist there), and the module docstring says which and what each lacks. The file states two theorems the roadmap proves on native carriers: the dyadic twisting freeness of §4.10 and the Chebotarev selection of §5.6, with one real-bodied definition `twist` (`scalar (χ g) * ρ g`, confirmed by `rfl` and entrywise by `simp` on the scratch copy). One-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`) on scratch copies of both theorems leave the goal open; neither restates a definition, mirrors a Check or computes a value. No padding.

**Adversarial table** (values computed on each side; "no change" means the statement survived).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `twist n χ ρ` | `n = 0`; `n = 1`; `χ = 1` | `GL (Fin 0) A` trivial, twist trivial; `n = 1`: `χ(g)ρ(g)` in `Aˣ`; `χ = 1`: `scalar 1 * ρ g = ρ g` | correct, real body | none |
| `character_eq_one_of_dyadic_self_twist` | `A = 𝔽₄[ε]`, `G = SL₂(𝔽₄) × C₂`, `χ(z) = 1 + εa` | twist at `z`: `(1+εa)I`; conjugate of `ρ(z) = I` is `I`; forces `a = 0` | true | none |
| same | `A = ℤ/4[ω]`, `χ = −1` | needs `tr ρ̄(g) = 0 ∀g`; order-3 element of `SL₂(𝔽₄)` has trace `ω + ω² = 1 ≠ 0` | no self-twist | none |
| same, hypothesis test | dihedral `ρ = Ind θ`, conjugator `diag(1,−1) ≡ 1 mod 2` | `ε_H ⊗ ρ ≅ ρ` strictly, `ε_H ≠ 1` | nonsolvable hypothesis necessary; image solvable so excluded | none |
| same, general local `A` (not Noetherian) | `U = 1 + N`, normalise `U₁₁ = 1`; `J = (entries of N)` | `f(g)ρ(g)U = [N, ρ(g)]` gives `(f) ⊆ J`; mod `𝔪J`: `N̄ − Ad(ρ̄(g))N̄ = f̄(g)·1`, `f̄` a hom to `J/𝔪J`, zero on perfect `SL₂(𝔽_{2^r})` (Dickson, finite `k`), `N̄` scalar by Schur, `N̄₁₁ = 0` so `N̄ = 0`; `J = 𝔪J`, `J` f.g. ⇒ `J = 0` ⇒ `U = 1` ⇒ `f = 0` | true at the Lean's generality (no completeness, continuity or Noetherianity needed) | none |
| `exists_primes_jointly_injective` | `q = 0` | `finrank ≤ 0` ⇒ `H = 0`; `Q = ∅`, card `0`, injective | true | none |
| same | `H = k²`, `loc_{v₁}, loc_{v₂}` the coordinates | joint kernel `0`; one coordinate repeated: kernel `k` | induction must pick a prime detecting a kernel class | none |
| same, degree-one clause | `F ≠ ℚ`, `L = F`, `C` trivial | `frobeniusPrimeSet F F C` = all primes, includes degree `> 1`; degree-one primes have density `1` (Chebotarev 11.3(2)) so the Chebotarev set minus `E ∪ B ∪` chosen still infinite | true | none |
| same, vacuity | `admissible = ∅` | `detect` false if `H ≠ 0`; `padding` false; hypotheses not satisfiable, statement not vacuous | fine | none |
| 3.4 framed variables | `n = 1`, `T = ∅`; `n = 2`, `|T| = 2` | `0`; `4·2 − 1 = 7` (LGDR §F.2.6 **framed_vars_T**) | agrees | none |
| 3.6 formula | `n = 1`, `T ≠ ∅` | `h¹_rel = |T| − 1`; direct: coker(`k → k^T`) has dim `|T| − 1` | agrees; Gee's p. 18 display gives `#T` (source error, below) | none |
| 3.6 Euler characteristic | general `n`, `T ⊇ {v|p}` | `χ_rel = 1 − |T| + Σ_{v|∞}h⁰(ad⁰) − Σ_{S∖T}(dim L − h⁰)`; solving gives the README display | derived independently | none |
| 3.6 `relTangent_T_empty` | `T = ∅`, `p ∤ n` | `H⁰_rel = k`, `d⁰(C⁰(ad)) = d⁰(C⁰(ad⁰))` so `im δ_G = 0` | agrees | none |
| 3.6 `relTangent_dyadic_odd_rank` | `p = 2`, `n = 3`, trivial `C₂`-action | `tr I₃ = 1`; `dim ad⁰ = 8`; periodic maps `1 + c = 2 = 0`, `c − 1 = 0` | agrees | none |
| 3.8 bound | `F = ℚ`, `S = {p}`, `d_p = 5` | `1 + (5 − 4) − 1 − 0 = 1` | agrees with Gee 3.24(3) | none |
| 3.8 KW convention | `F = ℚ`, `S = {p, ∞}` | local tensor dim `1 + 4 + 2 = 7`; `g − r = |S| − 1 = 1`; `dim R^□ ≥ 8`; minus `7` frames ⇒ `≥ 1` | agrees with KW p. 45 | none |
| 4.1 `resRing_not_flat` | `G = ℤ_p ⋊ {±1}`, `p` odd | `[s, x] = x⁻²`, `2ℤ_p = ℤ_p`, `G^{ab} = ℤ/2`, no `1 + 𝔪`-valued character; map `𝒪⟦Y⟧ → 𝒪` | finite, not flat | none |
| 4.4 `twist_det`, `twist_no_root_p2` | `2 × 2`; `μ` of order `2` | `det(cM) = c² det M`; `ν² = μ` forces `ν(g)² = −1` for some `g`, order `4` | agrees | none |
| 4.5 truncation | `p = 2, m = 1`; `p = 2, m = 2` | `(1+X)² − 1 = 2X + X² ∈ (2,X)²`; `(1+z)⁴ − 1 = 4z + 6z² + 4z³ + z⁴ ∈ (2,z)³`; general: `v_p(C(p^m,j)) = m − v_p(j)`, `j − v_p(j) ≥ 1` | agrees with KW Prop 2.8 | none |
| 4.6 `freeQuot_torus_on_itself`, `freeQuot_not_free` | `Ĝ_m^t` on itself; `μ_p` on `𝒪⟦x⟧` | `dim 𝒪⟦x₁..x_t⟧ = t + 1 = 1 + t`; coaction `x ↦ x(1+T)`, invariants `𝒪⟦x^p⟧` since `(1+T)^j = 1` in `𝒪[ℤ/p]` iff `p | j`; origin fixed | agrees | none |
| 4.7 `chunks_not_untruncated` | `T = Ĝ_m`, `d(t) = t²` | fibre `d = 1` is `T[2]`; `t ∉ T[2]` moves it to `d = t²` | agrees | none |
| 4.8 `fixedDet_cyclic_four` | `G_V = C₄`, point `(i,1)`, `(i,−i)` | `i⁴ = 1`; `d = i·1 ≠ 1`; `d = i·(−i) = 1` | agrees | none |
| 4.8 `twisting_infinite_V` | `ℚ`, `p = 2`, `ℓ ≡ 1 (8)` | `ℚ(√ℓ)` split at `2` and `∞`, ramified only at `ℓ` | infinite quotient | none |
| 4.10 `twistFree_trace_unit` | `U = [[1,1],[0,1]]`, `L = [[1,0],[ω,1]]` | `UL = [[1+ω,1],[ω,1]]`, trace `ω`; `(1+εa)ω = ω` iff `a = 0` | agrees | none |
| 4.10 `twistFree_A5` generation | `diag(ω,ω²)` conjugating `[[1,b],[0,1]]` | commutator `[[1,(ω²−1)b],[0,1]]`, `ω² − 1 = ω`, so all unipotents are commutators | perfect | none |
| 4.11 torsor | `γ = 0`; `γ = 1`; `p` odd | `R = R′`; `𝒪⟦x⟧` free of rank `2` over `𝒪⟦y⟧`, `y = 2x + x²`; squaring bijective on `1 + 𝔪` | agrees with KW Lemma 9.4 | none |
| 5.1 `twDatum_residue_extension` | `p = 3`, `k = 𝔽₃` | admissible Frobenius has `det = Nv ≡ 1`; `(1,−1)` has product `−1`; `[[0,−1],[1,0]]`: `X² + 1`, roots `±i ∈ 𝔽₉`, product `1` | agrees | none |
| 5.1 `delta_quotient` | `Nv ≡ 1 (p^N)` | `Δ_v` cyclic of order `p^a`, `a ≥ N`, so `Δ_v/p^N ≅ ℤ/p^N` | agrees | none |
| 5.3 `chebyshev_four`, `kummer_root_exponent`, `y_relation` | `R₄`; `ℚ(ζ₈)`; `n = 2` | `R₄ = 2(2X²−1)² − 1 = 8X⁴ − 8X² + 1`, `R₄(0) = 1` (KW p. 50: `R_n(0) = 1`, `n ≥ 4`); `[ℚ(ζ₈, 2^{1/8}) : ℚ(ζ₈)] = 16/4 = 4`, `(1/2)^{1/4}` degree `2`; `x₂ = 0`, `y₂ = 1/2 = (√2/2)²` | agrees | none |
| 5.4 (8) | symbolic; `|S| = 3`, `|Q| = 0` | `(2 − Σ + 2|Q| − t) + (Σ − 1) = |Q| + |S| − 1` with `t = 2 − |S| + |Q|`; `t = −1` gives `2`; `t` truncated to `0` gives `1` | identity true; Check's displayed numbers wrong | R04 |
| 5.4 (3) | distinct Frobenius eigenvalues | centraliser of `diag(α,β)` in `M₂` is diagonal: `h⁰(D_v, ad) = 2` | agrees | none |
| 5.5 `augmentation_not_square` | `ℤ₃⟦z⟧/((1+z)³−1)` mod `z²` | `(1+z)³ − 1 ≡ 3z`, so `z ≠ 0`, `3z = 0` | agrees | none |
| 5.7 `r` | `h¹ < 1 + [F:ℚ] − |T|` | `r = 1 + [F:ℚ] − |T| > dim H`; padding used | agrees with Gee Prop 5.10 | none |
| 5.7 proof | `Im ρ̄ ⊇ SL₂(𝔽_p)`, `p ≥ 5` unramified | `(Im ad ρ̄)^{ab}` of order `≤ 2 < 4 ≤ [F(ζ_p):F]` | `ζ_p ∉ F^{ker ad ρ̄}` | none |
| 5.8 counts | `F = ℚ`, `|Q| = q` | KW `S = {p,∞}`: `q + 1`; Gee `T = {p}`: `1 − 1 − 1 + q = q − 1`; difference `2` = archimedean relative dimension | agrees | none |
| 5.8 Gee count | `Q_N` relaxed, `T` framed | each `v ∈ Q`: `h¹ − h⁰ = h² = h⁰(ad⁰(1)) = 1`; real: `1`; total `|T| − 1 − [F:ℚ] + r` | agrees with Gee p. 38 | none |
| 6.1 `relDim_formula` | totally real `F` | `3|S_f| + [F:ℚ] + 2[F:ℚ] = 3(|S_f| + [F:ℚ]) = 3|S|` | agrees | none |
| 6.4/6.5 numerology | odd; dyadic | `h + 4|S| − 1 − 3|S| = h + |S| − 1`; `h + 4|S| − 1 + 2 − |S| + h − 3|S| = 2h + 1`; `1 + h + j + t = 2 + 3|S| + 2h = 1 + d + (2h + 1)`; Gee: `1 + 3|T| + [F:ℚ] + r − [F:ℚ] + |T| − 1 = 4|T| + r` | agrees with KW pp. 82, 86 and Gee p. 40 | none |
| 6.4 relations | `|Δ_{v_i}| = p^n m` | `(1+y)^{p^n} − 1` divides `(1+y)^{p^n m} − 1` | agrees with Gee p. 39 | none |
| 6.7 `hecke_galois_normalization` | `Nv = 11`, `det = 1` | `Nv·s_v = 1` ⇒ `s_v = 11⁻¹`; `s_v = 1` gives `11` | agrees with AFRG §7.3 and KW p. 80 | none |
| 7.3 `g` | general | `χ_rel = Σ_{v|∞}h⁰(ad) − Σ_{S∖T}(dim L − h⁰)` from Tate's formulas; `h⁰_rel = 0` for `T ≠ ∅`; solving gives the README display | agrees with ACC Prop 6.2.24 | none |
| 7.4 `fixedVar_torsion` | `ℚ`, `p = 3`, `S = {3,7}` | `ℤ₃ˣ → ℤ₃`, `ℤ₇ˣ → ℤ/3`; `(1+Y)³ − 1 ≡ Y³ mod 3` | not formally smooth | none |
| 7.4 `fixedVar_p_divides_n` | `𝔽₃[ε]` | `(1+aε)³ = 1 + 3aε = 1` | no cube root of `1 + ε` | none |
| 8.1 `polarized_symplectic_triple` | `C, S, J` over `𝔽₅` | `JC = [[1,−1],[0,1]]`, `CᵀJC = J`; `JS = diag(1,−1)`, `SᵀJS = −J`; `Jᵀ = −J`; second identity `χ(δ)⟨x,y⟩ = xᵀρ(δ)ᵀJρ(δ)y` holds with `χ = sign`; first identity `⟨x,y⟩ = −yᵀJx` holds, fails with `χ(γ₀) = −1` | agrees with CHT Lemma 2.1.1 | none |
| 8.2 `Φ_p(Γ)` | `U ≤ Γ` open, `p` odd | character trivial on `U ∩ Δ` factors through order `≤ 2`, trivial in `𝔽_p` | agrees | none |
| 8.2 frames | `n = 2`, `|T| = 1`; scalar `c` | `4`; `(c,1)j(c,1)⁻¹ = (c²,1)j`, `c² = 1 ⇒ c = 1` at odd `p` | agrees with CHT 2.2.9 | none |
| 8.3 Euler term | `n = 1`, `χ(c_v) = ∓1` | `(1 ∓ 1)/2 = 0, 1`; `h⁰(c, ad) = n(n + χ(c))/2` (CHT 2.1.3) | agrees | none |
| 8.4 | `n = 1`, `T = S`, totally odd | archimedean term `0`; bound `1 + Σ_T(d_v − 1) − h⁰(ad(1))` | agrees with CHT Cor 2.3.5 | none |
| 8.5 | `n = 1`; `n` general | `Δ_Q = ∏ k(v)ˣ(p)`; `n + (n² − n) = n²` smooth directions | agrees with ACC Lemma 6.2.19 | none |
| 8.7 `g` | `F` CM, `T = S`, `Q` unrestricted | each `v ∈ Q` contributes `h⁰(ad(1)) = n`; complex places contribute `n²[F⁺:ℚ]`; `g = qn − n²[F⁺:ℚ]`; `n = 1`: `q − [F⁺:ℚ]` | agrees with ACC Prop 6.2.32 | none |
| Conventions | arithmetic Frobenius, `X² − t_v X + Nv s_v` | KW p. 80 and AFRG §7.3 both arithmetic; ACC's Artin map geometric, transported by `[u] ↦ [u⁻¹]` in §8.5 | consistent | none |

**Shape.** Every definition carries an API list and at least three Checks (counted: 3.3, 3.5, 4.5, 4.8, 4.9, 5.1, 5.2, 5.6, 6.1, 6.2, 6.6, 6.7, 6.8, 7.1, 8.1, 8.5 each have ≥ 3); every theorem states its hypotheses and a locator; every layer ends with `### Examples` and `### Dependencies`; counts are written in `ℤ` with nonnegativity proved before indexing. The README's generality equals the Lean's for the two stated theorems.

## Not verifiable

- none: every cited source was read from a legal copy (arXiv, Numdam, ESI, EMIS, the authors' pages).

## Source issues

- **Error** in Gee at §3.23, printed pp. 17–18: the source says the degree-zero relative group is the one-dimensional scalar space whenever `ρ̄` is absolutely irreducible, and displays `dim H¹_{S,T} = #T − …`; it should be zero for nonempty `T` (the scalars inject into the framing terms), giving `#T − 1`, as the source's own Proposition 5.10 and 3.24(3) use; affects a stated result (the displayed dimension formula), not Proposition 3.24.
- **Gap** in ACC published at Proposition 6.2.33 (arXiv v2 Proposition 6.2.32), printed p. 1047: the source says a degree-one place forces the rational prime below it to split in `F₀`; it should exclude the finitely many primes ramified in `F₀`, where degree one does not imply splitting; affects the proof (repaired by discarding finitely many primes, as §8.7 does).
- **Gap** in KW final at Lemma 5.1, printed p. 47: the source says one may find `g` with `χ(g) ≠ 1` and `tr ρ̄(g) ≠ 0` without argument; it should note that `ρ̄(ker χ)` still spans `M₂` (its derived subgroup contains `SL₂(𝔽_{2^r})`), so some coset element has unit trace; affects the proof.
