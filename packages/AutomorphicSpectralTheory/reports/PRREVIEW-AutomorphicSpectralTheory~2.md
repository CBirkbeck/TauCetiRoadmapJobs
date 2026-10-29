# Review of AutomorphicSpectralTheory (pull request #925 at 3faace5)

**Verdict:** needs changes

Incremental re-review of the 44 lines changed since c5cfb92. Six of the seven previous findings are repaired and the repairs introduced no new problem; the dependency check now passes with no UPWARD or CYCLE line. The verdict is forced by the gate alone: the residue scanner still reports 45 hits, of which 16 are `<a id=` anchor lines the author can remove and 29 are the word "packet" in its literature sense (L-packet, wave packet), which only the board can waive. No P1 or P2 finding remains.

## R01 (P3) — Residue scanner: 16 HTML anchor lines remain

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 1200, 1227, 1255, 1590, 2022, 2046, 2065, 2084, 2525, 2554, 2569, 2590, 2609, 2634, 3783, 3869.

**Claim.** The gate's residue rule forbids `<a id=` anchor tags in the README; the gate fails while they stand.

**Witness.** Line 1200 reads `<a id="eisenstein-fredholm-continuation"></a>`; the other fifteen lines have the same shape. The gate at this head reports `residue=45 … FAIL`, unchanged from c5cfb92 on this point.

**Repair.** Delete the sixteen anchor lines and cite the targets by section number (the README already cites its own sections as "§1.15c", "§4.14a"). Consumers that link these fragments (GrossZagierAndArithmeticHeights, GanGrossPrasadUnitaryGroups) then cite by section too; that is their own P3 repair.

## R02 (P3) — Residue scanner: 29 hits on the word "packet"

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 39, 106, 110, 212, 1211, 1673–1714 (every other residue hit).

**Claim.** The scanner's "packet" rule targets process vocabulary; here every hit is mathematical vocabulary.

**Witness.** Line 1683: "with `t=0` the packet is the whole tempered packet, not only its generic member" (an L-packet); line 212: "onto unitary wave-packet map `W`" (a wave packet). The 29 hits are the 45 reported minus the 16 anchors of R01.

**Repair.** None textual: L-packets and wave packets are the literature's names and renaming them would be invented vocabulary. The board waives these hits or narrows the rule; until then the gate fails.

## Previous findings

- R01 — repaired: the dependency check at this head prints `depcheck: 201 roadmaps, 1330 edges, 0 problem(s)`; the six UPWARD lines and the "not movable" line are gone (the merge order now lists every cited supplier before this roadmap).
- R02 — not repaired: the sixteen `<a id=` lines (1200 … 3869) and the 29 "packet" hits are unchanged; re-raised as R01 and R02 above.
- R03 — repaired: line 44 now reads "V4.0.Fields: measurable separable Hilbert fields …" without the pull-request URL; "on main" is gone from lines 45, 210 and 229 (no occurrence of "on main" remains in the README).
- R04 — repaired: §0.14 line 341 now identifies `𝓢(V,E)` with `𝓢(V)⊗̂πE` "for complete `E`", explains that nuclearity of `𝓢(V)` makes the projective and injective completions agree, cites [Tre67] Chapters 44 and 50–51 for it and keeps BPCZ22 A.0.8–A.0.9 for the definition; a fourth Check with `E=ℓ²(ℕ)` was added (verified below).
- R05 — repaired: line 1004 reads "AutomorphicLFunctionsAndLocalFactors AL.0", line 1585 "SmoothRepresentationsOfLocalGroups SR.4"; the same rename was applied at lines 976, 1553, 1678, 1690, 1722, 1733, 1744, 1815, 2404 (SR.1, SR.2, SR.3). All four layer names exist at the indexed heads (AutomorphicLFunctionsAndLocalFactors `## Layer AL.0` at its line 291; SmoothRepresentationsOfLocalGroups `## Layer SR.1` 975, `SR.2` 1828, `SR.3` 2481, `SR.4` 3102).
- R06 — repaired: lines 3551 and 3660 state the API in prose ("independence of the parabolic for the restriction to `X_L^G`", "Fourier inversion over the degree characters"); no dotted name of this roadmap's own remains outside `Suggested.lean`'s seven declarations.
- R07 — repaired: line 3922 cites [GZ86] by journal, pages and DOI 10.1007/BF01388809 with no third-party URL; the §§0.35, 0.37, 2.24, 2.25 locators stand as uncertified.

