# Review of CompactGroups (pull request #1047 at 5ccf6cc)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroups/`
**Verdict:** needs changes

Incremental re-review of the 27 README lines changed since `7c7d91c` (the Lean file is unchanged). The gate, the dependency check, direct elaboration and the seventeen signature checks pass; every value in the four changed passages recomputes to what the README states, so the two P3 findings of the previous review are repaired without introducing a new problem. The one blocking finding is the placement finding carried since the second review. The last repair report answers it as a repair the repair job cannot make; that is a statement about the job's file allowance, not about the pull request, so it is re-raised below and the roadmap should go to a human.

## R01 (P2) — Keep the completed base roadmap in this folder; put the new programme in CompactGroups Part II

Re-raised: H01 (repair report for `5ccf6cc`).

**Location:** `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:1–7` (“Build on normalized Haar measure … The comparison targets concern invariant metrics, G-finite vectors in Banach representations, metrizability, duals of arbitrary products …”), `:9–19`, the layer headings at `:203, 286, 411, 498, 565, 641, 721, 1213`, and `Suggested.lean:1–22`; the whole folder is a replacement.

**Claim:** Carried unchanged from r2 R05, r3 R02 and r4–r8 R01. Main's CompactGroups is a finished roadmap. This head replaces its README and `Suggested.lean` in the same folder, under the same title, by a different programme with renumbered layers: Layer 0 (Haar) becomes interface comparisons, Layers 1–2 (unitarizability, complete reducibility) become invariant metrics and Banach density, Layer 4 (Schur orthogonality) becomes product duals, Layer 5 (Peter–Weyl) becomes compact abelian Fourier theory, Layer 6 (characters) becomes global forms. The base content survives only as a list of library names under "Scope and ownership". The brief's contract is that an existing roadmap is built on, never re-planned, and that an extension is a Part II.

**Why the repair report's reason fails:** The report says the finding is correct and that the repair "is not one this job can make" because the repair job may edit only the two files of the existing folder. That reason concerns the repair worker's allowance, not the pull request: the pull request's author can create the folder and the family-index line, and `accepted` means the folder is ready for a human's final approval, which a folder that overwrites a done roadmap is not. The finding stands on the pull request, whoever makes the change; since the repair pipeline cannot, a human has to.

**Witness (re-checked on main `929496d4` at this head):** `TauCetiRoadmap/RepresentationTheory/STATUS.md:6` records Layers 0–6 of this folder as `done` with a pinned README hash, and `:43` lists CompactGroups under Done; the family index `TauCetiRoadmap/RepresentationTheory/README.md:47–49` (not changed by this head) still describes the folder as Haar averaging through Peter–Weyl, characters and the SU(2) and maximal-torus engine; main `RepresentationTheory/LieHighestWeight/README.md:915` links `CompactGroups/README.md#layer-6-characters-of-compact-groups`, a fragment this head does not carry (its Layer 6 heading at `:721` is "global forms and representation rings"). No `CompactGroupsPartII` folder exists on main, at this head, or among the open roadmap pull requests' checkouts. The consumer split listed in the previous report (CharacterTheory, GeneralizedCohomology, CharacteristicClasses, BordismFormalGroups, DeligneWeightsAndPurity, NoncompactQuantumSymmetry, QuantumFoundations, LieGroups, MetaplecticAutomorphicForms citing main's numbering; AutomorphicFormsOnReductiveGroups, SmoothBanachRepresentations, AdelicAlgebraicGroups, TopologicalKTheory citing this head's content under "Layer 5") is unchanged.

**Exact repair:** Restore main's `README.md` and `Suggested.lean` in this folder (with at most the corrections this pull request found necessary to the base text). Create `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/` carrying this head's README and `Suggested.lean` under `namespace TauCetiRoadmap.CompactGroupsPartII`, with an introduction saying where the base stops (native Haar, unitarization, Peter–Weyl, characters, SU(2)) and citing the base by its main layer numbers; add the Part II line to the family index, which is this pull request's own. Keep the fourteen statements, the declared gap and the Knapp locator chain verbatim.

**Repair test:** No mathematical statement changes; every consumer citation above resolves again on main's text; the Banach gap is then declared against "CompactGroupsPartII §2.1" by its two consumers (their edit). The nominal cycle "LieHighestWeight's precursor consumes CompactGroups Layers 0–6, this head's Layer 6 consumes LieHighestWeight Layers 0–7, 9" disappears with the split, because Part II is placed after LieHighestWeight.

## Previous findings

