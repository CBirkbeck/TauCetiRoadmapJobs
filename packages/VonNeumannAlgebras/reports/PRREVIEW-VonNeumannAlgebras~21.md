# Review of VonNeumannAlgebras (pull request #1041 at 32452f4)

**Verdict:** rejected

Incremental re-review of the 5 lines changed since f153571 (`TauCetiRoadmap/VonNeumannAlgebras/README.md:357–358`, the locator of the V1.3 multi-vector amplification step; `Suggested.lean` unchanged). The change repairs R02 of the previous review and introduces nothing new. R01 of the previous review, the one defect no edit inside the folder can repair, still holds at this head and is written again below as the sole finding.

## R01 (P1) — The folder re-plans a roadmap that is on main

**Location:** the whole folder: `TauCetiRoadmap/VonNeumannAlgebras/README.md:1` ("# Roadmap: von Neumann algebras: operator foundations and measurable fields") and `Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`).

**Claim:** `TauCetiRoadmap/VonNeumannAlgebras` on main is the folder added by pull request #889 (commit f8dfe0ad, "Von Neumann algebras, factors and modular theory (#889)"): a 4337-line README with `## Layer 0` to `## Layer 13` (`:2785` Layer 11, `:3388` Layer 12, `:3688` Layer 13) and a 215-line `Suggested.lean` with 17 declarations in the same namespace. This head's folder is a 1214-line README of Layers 0–4 under different section names and a 135-line `Suggested.lean` with 11 declarations under different names (`IsCyclicVector` for main's `IsCyclic`, `MurrayVonNeumannEquiv` for main's `ProjectionEquivalent`, …). Merged, it would replace main's roadmap with a smaller, differently named snapshot of its first five layers, delete Layers 5–13 and the sections `V0.SeparableFaithful`, `V2.BorelCalculus`, `V2.RectangularL2`, `V2.AbelianClassification`, `V4.0.Multiplication`, `V4.0.Decomposition`, and break the consumers on main that cite them. The principle "a Tau Ceti roadmap is existing work: it is built on, never re-planned" applies to this folder itself. The pull request's own description says the same: the complete programme "is retained and corrected in the full single-owner" #889 and "the original #1041 branch is retained as its historical staged snapshot".

**Witness:** `git log -1 origin/main -- TauCetiRoadmap/VonNeumannAlgebras` → `f8dfe0ad … (#889)`; `git merge-tree --write-tree origin/main HEAD` → `CONFLICT (add/add)` on `README.md` and on `Suggested.lean`; on main outside the folder, 31 citations of `VonNeumannAlgebras V5`–`V13` or `V4.0.Decomposition` (`Subfactors/README.md:97, :99, :106, :320`, `BanachAlgebras/README.md:2043`, `TypeAHeckeAlgebras/README.md:894`, …), each resolving on main (`README.md:1279` `**V4.0.Decomposition**`) and none in this folder.

Re-raised: H01 of the repair reports (rounds 13–19), which answered the two-owner finding with "nothing in this folder can change #889". That reason fails because the second owner is no longer an open pull request but main itself, and this head still conflicts with it on both files.

**Repair:** close this pull request. Whatever this folder states that main's Layers 0–4 do not (the V3.2 zero-corner clause with its identity-inclusion Check, the V2.5 weights `3⁻ⁿ` against `2⁻ⁿ`, the V1.2 negative control for a unit-ball criterion, the Jones 4.4.2 attribution, and now the repaired V1.3 locator "Lemma 2.5.5 and the proof of Theorem 2.5.6") is submitted as a revision of main's folder, written as a diff against main that keeps main's headings, section names and declaration names. Control: `git merge-tree origin/main <head>` reports no conflict, and every citation of `VonNeumannAlgebras V5`–`V13` and `V4.0.Decomposition` on main still resolves.

## Previous findings

Review of this pull request at f153571 (round 20):

- R01 — not repaired: the folder is unchanged apart from two lines; main still carries #889's folder at f8dfe0ad and the merge still conflicts on both files. Written again as R01 above.
- R02 — repaired: `README.md:357–358` now reads "(Peterson, Lemma 2.5.5 and the proof of Theorem 2.5.6, pp. 28–29)". Checked on the cited text: peterson-notes line 1035 (Lemma 2.5.5, one vector `ξ`, page 28) and lines 1052–1057 (the diagonal subalgebra `Ã ⊂ M_n(B(H))`, `x ⊕ ⋯ ⊕ x ∈ Ã''`, the lemma applied to `ξ₁ ⊕ ⋯ ⊕ ξ_n`, page 29). Both passages lie within pp. 28–29, so the page range stands. The repair introduced no new problem: the only other citation of these results, `README.md:351` ("Peterson, Theorem 2.5.6, p. 29"), agrees with line 1045 of the cache (page 29), and the gate's text scanners pass on the reflowed lines.

