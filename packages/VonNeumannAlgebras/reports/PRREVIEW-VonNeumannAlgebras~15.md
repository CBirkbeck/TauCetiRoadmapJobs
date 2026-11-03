# Review of VonNeumannAlgebras (pull request #1041 at 95571ab)

**Verdict:** needs changes

Incremental re-review of the 38 lines of `TauCetiRoadmap/VonNeumannAlgebras/README.md` changed since d9e53b3 (V2.5: the single-generator weight condition with two new Checks, and the `μ ≠ 0` hypothesis of the distribution-function isomorphism with a negative-control Check). `Suggested.lean` is unchanged. The two P3 findings of the previous review are repaired, and the repairs are mathematically correct: every new value was recomputed (table below) and the three locators the new text leans on were opened at their pages. The one blocking finding is unchanged, because it cannot be repaired inside this folder: the same author's pull request #889, still open at dee8088, still builds this folder's Layers 0–4, V4.0.Fields and the same Lean namespace. One new P3 note on the classification paragraph.

## R01 (P2) — Two open pull requests still build the same folder and the same objects

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`) and its seven theorems and four definitions; README Layers V0–V4 and V4.0.Fields.

**Claim:** `roadmaps list` (index of 2026-11-03T21:02:08Z) shows `#889 VonNeumannAlgebras (new) dee8088` and `#1041 VonNeumannAlgebras (new) 95571ab`, both by the same author. At dee8088, #889's README carries `## Layer 0` through `## Layer 4` (`:276`, `:393`, `:524`, `:906`, `:971`) with this folder's titles and `**V4.0.Fields — Hilbert and operator fields.**` (`:1182`), then Layers 5–13; its `Suggested.lean` opens `namespace TauCetiRoadmap.VonNeumannAlgebras` (`:61`) and declares the same objects under other names: `exists_injective_nondegenerate_representation_lp` (`:72`), `double_commutant_iff_isClosed_image_ofCLM` (`:83`), `closure_unitBall_eq_unitBall_double_centralizer` (`:92`), `IsCyclic`/`IsSeparating`/`isCyclic_iff_isSeparating_commutant` (`:111–120`), `ProjectionEquivalent`/`ProjectionSubequivalent`/`equivalent_of_subequivalent` (`:128–140`). The pull request's description at this head still says the complete programme is retained in #889 and that this branch is its historical staged snapshot. Re-raised: R01 of the reviews at d9e53b3 (rounds 13 and 14), b35ea83 and 8b00f8a.

**Witness:** `roadmaps show VonNeumannAlgebras --pr 889 --file Suggested.lean` lines above; `roadmaps show VonNeumannAlgebras --pr 889` `:276–1340`.

**Repair:** One owner per object. Either #889 is cut down to a `VonNeumannAlgebrasPartII` folder starting at its Layer 5, citing V0–V4 and V4.0.Fields of this folder by section (its Layers 0–4 deleted, main's consumers of V5+ repointed to the Part II), or this pull request is closed. Control: exactly one open pull request declares a bicommutant theorem on `StarSubalgebra ℂ (H →L[ℂ] H)` in `namespace TauCetiRoadmap.VonNeumannAlgebras`, and exactly one has a section named V4.0.Fields.

