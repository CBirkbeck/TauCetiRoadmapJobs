# Review of BordismFormalGroups (pull request #1807 at 445f965)

**Verdict:** accepted

Incremental re-review of the 28 lines of `TauCetiRoadmap/BordismFormalGroups/README.md` changed since `b591e89`. No finding.

## Previous findings

- R01 — repaired: lines 891–897, "conditional convergence for every X to the homotopy of the HF_p-nilpotent completion holim_s X/X_s … strong convergence when X is bounded below and H_*(X;𝔽_p) is of finite type"; negative-control Check at lines 927–934.
- R02 — repaired: lines 1183–1188, "G3.4 (the Milnor sequence of a telescope, for HR^*(RP∞)), G4.3 and G4.5 (Thom classes and real orientations …) and G5.3–G5.4 (the Thom model of MO and its Thom product …)"; F2.5 gains G5.3–G5.4 (1093–1094).
- R03 — repaired: the description now reads "replaces DGFloer and GeometricTopology by AlgebraicTopology §§5.5 and 8.7 …; and adds CharacteristicClasses (C3, Conventions) and TopologicalKTheory (Bott class, T1.5, T1.6a, T2.5)", and names F2.2's completion comparison and F6.2's ΩBU≃U.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| F2.2 conditional convergence, every X (lines 891–894) | tower Y_s=fib(X^∧→X/X_s) | holim Y_s=fib(X^∧→holim X/X_s)=fib(id)=0; layers of Y_s are those of X_s; E₁=π_*(HF_p∧H̄^(∧s)∧X), flat over 𝔽_p, so E₂=Ext for every X | holds with no hypothesis on X | — |
| F2.2 strong convergence (lines 894–897) | X=MU; X=⋁_(n≥1)Hℤ/p^n | cobar term in (s,t): Σ of finitely many finite products dim (Ā_*)^(⊗s)_i·dim H_(t−i), finite when H_* bounded below of finite type, so lim¹_r E_r=0; for the wedge dim H₀=∞ | strong for MU; hypothesis excludes the wedge | — |
| F2.2 Check (lines 927–934) | A=⊕ℤ/p^n; summand n; j≥1 | A[p^k]_n=p^(max(n−k,0))ℤ/p^n≠0; image of A[p^(k+j)]_n under p^j is p^(max(n−k,j))ℤ/p^n, zero exactly for n≤j; L₀A/p^s=A/p^s so ker(L₀A→lim A/p^k)=⋂p^s L₀A=lim¹A[p^k] | Mittag-Leffler fails, countable groups, lim¹≠0; filtration ≥ s on p^s·π₀ | — |
| F2.2 locator, Theorem 2.1.1(ii), p. 42 | ravenel-green lines 2616–2621, 2627–2635 | standing hypothesis: connective, H_* of finite type; (ii) adds "X of finite type", abutment π_*(X)⊗ℤ_p; printed page 42 | README's parenthesis states the source's hypotheses | — |
| F2.5 *Needs:* (lines 1091–1097) | objects used against items named | universal property of MO: G5.3–G5.4 (GeneralizedCohomology lines 3736, 3789, MO at 3792); RP∞×RP∞: G3.4 (2407) | every object named | — |
| F2.6 *Needs:* (lines 1183–1190) | objects used against items named | HR^*(RP∞): G3.4 (2407); Thom classes: G4.3 (3193); real orientation data on RP∞: G4.5 (3259–3262); MO, Thom product: G5.3–G5.4 | every object named; Layer 2 Dependencies (1215–1217) list G3.4, G4 with G4.3, G5.3–G5.4 | — |

The rows for the untouched statements stand as in the previous review, of `b591e89`.

- Source locators read at the text: 1 changed locator (ravenel-green lines 2616–2635, Theorem 2.1.1 and its standing hypotheses, printed p. 42); of the seeded sample only "2.2", "2.5" and "2.6" fall in changed passages, and their changed lines carry this one source locator.
- Cross-roadmap citations resolved at this head: GeneralizedCohomology G3.4 (line 2407), G3.8 (2589), G3.9 (2718, comparison sentence at 2751–2754, unchanged: D01), G4.3 (3193), G4.5 (3259), G5.3 (3736), G5.4 (3789). The changes to TopologicalKTheory, ClassifyingSpaces and RigidAnalyticGeometry since `b591e89` add locators and reword a gap sentence; T1.5, T1.6a, T2.5, T7.1 and the Conventions' Bott class, which this roadmap cites, are untouched.
- Self-consistency: no other passage asserts strong convergence of the HF_p-Adams spectral sequence without finite type (searched lines 35, 266, 1543, 1555, 2795, 2816); F2.3 uses it for MU and F2.4 for MO, both of finite type.
- Gate: the worker's gate passes every check (`build=0 … OK`); run again here, every counter is 0 except `outside-folder`, which lists only the folders this pull request owns. Dependency check: `depcheck: 237 roadmaps, 2253 edges, 0 problem(s)`.
- Lean: `Suggested.lean` is unchanged since `b591e89`; `lake env lean` gives three `sorry` warnings (lines 75, 90, 116) and nothing else. The diff changes no Lean statement and no headline.
- Pull request text: the BordismFormalGroups paragraph and the summary block agree with the head (suppliers dropped and added, F2.2, F2.4, F4.1, F6.2 ownership, F1.5, eight declarations replaced by three theorems and `IsStarIso`).
- Overlap check: read ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheoryPartII, GeneralizedCohomology, LubinTateFormalModulesAndQuasiCanonicalLifts, EllipticCohomology, TangentialBordism, StableHomotopyKTheory (the third list is empty); searched every open head and main for the HF_p-nilpotent completion and Adams convergence. Shared: the completion comparison with GeneralizedCohomology G3.9, owner F2.2 (D01); Adams towers with main's TangentialBordism B4, owner F2.2 (last section). StableHomotopyKTheoryPartII line 263 states an inverse-limit Adams spectral sequence of towers, a different object. The changed passages add no owned object.
- Source independence: changed passages only; 2 passages compared with 1 source (lines 891–897 and 927–934 with ravenel-green lines 2616–2635), none shared; largest share ravenel-green, about 60 of 115 locator groups; the diff adds, removes and reorders no layer, so the contents comparison stands as in the previous review: independent.

## Not verifiable

- Bousfield 1979, §6, Theorem 6.6 (the sentence after the changed one, and the Check's use of derived p-completion for bounded-below X): settled as uncertified, cited by locator only.

## Source issues

- none

## For the human reviewers

- **Ownership on main.** Main's TangentialBordism (README line 76) names itself owner of the mod-p Steenrod algebras and Adams towers that F2.2 owns here; main's HomotopySpheres likewise for F4.1 and F6.2; the description defers their revision to other pull requests.
- **Licence.** README lines 2181, 3898, 3908 and 3909 link copies of papers by other authors hosted on D. Ravenel's university pages; I could not classify those hosts for the works concerned.
- **Licence.** `miller-cobordism` (Miller, *Notes on Cobordism*) is unpublished lecture notes; the cached copy comes from a third party's university page (miller-cobordism line 2), while the README links the author's.
