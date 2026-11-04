# FIX-RT-AutomorphicBundlesPartII~2

Two red-team reviews of round 2 were merged: pass a (findings F01–F03) and pass b (findings F01–F06). Pass a F02 and pass b F01 are the same import defect and are settled once. Every other finding is settled in its own section.

## RT-AutomorphicBundlesPartII~2a/F01 (P2) — applied

Old: §7.0(b) said the infinitesimal character "is the only hypothesis of BCGP21 Lemma 2.9.1" and invoked the lemma for every weight. New: the lemma is invoked only for the totally real weights of §8.8 (k_v≡l_v mod 2); for the rational family (a,2), every a≥2, the reducible systems of alternatives (b)–(f) are established by CG20's case analysis (proof of Theorem 7.11), stated case by case with the forced values of a.

Verified: BCGP21 line 1833 states k_v ≡ l_v (mod 2); CG20 lines 2133–2150 handle the rational family without a parity hypothesis. The case analysis was recomputed from the infinitesimal character (3/2,3/2,5/2−a,5/2−a): case (d) forces a=2 and μ of weight 2; case (c) forces a=2 and a dihedral μ of infinitesimal character (1,1) (this is why gap:classical-weight-one-realization is needed); case (b) gives two weight-a forms, the mixed alternative having unequal central characters. Two Checks were added in §7.0 (the (3,2) parity failure with its 2+2 Yoshida alternative; the a=2 versus a=4 occurrence of cases (c)–(d)). §8.7's route and Needs now name the rational case analysis. The headline is not narrowed to even a.

## RT-AutomorphicBundlesPartII~2a/F02, RT-AutomorphicBundlesPartII~2b/F01 (P1) — applied

Old: `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower`; README contract "`ExteriorPower.lean` (line 49)". New: `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`; "`ExteriorPower/Basic.lean` (line 60)".

Verified at the pinned Tau Ceti checkout: the directory `Sheaf/ExteriorPower/` holds `Basic.lean` with `def exteriorPower` at line 60; the other quoted lines (45, 57, 110, 127, 242, 85) were already right. No binder or statement of the Lean file changed. The elaboration and `#check` results are below.

## RT-AutomorphicBundlesPartII~2b/F05 (P3) — applied

Old: README contract "`AlgebraicGeometry.Scheme.Modules.instMonoidalClosed` in `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean` (line 63)". New: "(line 66)".

Verified at the pinned Tau Ceti checkout: `instance _root_.AlgebraicGeometry.Scheme.Modules.instMonoidalClosed` is declared at `TensorProduct.lean` line 66, as the witness says. The same README sentence (line 53) carries the other Tau Ceti locators the finding re-checked; they were right and are unchanged.

## RT-AutomorphicBundlesPartII~2a/F03 (P1) — applied

Old: §4.2 defined ϖ⁻ᵏT from "a proved factorization T=ϖ^k U into a ϖ-torsion-free target" and claimed uniqueness from torsion-freeness. New: the normalization is defined on the sheaf morphism t:p₂*F→p₁*G (C flat over O, G locally free, so p₁*G is ϖ-torsion-free), divided uniquely as t=ϖ^k·u before the fundamental-class and derived-global-section constructions; for a derived arrow, division requires injectivity of ϖ^k on Hom_D(Lp₂*F,p₁!G), which torsion-freeness of the target's cohomology sheaves does not give.

The witness holds: Hom_D((O/ϖ)[−1],O)=Ext¹_O(O/ϖ,O)≃O/ϖ, computed from 0→O→O→O/ϖ→0, and ϖ acts as zero on it. It is now a negative-control Check, with a positive Check on Hom(O,O)=O. The five API bullets, the proof route, the locator (P20 §4.3.1 and Remark 4.3.3, lines 829–842) and the Needs line (§3.1, AlgebraicModuliForArithmeticGeometry §7.5) changed with it; the Layer 4 Dependencies block gained that supplier. No other section divides a correspondence by ϖ (the only other "torsion-free" use, §2.3, is a lifting argument, not a division).

## RT-AutomorphicBundlesPartII~2b/F02 (P1) — applied

Old: a `From TauCetiRoadmap.LanglandsParameterStacks` contract citing "LP3.0" and the gap `integral-dual-weyl-lattices` on it; seven citations "LanglandsParameterStacks LP3.0". New: a `From TauCetiRoadmap.ReductiveGroups` contract on §§9A, 10B (induced module with its function realization and left translation, Weyl module, base change, integral Weyl lattices with the perfect integral evaluation pairing, the §9A divided-power lattice); every citation now reads "ReductiveGroups §10B".

