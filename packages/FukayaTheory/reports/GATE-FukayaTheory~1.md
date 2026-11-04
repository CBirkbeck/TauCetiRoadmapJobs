# GATE-FukayaTheory~1: answers to review of `TauCetiRoadmap/FukayaTheory/` at 927284a

Repairs committed as 5afda6c1 (not pushed). Files changed: `TauCetiRoadmap/FukayaTheory/README.md`, `TauCetiRoadmap/FukayaTheory/Suggested.lean` (imports only).

## H01 (roed-math) — applied

Correct: a loss-`C` bound does not give a map into the original `Λ₀`-lattice, and finite-loss inverse pairs do not give `Λ₀`-quasi-equivalences. Repair in `TauCetiRoadmap/FukayaTheory/README.md`: FK0.1 gains **Localized coefficients and shifted lattices** (`Λ_loc=Nov(R,G⊕ℝ,E_R)` from MorseNovikov N1, the theorem `S⁻¹Λ₀≅Λ_loc` for `S={T^r:r≥0}`, localized finite-generator modules `C_loc=⋃T^(−r)C`, shifted lattices `C⟨r⟩` with inclusions `ι_(r,s)`, and the `C_A` contraction as two negative-control Checks). FK0.3 gains **Finite-loss functors and their equivalence notion**: components typed into `Hom′⟨C_k⟩`, composite losses, `G₁∘F₁≃ι_(0,C₁+C′₁)`, localization to a `Λ_loc` quasi-equivalence (DGAInfinity Layer 2's general-ring hypothesis: `f₁` a chain-homotopy equivalence), and a statement that a `Λ₀` equivalence needs loss zero throughout. FK7 constructs the localized fixed-potential category (finite free `Λ_loc` Homs, extended `m_k^b`, bounding elements still positive in the self lattices). FK9.2 types the moving-end comparisons, adds the inclusion-composite statement (FOOO Displacement, Remark 6.3, p. 20) and `Λ_loc` quasi-equivalences, and restricts `Λ₀` equivalences to loss-zero fixed-end and fixed-support changes. In FK9, "allowed choice invariance with the actual quantitative action shifts" is replaced by: split-closed derived categories of the localized categories (DGAInfinity Layers 5–6) are invariant, and on positive lattices only the finite-loss conclusions hold. FK8.1 adds the reviewer's `β₀(t)=(t,2t)` shear test as the negative control.

## H02 (roed-math) — applied differently

The defect is real for CalibratedGeometry C2 and SmoothBundlesConnections B1–B2. These are open new-folder proposals by another author (CalibratedGeometry C2 "Calibrated immersions and integration", SmoothBundlesConnections B1 principal bundles, B2 associated bundles; the sections exist at their heads). They are now cited by roadmap name and section with no relative link. House rules forbid citing pull-request numbers, so the suggested PR links were not added. SymplecticGeometry/CotangentLagrangian C1, C2 and C4 is on main now (merged in fb599a54), so that link resolves after rebase and is kept. The same pattern was repaired elsewhere: the links "proposal890", "proposal900", "proposal957", "PR480" and the Mathlib PR40984 link were removed, and HamiltonianSystems is cited as "HamiltonianSystems Layers 1–2". The HeegaardFloer citations F1.4–5, F2.2a–c and F2.6a–d only exist in an open revision of HeegaardFloer, and a revision is never a supplier. They are now cited against main (Lanes M, F0, F1 items 1–3, F2 items 1–5, F3). The sphere carrier, simple quotient, one-marked evaluation, simple-sphere transversality and the uniform-minimal-area cobordism/degree theorem move down into FK3.1b (McDuff–Salamon, Chapters 2, 3 and 6), and relative clutching moves into FK1.2b on top of HF F1 item 3.

## H03 (roed-math) — applied

MorseNovikov N1 on main constructs the continuous unital pushforward `P_(ρ,φ):Nov(R,H,N)→Nov(S,H′,N′)` for `N′∘φ=cN`, with continuity `P(U_C)⊆U′_(cC)` and restrictions to the nonnegative subrings (MorseNovikov README, N1). The supplier row and the FK0.1 and FK1.2b uses changed from "proposed N1 continuous-unital pushforward companion" to "N1's continuous unital pushforward `P_(ρ,φ)` with `c=1`". The "degree-square laws" are now attributed to N1's explicit commuting-degree-map hypothesis, because N1 states the ungraded map only.

## Build and gate

- `lake build TauCetiRoadmap.FukayaTheory.Suggested`: `Build completed successfully (9031 jobs).`
- Gate: `gate FukayaTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: FukayaTheory (insert it after its last supplier)`. At the design stage the brief says this is not a defect. Before these edits the gate also failed on latex=4, tex=3, prnum=2, imports, mathlib-subimports and no-import-mathlib. Those were fixed: LaTeX at old lines 66, 178, 180 and 296 became Unicode/code spans, the `J^L_{…}` at line 118 went into code spans, and `Suggested.lean` now has the single `import Mathlib` plus the five existing `TauCeti.*` modules, all present at the pin.
- Depcheck (`--movable`): `NOT IN ORDER: FukayaTheory (insert it after its last supplier)` / `depcheck: 148 roadmaps, 1006 edges, 1 problem(s)`. No UPWARD or CYCLE line.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `S⁻¹Λ₀≅Λ_loc` | `a=T^(−r)` for `r=1/2`; `a=0`; series with least `E_R`-value `−3` | `T^(1/2)·T^(−1/2)=1∈Λ₀`; `0` trivially; `T^3·a∈Λ₀`. `T^r` is a unit in `Λ_loc`, so it is a non-zero-divisor in `Λ₀` | holds (N1: nonzero support has a least value; monomials are units) | added |
| `C_loc=⋃T^(−r)C`, finite generators | rank 1, generator weight 0; element `Σ_n T^(n−2)` | min valuation `−2`, lies in `T^(−2)C` | holds; needs finite generators (with infinitely many generators the valuations can be unbounded below) | hypothesis stated |
| `C_A` contraction Check | `A=1/4` | `d(hv)=T^(−A)T^A v=v`; `h(db)=h(T^A v)=b`; `H⁰(C_A)=Λ₀/(T^A)≠0` | holds; no `Λ₀` contraction exists | Check added |
| Zero-complex interleaving Check | `C_A`, `0` | composite `0` on `C_A`; `0−ι_(0,A)=dh+hd` with `h` of loss `A`; `id≃0` with loss 0 would force `H⁰=0` | holds | Check added |
| `G₁∘F₁≃ι_(0,C₁+C′₁)` typing | `C₁=0.3`, `C′₁=0.2` | `F₁(Hom)⊆T^(−0.3)Hom′`, `G₁(T^(−0.3)Hom′)⊆T^(−0.5)Hom` | typed correctly; matches FOOO Remark 6.3 (`λ→λ−‖H‖→λ−2‖H‖`) | added |
| Localized quasi-equivalence | identity loss 0; `C_A` vs 0 | after localization `ι` becomes `id`, so `(C_A)_loc≃0`, which is right, since localized cohomology is 0 | holds | added |
| Composite loss `C″_k` | `k=1`: `C′₁+C₁`; `k=2`: `max(C′₂+C₁+C₁, C′₁+C₂)` | per arity there are finitely many partitions, so the max is finite | holds | added |
| Torus `β₀`, `β₁`, `α` | `β₀(t)=(t,2t)`: `2t∈ℤ` at `t=0,1/2`; shear of `β₀` | `(t,2t+½sin2πt)=β₁` ✓. `H=−(4π)⁻¹cos(2πq)`: `dH=½sin(2πq)dq`, `ι_Xω=X^q dp−X^p dq=−dH` gives `X^p=½sin2πq` ✓. Lune area `∫_{1/4}^{1/2}(2t+½sin2πt−1)dt=1/(4π)−1/16≈0.01708>0` | `Λ₀²` vs `Λ₀²⊕Λ₀/(T^A)`; both localized ranks are 2 | Check added |
| Positive-lattice Hamiltonian non-invariance | the torus pair above | torsion `Λ₀/(T^A)` appears only for `β₁` | consistent with FOOO §6.1 (6.2)–(6.3) | stated in FK9.2 |
| N1 pushforward with `c=1`, `φ=E_R`, target `id_ℝ` | `N′∘φ=id∘E_R=1·E_R` | period identity holds with `c=1` | holds | citation fixed |

Not done: Lean commands other than the build are not permitted by this job, and the elaborated-signature file was unavailable, so the mechanical `#check @name` comparison was not run. No declaration changed: only the import lines did, and the build passed. The pre-existing `Suggested.lean` does not follow the acceptance-test form (carrier aliases, `rfl` API lemmas, and a module docstring that names no headline theorem as not statable). The README does not follow the house section shape either. Neither was raised in this review and neither was rewritten here.

Ownership: `Λ_loc` and the shifted lattices specialize MorseNovikov N1 (on main). The finite-loss functor notion and localized categories are FK-specific adapters on DGAInfinity Layers 2 and 5–6. `roadmaps grep -i 'filtration inclusion|finite-loss'` was not run against all open PRs; ownership was checked against main (MorseNovikov, DGAInfinity) and the CalibratedGeometry and SmoothBundlesConnections heads only.

Sources: FOOODisplacement (arXiv:1104.4267v1) was fetched through the sources service, and the locators were read there: (6.2)–(6.3) at source line 965–978 (p. 19), Remark 6.3 at line 1014–1025 (p. 20). This job may not edit the roadmap's `sources.toml` (the folder has none), so FOOODisplacement and McDuff–Salamon (book, cited by chapter, `uncertified`) still need manifest entries. No `needs-references.toml` request was made.

Suspicious text: none. The review's PR links were treated as data, and PR-number citations were not adopted.