## Verified sound

**Gate.** At this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=45 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0`; only residue fails (R01, R02). The dependency check run by me:

```
depcheck: 201 roadmaps, 1330 edges, 0 problem(s)
```

No change outside the roadmap folder: `git diff --stat origin/main...HEAD` excluding the folder is empty, and the diff since c5cfb92 touches only `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` (23 insertions, 21 deletions).

**Lean file.** `Suggested.lean` is byte-for-byte unchanged since c5cfb92. I elaborated it again with `lake env lean`: exit 0, three `declaration uses 'sorry'` warnings (lines 40, 67, 102) and nothing else. The seven elaborated signatures in the worker's signature file equal those checked at c5cfb92 (`analytic_fredholm`, `Modular.nonholomorphic_eisenstein`, `Modular.completed_eisenstein_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`, `Modular.automorphic_green`, `Modular.green_kernel_continuation`); no section binder is lost (none is used). The one-tactic probe, the headline list and the not-statable docstring were checked at c5cfb92 and carry forward unchanged: the three sorried theorems fail `simp`, the three definitions have real bodies on `UpperHalfPlane`, `CongruenceSubgroup.Gamma0`, `Complex.cpow`, `tsum` and the Bochner integral, and no carrier at the pins makes any other headline statable.

**Changed passages, source by source.**

- §0.14 (lines 338–354): [Tre67] is a 1967 Academic Press book with no legal open copy (see Not verifiable); its table of contents, read from a library catalogue, gives Chapter 44 "Examples of Completion of Topological Tensor Products: Products ε", Chapter 50 "Nuclear Spaces" and Chapter 51 "Examples of Nuclear Spaces. The Kernels Theorem", so the README's description of the three chapters (vector-valued function spaces as completed ε-products; nuclear spaces and the agreement of the two completions; nuclearity of `𝓢`) matches the book's structure. The mathematics: `𝓢(V)` is nuclear Fréchet, so for complete Hausdorff `E` one has `𝓢(V)⊗̂πE = 𝓢(V)⊗̂εE ≅ 𝓢(V,E)`; the dropped nuclearity of `E` was an unused hypothesis, as the previous review said. The standing-hypotheses line agrees with the body (quasi-complete for the definition, complete for the identification). BPCZ22 A.0.9 (lines 6645–6652 of the cached text, printed p.331) still supports the definition.
- §2.11 (lines 1736–1744, seeded target; its `*Needs:*` line changed): JZ20 cached text lines 4037–4052 (arXiv v4, printed p.87): for unitary tempered `τ` and `σ₀`, the unnormalized rank-one operator `M(w″,τ⊗σ₀,s)` is holomorphic and nonzero for `Re s > 0` (citing Waldspurger IV.2.1 and a real lemma), `L(s,τ×σ₀)=L(s,τ×σ₀°)` for the generic tempered member `σ₀°`, and the normalizing factors are holomorphic and nonzero there; the shift by `0<α_j<1/2` then gives `Re s ≥ 1/2`. This is the README's statement, hypotheses included (characteristic zero, special orthogonal or unitary groups, tempered data). The renamed supplier SR.3 (admissible complex representations, tempered representations and the Langlands classification) is the right layer.
- §4.6 (lines 2396–2404, seeded target; its `*Needs:*` line changed): Art05 cached text lines 1890–1935 (printed p.35): Theorem 7.2(b) and the sentence after it give the unitary intertwining operator from `R_P` onto `R̂_P` acting by `I_P(λ,y)F_P(λ)`, the "representation interpretation" the README cites; lines 3693–3718 (p.66) are (12.5) (the discrete spectrum as a sum over cuspidal data `χ`) and (12.6) (`H⁰_P` as an algebraic direct sum over `χ`); page 87 line 5082 uses the unitarity of `M(s,λ)` on the unitary axis as the README's §15 citation says. SR.1 (Hecke algebras) is the right supplier for the finite-level Hecke test.
- §0.7 and the supplier table (lines 44–45, 210, 229): only "on main" and the pull-request URL were removed; SA-B85 exists on main (`TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md` line 676, with the `C₀(X)` specialization at line 132) and V4.0.Fields at the head of VonNeumannAlgebras (its line 361).
- §§1.5, 1.6, 2.1, 2.3, 2.7, 2.9, 2.10, 2.16, 4.6 `*Needs:*` lines: each renamed layer resolves as listed under R05 above.
- §§6.11 and 6.3x API sentences (lines 3551, 3660): prose only; the mathematics is unchanged from c5cfb92.
- References (lines 3919, 3922): [Tre67] has no URL and names the chapters; [GZ86] has the DOI only.

**Cross-roadmap citations resolved this round** (at the indexed heads or on main): AutomorphicLFunctionsAndLocalFactors Layers AL.0–AL.3 and the eight fragments the supplier table links (`hecke-l-functional-equation` 1505, `canonical-rank-one-comparison` 1438, `rank-one-local-functional-equation` 1227, `global-godement-jacquet` 1840, `automorphic-l-data` 2401, `pinned-niceness` 2391, `rs-global-poles` 2264, `rs-archimedean-realization` 2118; that README still carries its anchors at the indexed head); SmoothRepresentationsOfLocalGroups SR.1–SR.4; VonNeumannAlgebras V4.0.Fields and V4.Core; OperatorTheory/SelfAdjointSpectralTheory SA-B85. The rest of the citation set was resolved at c5cfb92 and the diff does not touch it; the worker's resolver lists no cross-roadmap citation found nowhere, and its nine "Lean names found nowhere" are the seven declarations of this file plus two ArithmeticLocallySymmetricSpaces names already resolved at c5cfb92 (`FrankeInput` line 189, `realPoints_lieGroup` line 47).

**Adversarial table.** Rows for statements the diff leaves untouched carry forward from the review at c5cfb92 (its table of 36 rows, all "none" in the change column, values recomputed there); the rows below are for the changed or re-sampled statements.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.14 identification `𝓢(V,E) ≅ 𝓢(V)⊗̂πE` for complete `E` | `E = ℂ`; `E = ℓ²(ℕ)`; `E = ℂ^(ℕ)` with the finest locally convex topology (complete, not metrizable) | `E = ℂ`: both sides are Mathlib's `SchwartzMap`; `ℓ²`: Banach, complete, non-nuclear (Trèves Ch. 50, infinite-dimensional Banach spaces are not nuclear), identification via `ε = π` for nuclear `𝓢(V)`; `ℂ^(ℕ)`: complete, identification holds with `𝓢(V,E)` the finitely supported families | holds in each case; completeness of `E` is used, nuclearity of `E` is not | none |
| §0.14 Check `E = ℓ²(ℕ)` (new, line 352) | `Σ_n (n+1)^(−2) e^(−πv²)⊗δ_n` | π-seminorm of the `n`-th term is `(n+1)^(−2)·p_k(e^(−πv²))·‖δ_n‖ = (n+1)^(−2)p_k(e^(−πv²))`, sum `ζ(2)p_k(e^(−πv²)) < ∞`; image at `v`: `e^(−πv²)·((n+1)^(−2))_n`, in `ℓ²` since `Σ(n+1)^(−4) < ∞` | the stated function is the image; a definition requiring `E` nuclear would not even state it | none |
| §0.14 Check "constant map not Schwartz" | `f ≡ e ≠ 0` on `ℝ`, `N = 1` | `sup_v (1+|v|)·p(e) = ∞` for any `p` with `p(e) > 0` | not Schwartz; the zero map is | none |
| §2.11 half-plane after the shift | `α = 1/4`, `s` with `Re s = 1/2`; `α → 1/2` | `Re(s − α) = 1/4 > 0`; as `α ↑ 1/2`, `Re(s−α) ↓ 0`, still inside `Re > 0` for `Re s ≥ 1/2`; at `α = 1/2` (excluded) the shifted point `Re = 0` leaves the open half-plane | `Re s ≥ 1/2` after the shift exactly as JZ20 p.87 | none |
| §2.11 tempered hypothesis | `σ₀` a complementary-series (non-tempered) member | JZ20 asserts holomorphy only for tempered `τ, σ₀`; the README's standing hypotheses require the tempered packet | hypothesis present | none |
| §4.6 `‖R(h)‖ ≤ ‖h‖₁` | `h = 1_K` for compact open `K`; `h = 0` | `R(1_K) = vol(K)·(averaging projection)`, norm `vol(K) = ‖h‖₁` (equality); `R(0) = 0` | bound sharp, not vacuous | none |
| §4.6 unitary twist | `χ` unitary; `χ = |det|^t` with `t ≠ 0` real | unitary: `f ↦ χf` is an isometry of `L²`; nonunitary: `‖χf‖₂ ≠ ‖f‖₂` on functions supported where `|det| ≠ 1` | the README asserts the unitary case only and says so for the nonunitary one | none |
| §6.3x Fourier inversion (line 3660) | `n = 1`; `n = 2` with `ζ = −1` | `n=1`: `J_η = J_1`; `n=2`: `J_η = −J_1 + J_2`, `J_{η²} = J_1 + J_2`; inversion `J_1 = ½(ζ^(−1)J_η + ζ^(−2)J_{η²}) = ½(J_1 − J_2 + J_1 + J_2) = J_1` | correct | none |
| §6.11 restriction to `X_L^G` independent of `P ⊆ Q` (line 3551) | rank one, `M = L` so `P = Q` | the only choice is `P = Q`; `c_Q = c_P` trivially | consistent; the general case is Yu22 Théorème 4.2.2 as cited | none |
| Supplier-layer renames (R05) | each of SR.1–SR.4, AL.0 | heading line in the supplier dump: 975, 1828, 2481, 3102; 291 | all exist | none |

**Duplication and ownership.** The diff adds no object; the ownership record of c5cfb92 stands (GrossZagierAndArithmeticHeights and GanGrossPrasadUnitaryGroups are consumers; ArithmeticLocallySymmetricSpaces leaves `FrankeInput` as a hypothesis). Ownership against open pull requests whose files the brief did not provide was checked only through the roadmap index, as before.

**Declared gaps.** None (no readable `design/plan.json`); no `*Needs:*` line cites a roadmap later in the merge order (depcheck 0 problems).

## Not verifiable

- [Tre67] (§0.14): Trèves, *Topological Vector Spaces, Distributions and Kernels*, Academic Press 1967 (Dover 2006). The sources service finds no legal open copy; the chapter titles were checked against a library catalogue's table of contents, the theorem statements from memory of the standard references. A theorem-level locator (the chapter-44 theorem on `𝓢`-valued functions and the chapter-50 theorem on `ε = π`) would be stronger than the chapter-level one but is not required.
- [GZ86] (§§0.35, 0.36, 0.37, 2.24, 2.25): paywalled at DOI 10.1007/BF01388809; uncertified, as the previous review recorded; the residues and constants were recomputed there.
- [Lan80], [Sha10], [AC89], the BL24 published pagination: unchanged from the previous review and not touched by the diff.

## Source issues

- none