- R01 — not repaired: `README.md:1–19` and the layer headings are unchanged; main `STATUS.md:6` still records the folder as done; `LieHighestWeight/README.md:915` still links a fragment absent at this head. The repair report answers it as outside the job's allowance. Carried and re-raised as R01.
- R02 — repaired: `README.md:365–368` now says `d'` reads the new coordinates `m' = U_i m` and derives `A_i' = U_i A_i U_i†` from `h = m†A_i n = m'†U_i A_i U_i†n'`; the Check at `:388–392` computes `[[1,−i],[i,2]]` against `[[1,i],[−i,2]]` and says why the swap cannot separate them. Both values recompute (table below); no new problem.
- R03 — repaired: Conventions `:59–62` fix right-to-left composition and `n_σ e_j = e_{σ(j)}`; the Check at `:865–871` states the realization, the determinant correction by `diag(−1,1,1) ∈ T`, computes `σ·e_i = e_{σ(i)}`, and gives the values of both wrong models. All recompute (table below); no new problem.

## Verified sound

**Gate, dependency check, elaboration.** The gate run on this head printed every check zero (including `build=0` in the worker's run) and `OK`, exit 0. The prescribed dependency command printed exactly:

```text
depcheck: 204 roadmaps, 1658 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, both equal to `lake-manifest.json`) exited 0 with exactly fourteen "declaration uses `sorry`" warnings at lines 39, 101, 116, 123, 135, 154, 169, 182, 205, 214, 221, 233, 253, 266 and nothing else. A scratch file whose first 275 lines are byte-identical to `Suggested.lean`, followed by `#check @name` for the seventeen declarations (fourteen theorems, `IsGFinite`, `gFiniteSubmodule`, `compactCharacter`), elaborated; each displayed type agrees with the reading recorded in the previous report (Banach density carries `[CompleteSpace E]` and the orbit-continuity hypothesis; the countability theorems carry `[CompactSpace G] [T2Space G]`; the L² theorems `[MeasurableSpace G] [BorelSpace G]`; the product-dual theorems `[∀ j, CompactSpace (G j)] [∀ j, T2Space (G j)]`; `character_finite_coordinates` only `IsTopologicalGroup`; the two definitions keep only the algebraic data their bodies use). Nothing changed since `7c7d91c` in the Lean file (zero changed lines), so the previous report's one-tactic probe (all fourteen declarations fail `first | (simp; done) | rfl | infer_instance`) and its headline inventory carry over unchanged.

**The changed passages, by object.**

- Conventions `:59–62`: with `n_σ e_j = e_{σ(j)}`, `n_σ n_τ e_j = e_{σ(τ(j))} = n_{στ} e_j`, so `σ ↦ n_σ` is a homomorphism exactly under right-to-left composition; and `n_σ⁻¹ diag(t) n_σ e_j = n_σ⁻¹ t_{σ(j)} e_{σ(j)} = t_{σ(j)} e_j`, giving `diag(t_{σ(1)}, …, t_{σ(n)})`. Both verified on S₃ with `σ = (12)(23)` and `t = diag(11,22,33)`: `n_σ⁻¹ t n_σ = diag(22,33,11)`.
- §1.3 `:365–368` and Check `:388–392`: with the first slot conjugate-linear (Conventions `:51`), `h(m,n) = m†A n`; substituting `m = U†m'`, `n = U†n'` gives `m'†(UAU†)n'`, so `A' = UAU†` is the law that matches "`d'` reads the new coordinates". The Check's numbers recompute (table). The sentence now pins which of `d`, `d'` carries the new coordinates, which was R02's ask.
- §2.1 Check `:485–487`: `(12)(23)` applied right to left sends `1 ↦ 2 ↦ 3 ↦ 1`, i.e. `(123)`; `(23)(12)` gives `(132)`. Consistent with the native covariance `-h + g` recorded in the previous report.
- §6.4 Check `:865–871`: under `(w·χ)(t) = χ(n⁻¹tn)` and the Conventions' realization, `σ·e_i = e_{σ(i)}`; `(s₁s₂)(1) = 2`, `(s₂s₁)(1) = 3`; the inverse realization gives `e_{σ⁻¹(i)}` and `(s₁s₂)⁻¹(1) = (s₂s₁)(1) = 3`; left-to-right composition exchanges 2 and 3. The determinant correction is sound: `det n_{(12)} = −1`, `det(n_{(12)} diag(−1,1,1)) = det(n_{(23)} diag(−1,1,1)) = 1`, the corrected matrices are unitary of determinant 1, hence in `N_{SU(3)}(T)`, and they represent the same Weyl elements because `diag(−1,1,1) ∈ T` (the subsection's first API bullet). The Check cites LieGroups Layer 6 for `N(T)/T`, which main `RepresentationTheory/LieGroups/README.md:383,395` states (`weylGroup T = N_G(T)/T`, finite).

**Seeded sample where it falls in the changed passages.** §1.3 cites Knapp, Proposition 4.8 and Corollary 4.9, p.240: opened at `knapp line 10109`–10120 (printed p.240): Schur's lemma for finite-dimensional irreducibles (intertwiner is zero or bijective) and the scalar corollary; the blockwise deduction in §1.3 uses exactly these two statements. The other sampled targets (0.1, 1.1, 1.2, 2.1, 3.1, 4.1, 5.1, 6.1–6.3, 6.5, 6.6, 6.9, 7.1) are untouched by the diff and were verified against Knapp (cache `5ba1b91d`, eleven locators) and Etingof (cache `5093fe43`) in the previous report, whose line map still applies.

**Adversarial table.** Rows for the four changed statements are computed this round; every other row is carried from the previous report (r8), which computed it on the same text.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: permutation matrices (`:59–62`) | S₃, `σ = (12)(23)`, `t = diag(11,22,33)`; `n_{(12)} n_{(23)}` vs `n_{(12)(23)}` | homomorphism identity holds entrywise; `n_σ⁻¹ t n_σ = diag(22,33,11) = diag(t_{σ(1)}, t_{σ(2)}, t_{σ(3)})`; with left-to-right composition `n_{(12)} n_{(23)} = n_{(23)(12)}` fails | consistent; none |
| 1.3 basis-change direction (`:365–368`, `:388–392`) | `U = diag(1,i)`, `A = [[1,1],[1,2]]`; random `m', n'` with `m = U†m'` | `UAU† = [[1,−i],[i,2]]`, `U†AU = [[1,i],[−i,2]]`, both det 1 trace 3; `m†An = m'†(UAU†)n'` to 1e−12; swap `P`: `PAP† = P†AP = [[2,1],[1,1]]` | consistent, R02 repaired; none |
| 2.1 covariance order (`:485–487`) | `h = (12)`, `t = (23)` | `ht: 1↦2, 2↦3, 3↦1 = (123)`; `th: 1↦3, 2↦1, 3↦2 = (132)` | consistent; none |
| 6.4 SU(3) Check (`:865–871`) | `s₁ = (12)`, `s₂ = (23)`; realization `e_{σ(j)}` vs `e_{σ⁻¹(j)}`; composition order | `(s₁s₂)(1) = 2`, `(s₂s₁)(1) = 3`; inverse realization `(s₁s₂)⁻¹(1) = 3`; `det n_{s₁} = −1`, `det(n_{s₁}d) = det(n_{s₂}d) = 1` for `d = diag(−1,1,1)` | consistent, R03 repaired; none |
| Conventions: coefficient vs trace | Circle scalar action at `i` | `⟪i·1,1⟫ = −i`; trace `i`; native index `−x.1` | r8: consistent |
| Conventions: nonabelian coefficient | S₃ standard rep, 3-cycle | `⟪Re₁,e₁⟫ = −1/2`; identity 1; zero vector 0 | r8: consistent |
| Irreducibility convention | `V = 0`; trivial ℂ; trivial ℂ² | lattice sizes 1, 2, 3; `IsSimpleOrder` false, true, false | r8: consistent |
| 0.1 tensor and dual | C₃ character ω | tensor trace ω²; dual trace ω⁻¹ = ω² | r8: consistent |
| 0.2 HS norm, adjoint, degenerate measure | two atoms of mass ½; `μ = 0` | HS² = 1 = `∫|k|²`; entry `i/2` vs adjoint `−i/2`; `A_k = 0` for `μ = 0` | r8: consistent |
| 1.1 Gram slot; invariance ⇔ commutation | ℂ, `T = 2I`; ℂ² with swap | `h(1,i) = 2i` vs `−2i`; `STe₁ = e₂`, `TSe₁ = 2e₂` | r8: consistent |
| 1.2 Lean theorem (existence, `hself`, reducible control, isometry) | irreducible ℂ with `T = 2I`, `(1+i)I`; trivial ℂ² `diag(1,2)`; `h₂ = 4h₁` | `c = 2`; `1+i ∉ ℝ`; not scalar and not irreducible; inverse `2I` | r8: consistent |
| 1.3 commutant block order; empty and simple blocks | `E₁₂E₂₁`, `E₂₁E₁₂`; `V = 0`; one copy | `E₁₁`, `E₂₂`, `E₁₂† = E₂₁`; one element; cone ℝ>0 | r8: consistent |
| Finite-group averaging | C₃ trivial | normalized `h`; unnormalized `3h` | r8: consistent |
| 2.1 `IsGFinite`, submodule; strong vs norm continuity; compactness; mass; error | `0`, 𝔽₂, modes 0 and 1; rotations `R_θ`; ℤ-shift; kernels of mass 1, 2; `C_π = 2`, `‖v‖ = 3` | orbit-span dims 0, 1, 2; `‖R_θ − I‖ = 2`; infinite orbit span; `v`, `2v`; total `< ε` | r8: consistent |
| 3.1 countability, separability, orthogonality, support, Borel | trivial; Circle; `Circle^J` uncountable; empty product | dual sizes 1, ℵ₀, ≥ |J|; `‖χ_j − χ_k‖² = 2`; supports 1 and 0; σ-algebras | r8: consistent |
| 4.1 finite coordinates; factorization; product dual inverse; torus uniqueness; topology | tail `χ(x) = −1`; `S₃ × C₃`; `Circle²` at `(i,−1)`; exponents 0, ±1; `χ_n` on `Circle^ℕ` | `x¹ ∉ centeredArc(π/2)`; `−ω`; `−i`; `1, i, −i`; `χ_n(−1,…) = −1`, discrete dual | r8: consistent |
| 5.1 bijection; scalar pinning; operations; Parseval; uniform density | trivial, C₃, zero rep, trivial ℂ²; Circle `χ(z) = z`; `f = c_χ + 2c_ψ` | dims 1, 1, 0, 2; index −1 native; `‖f‖² = 5`; Fourier matrix rank 3 | r8: consistent |
| 6.1 group completion | trivial group | `R = ℤ`; `−[ℂ]` not genuine | r8: consistent |
| 6.2 period lattice; weights | period 2π, slopes 1, ½; `z ↦ z⁻¹` at `i` | `exp(πi) = −1`; weight −1, trace −i | r8: consistent |
| 6.3 conjugation on weights | rotation plane, `v = e₁ − ie₂` | `c(v)` has `e^{−iθ}`; `c(iv) = −ic(v)`; `c² = id` | r8: consistent |
| 6.4 action law | `n ↦ nt`; `(w₁w₂)·χ` | `χ((nt)⁻¹s(nt)) = χ(n⁻¹sn)`; left action | r8: consistent |
| 6.5 covers, descent parity, root dictionary, reductive control, index | Circle, SU(2)→SO(3), `S¹×SU(2)→U(2)`; U(2) pairs; `H = diag(1,−1)` | kernels 1, 2, 2; `(−1)^{q−a}`; `α(H) = 2`; `B(I,I) = 0`; index 2 | r8: consistent |
| 6.6 descent uniqueness | SU(2) weights 1, 2; U(2) pairs | central exponents 1, 3 at `i`: `i`, `−i` | r8: consistent |
| 6.7 restriction ring; 6.8 U(n) congruence and ranks 0, 1 | trivial, Circle, SU(2); U(3) λ = (2,1,−1) | `χ₂ = t² + t⁻² + 1`; `5 ≡ 2 (mod 3)`; `ζ⁻¹ ≠ 1` | r8: consistent |
| 6.9 Lean iff (both directions, instances, negative powers) | `L_(p,q)`; `f = 1,2,1`; `f = 1` at `(1,−1),(−1,1)`; `f = 0`; `det⁻¹` at `diag(i,−1)` | telescoping to `f(a,b)`; `Sym² ⊕ det`; both sides false; `n = 0` both true; trace `i` | r8: consistent |
| 7.1 kernels, uniqueness and `n = 0`, realization vs unitarity, counts | `Sym^d` at `i`, `−1`; zero rep; monomial model; `n = 0…4` | kernels SU(2), {I}, {±I}; `m = 0`; `p = 1,1,2,3,5`, `p_odd = 1,1,1,2,2` | r8: consistent |
| Etingof scope | Theorem 37.5 | countable base at `etingof line 152` | r8: cited as the countable case only |

**Supplier contract, cross-roadmap citations, ownership.** The diff adds no library declaration, no supplier citation and no `*Needs:*` line; the only citation it touches is §6.4's "LieGroups Layer 6's normalizer quotient", resolved above on main. The contract tables in the previous report (Tau Ceti at `a91d3aaf`, Mathlib at `6b7abb3c`, the nine cross-roadmap rows, the ownership search over main, the board index and the indexed open heads) apply unchanged; the citation resolver found no unresolved citation or Lean name at this head, and the diff outside the folder is empty.

## Not verifiable

- Conway, *A Course in Functional Analysis*, VII.9 Exercises 8–11: paywalled (DOI 10.1007/978-1-4757-4383-8), not in the sources cache, cited locator-only and marked so in the README (untouched by this diff).
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap service's index (2026-11-03T20:31:37Z): no `CompactGroupsPartII` folder among them.

## Source issues

- **Misprint** in etingof at Corollary 37.7 proof, printed p.203 (`etingof line 176`): the source says the quotient by the kernel of the first m irreducibles embeds into the unitary group of the first n; it should be the first m; affects the proof.
- **Gap** in knapp at Proposition 4.67 proof, printed p.267 (`knapp line 11245`): the source says the index statement follows from Corollary 4.47 and Proposition 4.58; it should also show every character of the finite kernel extends to the covering torus; affects the proof; corrected in print at the appended Corrections as of June 30, 2023, pp.814–815 (`knapp line 34709`–34727).