Verified: LanglandsParameterStacks at its open head has no "LP" labels, and its own 4.1 imports these modules from ReductiveGroups §10B; ReductiveGroups is on main and its §10B (README lines 1759–1800) and §9A item 5 (lines 1593–1604) state what the contract now cites. The gap is kept, re-pointed to ReductiveGroups §10B and narrowed to what §10B does not state: the integral induced (dual-Weyl) lattice as the ℤ-dual of the Weyl lattice in the right-B function realization, for the split Siegel Levi, with the symmetric-versus-divided-power identification and base change to the field modules. `design/plan.json` gap entry: supplier, section and needs changed accordingly (the slug is unchanged). The plan's node and request texts still mention "LanglandsParameterStacks:LP3" (lines 364, 2256, 4069, 4318, 4363); this job may edit only the gaps list, so those stay and the intake should mirror the change.

## RT-AutomorphicBundlesPartII~2b/F03 (P2) — applied

Old: every ShimuraCompactifications citation used C-labels (C1, C3.3–C3.10, C4.1–C4.11, C4.16–C4.17, C5.3–C5.31, C3–C5, C4–C5). New: the roadmap's own numbering at its open head, by the mapping C3.n→4.n, C4.n→6.n, C5.n→7.n, C1→Layer 1, C5→Layer 7, C4–C5→Layers 6 and 7, C3–C5→Layers 4, 6 and 7, with the layer names in the Scope paragraph.

Verified against the head's headings: 4.3 toroidal Hecke correspondences, 4.9 boundary ideal, 4.10 fan-independence; 6.1–6.11 degenerations through isogenies at the boundary; 6.16–6.17 the compactified Klingen correspondence and its acyclicity; 7.3 integral toroidal compactifications, 7.16 integral minimal compactification, 7.19 finite normalizations, 7.21 formally canonical coefficient sheaves, 7.25–7.26 Hilbert–Siegel codimension and formal Koecher, 7.29 canonical bundle of a Siegel threefold, 7.31 normalized blow-ups. 30 lines changed; the ComplexComparisonPartII labels C1.9, C2, C3.3 on lines 93, 95, 853 and 865 are a different roadmap's and were left alone.

## RT-AutomorphicBundlesPartII~2b/F04 (P3) — applied

Old: "B3.10" (19 occurrences), "B3.BGG.2–B3.BGG.3" (contract, §5.3 Needs), "B5.10" (§3.2 API). New: "5.10" (`integralLeviCoefficient`), "9.2–9.3" (`siegelDualBGGComplex`, `siegelBGGGradedComparison`), "12.11 `ClassicalHecke.operator`"; the contract records the alias dictionary (B0 = Layer 0, B1 = Layer 1, B2 = Layer 3, B3 = Layer 5, B3.BGG = Layer 9, B4 = Layer 11, B5 = Layer 12) so the remaining letter labels resolve by the supplier's own table. The plan.json gap `integral-small-weight-dual-bgg` now has section "9.2–9.3". The three Lean names were checked at the AutomorphicBundles head (lines 2040, 3094, 3155, 4929).

## RT-AutomorphicBundlesPartII~2b/F06 (P3) — applied

Old: contract "CR.5.1, CR.5.3–CR.5.4" while §5.3 consumed CR.5.1–CR.5.3; Layer 5 Dependencies cited "CrystallineCohomology CR.5" (a whole layer). New: contract "CR.5.1–CR.5.4" naming CR.5.2 (exactification and logarithmic PD envelopes, verified at the CrystallineCohomology head line 8671); the bare "CR.5" entry deleted, leaving "CR.5.1–CR.5.4".

## Checks