## Verified sound

**The changed passage** (`README.md:355–358`). The statement: for a unital star subalgebra `A ⊆ B(H)`, `x ∈ A''` and `ξ₁, …, ξ_n ∈ H`, the projection `p` onto the closure of `A(ξ₁ ⊕ ⋯ ⊕ ξ_n)` in `Hⁿ` lies in the commutant of the diagonal copy `Ã` of `A`, so `x ⊕ ⋯ ⊕ x ∈ Ã''` preserves that closure. The hypotheses the README states at `:348` ("unital star subalgebra") are the source's ("self-adjoint algebra containing 1", lines 1035 and 1045–1046). Computed instance in the table below.

**Gate.** My run at 32452f4 with the board's merge order: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. Neither check sees R01: the gate diffs against the merge base, not against main's tip.

**Dependency check** (verbatim):

```text
depcheck: 240 roadmaps, 2309 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists VonNeumannAlgebras at line 5. The citation resolver reports nothing found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0 in 5 s, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), no other warning. `git diff f153571..HEAD -- Suggested.lean` is empty. A scratch file with `#check @name` for all eleven declarations elaborates: `exists_faithful_representation` and `exists_vonNeumannAlgebra_starAlgEquiv` take `(A : Type u) [CStarAlgebra A]` (and `[WStarAlgebra M]`); every other declaration carries `{H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`; no section binder is lost, and each type matches its README statement as compared in the previous review. The one-tactic probes (`simp`, `rfl`, `aesop`, `exact?` on each of the seven sorries, none closing) are carried from the previous review since the file is byte-identical.

**Ownership.** `roadmaps list` (457 open pull requests, index of 2026-11-05T21:37:57Z): the only pull request carrying `VonNeumannAlgebras` is #1041 itself; the owner of every object of this folder is main (R01). The content checkout read is main at 6a10c491.

**Sources read this round.** peterson-notes (cache `5a30c5db…`, 124 pages, math.vanderbilt.edu, pdf page = printed page): lines 1035–1036 (Lemma 2.5.5, p. 28), 1039–1044 (its proof, p. 29), 1045–1057 (Theorem 2.5.6 and proof, p. 29). The seeded sample of 15 locators was checked in full by the previous review at the same text; the diff touches only sample item 1 (Lemma 2.5.5), re-checked above. No new source issue was found; the Jones `Λ` gap recorded by the previous review stands.