## R02 (P3) — `K` names both the compact support and the countable atom set in one paragraph

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:719–726`: "a nonzero nonatomic finite Borel measure `μ` on a compact `K ⊆ ℝ` … Classify the abelian von Neumann algebras … as `ℓ∞(K)` for a countable (possibly empty) set `K`", and the Checks `:732–733` ("has `K = ∅`", "has `K` a point").

**Claim:** The same letter denotes the compact subset of `ℝ` carrying `μ` (uncountable whenever `μ ≠ 0` is nonatomic) and, three lines later, the countable set of atoms; the Checks use it in the second sense only. A reader of the Check "`L∞([0,1], λ)` on `L²[0,1]` has `K = ∅`" can parse `K` as the support of `λ`, which is `[0, 1]`.

**Witness:** `μ = λ` on `K = [0, 1]` in the first sense; the same algebra has `K = ∅` in the second sense (`:732`). Peterson's Theorem 2.8.9 uses `K` only for the countable atom set (peterson-notes lines 1531–1535, 1539).

**Repair:** Rename the compact to `X` (or state the `θ` target directly on `σ(a)`, which is where it is applied) and keep `K` for the countable atom set, as the sources and the Checks do. Tested: with `X = [0, 2]`, `μ = λ`, the Check `L∞([0,2], λ) ≅ L∞([0,1], λ)` through `θ(t) = t/2` reads unchanged and has `K = ∅`.

## Previous findings

Review of this pull request at d9e53b3 (round 14):

- R01 — not repaired: `roadmaps list` still shows #889 at dee8088 and #1041 as `VonNeumannAlgebras (new)`; #889 at dee8088 carries Layers 0–4, V4.0.Fields and the same namespace, as quoted above. Nothing in this folder can repair it. Written again as R01.
- R02 — repaired: `:719–720` now reads "a nonzero nonatomic finite Borel measure `μ` on a compact `K ⊆ ℝ` (so `μ(K) > 0`)", the case split `:727–729` applies `θ` only when the nonatomic part is nonzero, and the Check `:736–738` records `μ = 0` as the negative control with `θ = 0/0`, `L∞(K, 0) = 0 ≠ L∞([0,1], λ)` and the classification reaching it as `ℓ∞(∅)`. Values recomputed in the table. The repair introduced no new problem beyond the pre-existing letter clash noted as R02 of this report.
- R03 — repaired: `:634–641` states the weight condition (each weight exceeds the sum of the later ones, `Σ_{k>n} 3⁻ᵏ = 3⁻ⁿ/2`, any base at least `3`), gives the inductive recovery with its two spectral intervals, the equivalent lexicographic injectivity of the digit map, and why `2⁻ⁿ` fails; the Checks `:701–707` add the non-orthogonal pair `e₀ = 1_{[0,1/2]} ≤ e₁ = 1` on `L²[0,1]` and the two-atom negative control where weights `2⁻ⁿ` collapse `a` to `1`. Every value recomputed in the table; all correct.

## Verified sound

**Gate** (run this round at 95571ab, verbatim): `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate at the same head also reports `build=0 OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only; the worktree is clean.

**Dependency check** (verbatim, run this round):

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The changed passages add no `*Needs:*` item and cite no new roadmap: V2.5's `*Needs:*` (`:742–743`) is unchanged (V1.3–V1.4, V2.1–V2.2, SelfAdjointSpectralTheory SA-B05–SA-B13, SA-B30, SA-B46, SA-B49, SA-B53, Mathlib `MeasureTheory.Lp`), all resolved on main by the previous review and all earlier in the supply direction.

**Lean.** `Suggested.lean` has no changed line since d9e53b3. `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`, run this round from the worktree: exit 0, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), nothing else. The worker's elaborated signatures (eleven declarations, none with a dropped binder) are identical to the previous round's and were compared again with the README statements of `exists_faithful_representation` (`:218`), `bicommutant_eq_iff_isClosed_wot` (`:352`), `kaplansky_closure_unitBall` (`:399`), `MurrayVonNeumannEquiv`/`MurrayVonNeumannSubequiv`/`murrayVonNeumannEquiv_of_subequiv` (`:490–498`), `exists_predual` (`:882`), `exists_vonNeumannAlgebra_starAlgEquiv` (`:889`), `IsCyclicVector`/`IsSeparatingVector`/`isCyclicVector_iff_isSeparatingVector_commutant` (`:1065–1067`): the generality agrees. The headline list, the not-statable headlines named in the docstring and the one-tactic padding probe are those of the review at d9e53b3 (round 14): nothing in the file changed, so the probe result (none of the seven theorems closes in one tactic, none restates a definition or a Check) carries over.

**Sources opened this round** (through the cache; pdf page equals printed page): peterson-notes (Peterson, *Notes on von Neumann algebras*, 2013) Lemma 2.8.8, p. 38, lines 1517–1530: a separable abelian von Neumann algebra is generated by one self-adjoint element, built as `Σ 4⁻ᵏ p_k` from a countable generating family of projections and recovered inductively by a continuous function of `4(x − p₀)`, which is the README's inductive route with base `4`; Theorem 2.8.9, pp. 38–39, lines 1531–1557: `ℓ∞K` or `L∞([0,1], λ) ⊕ ℓ∞K` for a countable, possibly empty `K` of atoms, with `θ(t) = μ([0, t])` pushing a full-support nonatomic probability measure to `λ` and `f ↦ f ∘ θ⁻¹` the isomorphism, which the README generalises to a normalised nonzero nonatomic finite measure on a compact set, where `θ` is only injective off a null set (its own remark `:722–723`). jones-vna (Jones, *Von Neumann algebras*, 2009) EP10, p. 23, lines 713–720: `a = Σ_{n≥0} 3⁻ⁿ e_n`, the tail `Σ_{n≥1} 3⁻ⁿ e_n` of norm at most `1/2`, `e₀` the spectral projection of `a` for `[3/4, 2]`, "continuing in this way"; lines 721–724, the abstract classification. The README's cut `[3⁻ⁿ, ∞)` for `a_n` and Jones's `[3/4, 2]` for `a` are both inside the gap `(3⁻ⁿ/2, 3⁻ⁿ]` between the two spectral intervals. The seeded sample's fifteen targets were verified by the previous review at the same locators; none of them falls in the changed lines except the three above.

**Ownership.** `roadmaps list` (index of 2026-11-03T21:02:08Z): #889 at dee8088 is the only other open pull request carrying this folder or declaring its objects (R01); its head is the one the previous review read, so the ownership grep of that review stands.

**Computed adversarial pass.** Rows computed this round on every changed statement; the rows for the untouched statements are those of the review at d9e53b3 (round 14, 35 rows) and the round-13 table at the same head (35 rows), cited and not repeated.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Weight condition `w_n > Σ_{k>n} w_k` for `w_n = b⁻ⁿ` | `b = 3`; `b = 2`; `b = 4`; general `b` | `Σ_{k>n} 3⁻ᵏ = 3⁻ⁿ⁻¹ · 3/2 = 3⁻ⁿ/2 < 3⁻ⁿ`; `Σ_{k>n} 2⁻ᵏ = 2⁻ⁿ`, not `<`; `Σ_{k>n} 4⁻ᵏ = 4⁻ⁿ/3` (Peterson's base); `Σ_{k>n} b⁻ᵏ = b⁻ⁿ/(b − 1) < b⁻ⁿ ⟺ b > 2`, so "any base at least `3`" is correct | retain |
| Inductive recovery `a_n = 3⁻ⁿ e_n + Σ_{k>n} 3⁻ᵏ e_k` | `n = 0` (`a_0 = a`); general `n`; `e_n = 1`; `e_n = 0` | on `ran e_n`: `3⁻ⁿ + [0, 3⁻ⁿ/2] = [3⁻ⁿ, 3⁻ⁿ · 3/2]`; on `ker e_n`: `[0, 3⁻ⁿ/2]`; the intervals are disjoint since `3⁻ⁿ/2 < 3⁻ⁿ`, and `a_n` commutes with `e_n`, so `P_{a_n}([3⁻ⁿ, ∞)) = e_n`; `e_n = 1`: `a_n ≥ 3⁻ⁿ`, projection `1`; `e_n = 0`: `a_n ≤ 3⁻ⁿ/2`, projection `0` | retain |
| Digit map `b ↦ Σ 3⁻ⁿ b_n` lexicographic | `(1, 0, 0, …)` vs `(0, 1, 1, …)`; first differing digit at `n` | `1` vs `1/2`: difference `1/2 = 3⁻⁰/2`; in general difference `≥ 3⁻ⁿ − 3⁻ⁿ/2 = 3⁻ⁿ/2 > 0`, so strictly increasing in lexicographic order, hence injective; the lex-monotonicity is equivalent to the weight condition (compare `(0…0, 1, 0, …)` with `(0…0, 0, 1, 1, …)` at position `n`) | retain |
| Weights `2⁻ⁿ` fail | `(1, 0, 0, …)` vs `(0, 1, 1, …)` | both give `1`; `2⁻ⁿ = Σ_{k>n} 2⁻ᵏ` exactly, so the two spectral intervals touch at `2⁻ⁿ` and the recovery cut does not exist | retain |
| Check: non-orthogonal pair on `L²[0,1]` | `e₀ = 1_{[0,1/2]}`, `e₁ = 1` | `a = 1_{[0,1/2]} + 1/3`: `4/3` on `[0, 1/2]`, `1/3` on `(1/2, 1]`; `P_a({4/3}) = 1_{[0,1/2]} = e₀`, `P_a({1/3, 4/3}) = 1 = e₁`; inductive cut `[1, ∞)` at `n = 0` gives `e₀` since `4/3 ≥ 1 > 1/3`; `e₀ ≤ e₁`, not orthogonal, so it tests what the orthogonal Check did not | retain |
| Check: two-atom negative control | `e₀ = 1_A`, `e_n = 1_B` (`n ≥ 1`), weights `2⁻ⁿ` and `3⁻ⁿ` | `Σ_{n≥1} 2⁻ⁿ = 1`: `a = 1_A + 1_B = 1`, `σ(a) = {1}`, `W*(a) = ℂ ≠ ℂ²`, `e₀` not a spectral projection; `Σ_{n≥1} 3⁻ⁿ = 1/2`: `a = 1_A + (1/2)1_B`, `σ(a) = {1, 1/2}`, `P_a({1}) = 1_A = e₀`, `W*(a) = ℂ²` | retain |
| Distribution function `θ` with `μ ≠ 0` | `μ = λ` on `[0, 2]`; `μ = 0` on `[0, 1]`; `μ = (δ₀ + λ)/2`; `μ = λ|_{[0,1/2]} + λ|_{[1,3/2]}` on `[0, 3/2]` | `μ(K) = 2`, `θ(t) = t/2`, `θ_*(λ/2) = λ` on `[0, 1]`; `μ = 0` excluded by the new hypothesis, and `L∞(K, 0) = 0 ≠ L∞([0,1], λ)`, as the Check says; `(δ₀ + λ)/2` has an atom, excluded; the last: `θ` is constant `1/2` on `[1/2, 1]`, one degenerate fibre, a `μ`-null interval, `θ` injective off it, `θ_*(μ/1) = λ` | retain |
| Classification case split | nonatomic part `0` (diagonal `ℂ³`, zero algebra); nonatomic part `≠ 0` (`λ` on `[0, 1]`; `(δ₀ + λ)/2`) | `ℓ∞({0,1,2})`, `ℓ∞(∅)`; `L∞([0,1], λ) ⊕ ℓ∞(∅)`; one atom, `L∞([0,1], λ) ⊕ ℂ`; the atomic and nonatomic parts are mutually singular (the atom set is countable and `μ`-nonatomic-null), so `L∞(σ(a), μ)` splits as the direct sum | retain |
| Letter `K` in the classification paragraph | `μ = λ` on `[0, 1]` | compact `K = [0, 1]` (first sense) and atom set `K = ∅` (second sense, Check `:732`) for the same algebra | R02 |

9 rows computed this round, one leading to a P3 (R02), none false. The R01 object comparison (namespace and declarations of #889 at dee8088) was re-read this round at the lines quoted.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`:1099`, `:1184–1186`): no legal full text is reachable (North-Holland and Springer, not in the cache); cited by locator, as the README does. Not touched by the diff.
- Ownership against open pull requests was checked through `roadmaps list` and `roadmaps show` on the index of 2026-11-03T21:02:08Z and the previous review's grep over the sibling checkouts; pull requests outside that index were not searched.

## Source issues

- none