- Elaboration (`lake env lean` on `packages/AutomorphicBundlesPartII/Suggested.lean` from the content checkout, against the pinned Mathlib and Tau Ceti 358314d4; the four imported Tau Ceti modules were built earlier by `lake build` of each, 3047 jobs): exit 0, one warning "declaration uses `sorry`" at line 73, no other warning.
- `#check` of every declaration in a scratch copy of the file (the file followed by three `#check @…` lines): exit 0. `dvrCoefficientRing : (O : Type u) → [CommRing O] → O → ℕ → Type u`; `integerCoherentCohomology : (R) → [CommRing R] → (X : Scheme) → [X.Over (Spec R)] → X.Modules → ℤ → ModuleCat R`; `finiteCoefficientSerreDuality` keeps `[IsDomain O] [IsDiscreteValuationRing O]`, `Irreducible ϖ`, `n : ℕ`, `[SmoothOfRelativeDimension d …] [IsProper …]`, `[IsLocallyFree F] [IsFinitePresentation F]` and `i : ℤ`, with conclusion `Module.Dual A (H^i(ihom F (⋀^d Ω))) ≃ₗ[A] H^(d−i)(F)`. These agree with README §1.6 and Conventions; no binder, hypothesis or statement changed in this round (only the import line and the module header, below).
- Dependency check (the brief's command): `depcheck: 208 roadmaps, 1809 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None", "Lean names found nowhere: None" (8 leads before this round, 0 after).
- The push gate (without its build step) on a scratch copy of the package laid out as `TauCetiRoadmap/AutomorphicBundlesPartII/`: every rule 0, including `imports=0`, `no-import-mathlib=0`, `mathlib-subimports=0`, `depcheck=0`, `metadata=0`.
- `design/plan.json` parses as JSON after the two gap edits; its 10 gap slugs match the 10 "must provide (gap:…)" lines of the README with the same supplier and section.

## Gate failure

- imports=1 (`TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower` does not exist at the pin): Suggested.lean now imports `TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`, which exists at the pin and declares `SheafOfModules.exteriorPower` (its line 60). The README contract names the same file. The gate run above reports `imports=0`.

## Build warnings of the worker's targeted build

The worker's `lake build` of the module after the previous attempt of this round reported, twice, the file-level warning that the file imports `Mathlib` from a package designed for the module system. The pinned Mathlib root is a `module` file, so a plain `import Mathlib` header raises this warning on every build. The file now begins with `module` and uses `public import` for `Mathlib` and for each of the four Tau Ceti modules, with the three declarations inside an `@[expose] public section`, the form of the roadmaps on main that already carry the header (CoboundaryExpansion and TypeAHeckeAlgebras). Elaboration then reports only the `sorry` warning. The import list, its order and the declarations are unchanged.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 sheaf-level division | F=G=O on Spec O, identity legs, k=1,2 | Hom(O,O)=O; ϖ^k·u=ϖ^k·u′ ⇒ u=u′ since O is a domain | unique | positive Check added |
| §4.2 derived division | F=(O/ϖ)[−1], G=O, k=1, T=0 | Hom_D=Ext¹(O/ϖ,O)=coker(ϖ:O→O)=O/ϖ; ϖ·1=0=ϖ·0 | not unique; rule now requires injectivity | negative-control Check added |
| §4.2 k=0 | T=ϖ⁰u | u=t, ϖ⁰ injective | returns t | existing Check kept |
| §4.2 P20 flat case | p₁!G a ϖ-torsion-free sheaf | ϖ^k injective on Hom into a torsion-free sheaf | P20 Remark 4.3.3 divides uniquely | sentence added |
| §7.0(b) parity | (a,b)=(3,2): 3−2=1 odd; central twist (2,0;c)→(2,0;c′) | parity of k−l unchanged | lemma inapplicable for odd a | rational route stated |
| §7.0(b) case (d) | entries {3/2,3/2,5/2−a,5/2−a}; λ gives x±1/2 | difference 3/2−(5/2−a)=a−1=1 ⇒ a=2, x=1; μ inf. char. (3/2,1/2) | weight 2, type 1+1+2 | matches CG20 line 2139 |
| §7.0(b) case (c) | same multiset; μ gives x±1/2, y±1/2 | a=2, x=y=1; μ inf. char. (1,1) | weight-one dihedral μ twisted by \|·\|; type 2+2 | weight-one gap confirmed as needed |
| §7.0(b) case (b) | μ₁,μ₂ with equal central character | mixed split (3/2,3/2)/(5/2−a,5/2−a): central inf. chars 3 vs 5−2a, equal only at a=1 | both of weight a | sentence added |
| §7.0(b) a=4 | entries 3/2 and −3/2 | difference 3≠1 | cases (c),(d) empty | Check added |
| §8.8 totally real | k_v≡l_v mod 2 assumed in §8.8 | lemma hypotheses: inf. char. + parity | BCGP21 Lemma 2.9.1 applies | no change beyond naming the parity |
| §1.6 Lean statement | n=0: A=0, both sides 0; ϖ=0 excluded by Irreducible | types unchanged by the import | elaborates | import only |
| ReductiveGroups §10B convention | f(gb)=λ(b)⁻¹f(g), a·f(g)=f(a⁻¹g) | same as §1.2's right-B law and left translation | §1.2 Checks unchanged | citation only |

## For the maintainer

- The gap `integral-dual-weyl-lattices` now names ReductiveGroups (on main) §10B as supplier instead of LanglandsParameterStacks; the plan's non-gap text still says "LanglandsParameterStacks:LP3" and should be mirrored at intake.
- `Suggested.lean` now carries the `module` header with `public import` lines, so that the targeted build raises no module-system warning; the gate accepts this form (`imports=0`, `no-import-mathlib=0`) and two roadmaps on main use it. If the house form is to stay `import Mathlib` without `module`, the five header lines and the `public section` are the only things to revert, and the warning returns.
- No name of this roadmap's own changed. Ownership against open pull requests was checked only for the roadmaps whose files the brief provides and for the `roadmaps show` heads of LanglandsParameterStacks, ShimuraCompactifications, AutomorphicBundles, ComplexComparisonPartII and CrystallineCohomology.
- No new source was needed; no `needs-references.toml` entry was added.