**Computed adversarial pass.** The new row first; the 31 rows for statements the diff leaves untouched are carried from the previous review (round 20, same file contents), each with the values it computed.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| V1.3 amplification step `:355–358` (new) | `A = D` diagonal in `M₂`, `n = 2`, `ξ₁ = e₁`, `ξ₂ = e₂`; control: `A = T` upper triangular (not star-closed), `n = 1`, `ξ = e₁` | `D(e₁ ⊕ e₂) = {(z e₁, w e₂)}`, closed, `p = diag(e₁₁, e₂₂) ∈ M₂(B(ℂ²))`; `diag(d, d) p = p diag(d, d)` since `d` diagonal commutes with `e₁₁, e₂₂`: `p ∈ Ã'`; `Ã' = M₂(D)`, `Ã'' = {diag(x, x) : x ∈ D'' = D}`; `x = e₁₁`: `(e₁₁ ⊕ e₁₁)(e₁, 0) = (e₁, 0)`, `(0, e₂) ↦ 0`, both in the closure; control: `T e₁ = ℂe₁`, `p = e₁₁`, `e₁₁ e₁₂ = e₁₂ ≠ 0 = e₁₂ e₁₁`, so `p ∉ T'`: the star hypothesis is used and stated | retain |
| `exists_faithful_representation` (r20) | zero algebra; `ℂ`; `ℂ²` | zero: `K = 0`; `ℂ`: `GNS = ℂ`, `π = id`; `ℂ²`, `a = (1, 0)`: state `(z, w) ↦ z` gives `f(a) = 1 = ‖a‖ ≠ 0` | retain |
| `bicommutant_eq_iff_isClosed_wot` (r20) | `ℂ·1` on `ℂ²`; finite rank `+ ℂ·1` on `ℓ²`; `H = 0` | `ℂ·1`: `A'' = A`, closed, both true; finite rank: `A'' = B(H) ≠ A`, `P_n S P_n → S ∉ A`, both false; `H = 0`: both true | retain |
| `kaplansky_closure_unitBall` (r20) | finite rank `+ ℂ·1`; upper triangular in `M₂` | `‖P_n S P_n‖ ≤ 1`, `P_n S P_n ξ → Sξ`, `‖S‖ = 1`; strong limits of contractions are contractions; upper triangular: `A'' = M₂`, `dist(e₂₁, A) = 1`, false without `StarSubalgebra`, which the signature has | retain |
| `MurrayVonNeumannEquiv` orientation (r20) | `v = e₂₁` | `v*v = e₁₁`, `vv* = e₂₂`; swapped model excluded by the Check `:538` | retain |
| `MurrayVonNeumannSubequiv`, `murrayVonNeumannEquiv_of_subequiv` (r20) | `B(ℓ²)`, `p = 1`, `q = 1 − e₀` | `S*S = 1`, `SS* = 1 − e₀ ≤ q`; `1 − e₀ ≼ 1` by `v = 1 − e₀`; `1 ∼ 1 − e₀` by `S`; `1 ≠ 1 − e₀` | retain |
| `exists_predual` (r20) | `H = 0`; `N = ℂ` | `X = 0`; `X = ℂ̄`, `L ↦ conj(L(1))` conjugate-linear as `≃ₗᵢ⋆` requires; `X : Type u` matches `WStarAlgebra` | retain |
| `exists_vonNeumannAlgebra_starAlgEquiv` (r20) | conjugate-linear predual; zero algebra | composing with scalar conjugation gives a linear isometry `(X̄)* → M`, Sakai applies; `K = 0`, `N = {0}` | retain |
| `IsCyclicVector`, `IsSeparatingVector`, the iff (r20) | `M₂`, `e₁`; `D`, `e₁ + e₂` and `e₁`; `H = 0` | `M₂e₁ = ℂ²`, `M' = ℂ` separating, `e₂₂e₁ = 0`; `D(e₁+e₂) = ℂ²`, `x(e₁+e₂) = 0 ⟹ x = 0`; `De₁ = ℂe₁`, `e₂₂e₁ = 0`, both false; `H = 0` both true | retain |
| V0.1 Checks `:233–241` (r20) | `ℂ²`, `(z,w) ↦ (z−w)/2`; `M₂`, `ω_{e₁}`, `x = e₁₁ + e₁₂` | `|1−(−1)|/2 = 1`; value `−1/2` at `(0,1)`; `f(x*x) = 1`, `|f(x)|² = 1 ≤ 1` | retain |
| V1.1 `φ = Σ n⁻² ⟨e_n, · e_n⟩` `:265–289` (r20) | `P_η`; `e_m + m e_n` | `φ(P_η) = Σ n⁻²|⟨e_n,η⟩|²`, `‖φ‖ = π²/6`; `Σ_i ‖(e_m + m e_n)ξ_i‖² < ε²` | retain |
| V1.1 Check `T_n` `:279–282` (r20) | tail split at `N` | `‖T_n e₀‖² = 1`; `|n^{−1/2} Σ_{k≤n} η_k| → 0` | retain |
| V1.2 Checks `:319–335` (r20) | `(1/N) Σ Sⁿ e₀`; `V = ker φ` | `‖·‖² = 1/N`; `φ(1) = π²/6 ≠ 0`, `1 ∉ V` | retain |
| V1.3 Check `{e₁₂}` `:375–377` (r20) | `x = [[a,b],[c,d]]` | `c = 0, a = d`; `{e₁₂}'' = span{1, e₁₂}`; `{e₁₂, e₂₁}'' = M₂` | retain |
| V1.3 nonunital `ℂe₁₁` `:378–379` (r20) | `W = ⋂ ker a` | `W = ℂe₂`, bicommutant in `B(ℂ²)` = diagonals `∋ 1 ≠ e₁₁` | retain |
| V2.1 Checks `:430–439` (r20) | `diag(1/2, 0)`; `e₁₁ + ie₂₂`; `u = −1` | `(a/‖a‖)^{1/n} = diag(1,0)`; `(u+u*)/2 = e₁₁`, `√(1−e₁₁) = e₂₂`; `h = π`, `σ(h) = {π}` | retain |
| V2.2 `(pq)ⁿ` `:479–482` (r20) | lines `ℂu, ℂv`, `cos θ < 1` | `(pq)ⁿ = |⟨u,v⟩|^{2n−2} pq`, norm `cos^{2n−1}θ → 0`, `p ∧ q = 0` | retain |
| V2.3 Checks `:542–560` (r20) | `M₂ ⊕ ℂ`, `p = e₁₁`; `S`, `p = e₁₁ + e₃₃` | `c(p) = e₁₁ + e₂₂`; `pSp = {0}`, `pMp ≅ M₂`; `dim V ⊗ W = 4`, `dim VW = 2` | retain |
| V2.4 Checks `:599–612` (r20) | `M₂ ⊗̄ M₂`; slice `e₁₂` | `16 = 4·4`; `R(x ⊗ e₁₂) = x`; `⟨e₂,e₁⟩x = 0`; `M₂ ⊗̄ 0 = 0` | retain |
| V2.5 weights and Checks `:625–720` (r20) | `3⁻ⁿ` vs `2⁻ⁿ`; `e₀ = 1_{[0,1/2]}`; two atoms; `a = e₁₁`; `H = 0` | `Σ_{k>n}3⁻ᵏ = 3⁻ⁿ/2 < 3⁻ⁿ`, `Σ_{k>n}2⁻ᵏ = 2⁻ⁿ` fails; `a = 4/3, 1/3`; `1_A + ½1_B`; `‖e₂₂‖ = 1 = ess sup`; `σ(a) = ∅`, `L∞(∅,0) = 0` | retain |
| V2.5 classification `:734–764` (r20) | `(δ₀ + λ)/2`; `μ = 0` | atom mass `1/2`, `L∞[0,1] ⊕ ℂ`; `μ = 0` gives `0/0`, so `μ(X) > 0` is needed and stated | retain |
| V3.1 Check `M₂ ⊗ 1` on `ℂ⁶` `:792–793` (r20) | `e₁₁ ⊗ 1` | rank `3`, commutant `1 ⊗ M₃` | retain |
| V3.2 inclusion matrices `:806–841` (r20) | `ℂ⊕ℂ ⊆ M₃`; identity; `ℂ ⊆ M₂ ⊆ M₄` | `λ₁₁ = 2, λ₂₁ = 1`, `3 = 2+1`; `Λ = I`, `rank(p₁e₂) = 0`; `[2][2] = [4]` | retain |
| V3.2 entry formula vs Jones 875–877 (r20) | Example 4.4.4 | `tr(p₁e₁) = 2`, `tr(p₂e₁) = 1` | retain |
| V3.3 Checks `:875–881` (r20) | `M₂`; shift; `U` on `ℓ²(ℤ)` | `τ(e₁₂) = 0`; `τ(e₀) = 0`; `(2−U)⁻¹ = Σ 2^{−n−1}Uⁿ`, infinite support | retain |
| V4.Core Checks `:972–989` (r20) | `diag(1/n²)`; `Γ`, `g ≠ e`; Banach limit | `π²/6`; `diag(1/n)` Hilbert–Schmidt not trace class; `Tr(xh) = 0`; `φ(1) = 1 ≠ Σφ(e_n) = 0` | retain |
| V4.PositivePredual Checks `:1047–1061` (r20) | `diag(2,−1)`; `tr/2`, `ξ = √2e₁` | `‖h‖₁ = 3`; `5 > 3`; `|w₁|² ≤ 1/4`; `φ(xe₁₁) = ⟨e₁/2, xe₁⟩` | retain |
| V4.Normality Radon–Nikodym `:1109` (r20) | `M = ℂ`, `ψ = ½ω_ξ` | `s = 1/√2 ∈ [0,1]` | retain |
| V4.0.Fields Checks `:1150–1163` (r20) | `μ = 2λ`; `λ|_{[0,1/2]}` | `‖√2f‖²_ν = ∫|f|²dμ`; fibre zero on `(1/2,1]`; decomposables `= L∞ = (L∞)'` | retain |
| Sampled locators 2–15 (r20) | as listed there | hypotheses compared item by item | retain |

32 rows in all, one newly computed; none leads to a mathematical finding.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`README.md:1127`, `:1212–1214`): no legal full text is reachable (North-Holland and Springer, not in the cache, no author-page or institutional copy); cited by locator, as the README does. Untouched by the diff.
- Ownership against open pull requests was checked on the index of 2026-11-05T21:37:57Z; pull requests outside that index were not searched.

## Source issues

- none
