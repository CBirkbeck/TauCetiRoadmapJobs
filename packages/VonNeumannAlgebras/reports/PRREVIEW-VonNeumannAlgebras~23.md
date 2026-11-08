# Review of VonNeumannAlgebras (pull request #1041 at 6c9ac6d)

**Verdict:** rejected

Incremental re-review of the 31 lines changed since 32452f4 (all in `TauCetiRoadmap/VonNeumannAlgebras/README.md`, V1.4 Kaplansky density; `Suggested.lean` is byte-identical to the head the previous review read; nothing changed outside the folder). The change repairs R02 of the previous review and introduces no new defect. The one defect no edit inside the folder can repair, that the folder re-plans the roadmap that is on main, is unchanged and is written again as R01.

## R01 (P1) — The folder re-plans a roadmap that is on main

**Location:** the whole folder: `TauCetiRoadmap/VonNeumannAlgebras/README.md:1` ("# Roadmap: von Neumann algebras: operator foundations and measurable fields") and `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`).

**Claim:** `TauCetiRoadmap/VonNeumannAlgebras` on main (read at ffac5139, the same main the previous review read) is the folder added by commit f8dfe0ad, "Von Neumann algebras, factors and modular theory": a 4337-line README with `## Layer 0` to `## Layer 13` and a 215-line `Suggested.lean` with 17 declarations in this namespace, plus `metadata.toml`. This head's folder is a 1225-line README of five layers under other section names (`## V0.` … `## V4.`) and a 135-line `Suggested.lean` with 11 declarations, every one of which states an object main already states under another name (`exists_faithful_representation` for main's `exists_injective_nondegenerate_representation_lp`, `bicommutant_eq_iff_isClosed_wot` for `double_commutant_iff_isClosed_image_ofCLM`, `kaplansky_closure_unitBall` for `closure_unitBall_eq_unitBall_double_centralizer`, `IsCyclicVector`/`IsSeparatingVector` for `IsCyclic`/`IsSeparating`, `MurrayVonNeumannEquiv`/`MurrayVonNeumannSubequiv`/`murrayVonNeumannEquiv_of_subequiv` for `ProjectionEquivalent`/`ProjectionSubequivalent`/`equivalent_of_subequivalent`). Merged, it would replace main's roadmap by a smaller, differently named snapshot of its first five layers, delete Layers 5–13 and the sections `V4.0.Decomposition`, `V4.0.Multiplication`, `V2.BorelCalculus` and the rest, and break every consumer on main that cites them. The principle "a Tau Ceti roadmap is existing work: it is built on, never re-planned" applies to this folder itself; the pull request's own description calls this branch the "historical staged snapshot" of the programme "retained and corrected" in the roadmap now on main.

**Witness:** `git log -1 origin/main -- TauCetiRoadmap/VonNeumannAlgebras` → `f8dfe0ad`; `git merge-tree --write-tree origin/main HEAD` at 6c9ac6d → `CONFLICT (add/add)` on `README.md` and on `Suggested.lean`; the merge base is 350e970c, before f8dfe0ad, which is why the gate (a diff against the merge base) reports `outside-folder=0` and sees no conflict.

Re-raised: H01 of the repair reports (rounds 13–19), which answered the two-owner finding with "nothing in this folder can change the other pull request". That reason fails because the second owner is no longer an open pull request but main itself, and this head still conflicts with it on both files.

**Repair:** close this pull request. Whatever this folder states that main's Layers 0–4 do not (now including the V1.4 positive-part derivation and its `q` Check at `README.md:403–409` and `:424–431`, the V3.2 zero-corner clause with its identity-inclusion Check, the V2.5 weights `3⁻ⁿ` with the `2⁻ⁿ` negative control, the V1.2 negative control for a unit-ball criterion, the Jones 4.4.2 attribution, the V1.3 locator "Lemma 2.5.5 and the proof of Theorem 2.5.6") is submitted as a revision of main's folder, written as a diff against main that keeps main's headings, section names and declaration names. Control: `git merge-tree origin/main <head>` reports no conflict, and every citation of `VonNeumannAlgebras V5`–`V13` and `V4.0.Decomposition` on main still resolves.

## Previous findings

Review of this pull request at 32452f4 (round 22):

- R01 — not repaired: main is unchanged at ffac5139 with the f8dfe0ad folder; `git merge-tree --write-tree origin/main HEAD` still reports `CONFLICT (add/add)` on both files. Written again as R01 above.
- R02 — repaired: `README.md:396–399` now cites Houdayer Theorem 3.16, Jones Theorem 5.2.1 and "Peterson, Theorem 2.6.4 and its proof, p. 31, whose statement gives the self-adjoint part without the norm bound" for the unit-ball and self-adjoint clauses only, and `:403–408` derives the positive clause with its inequality. Each locator says what it is cited for (houdayer line 784–787; jones-vna line 957–960; peterson-notes line 1128–1131, proof line 1136–1139, on page 31 since the page-32 marker is line 1168). The repair introduced no new problem: the derivation and the new Check are computed in the table below.

## Verified sound

**Gate.** My run at 6c9ac6d against `origin/main`: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.

**Dependency check** (verbatim):

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists VonNeumannAlgebras at line 5. `roadmaps resolve` on the README: "Lean names found nowhere: None"; no cross-roadmap citation unresolved. The changed passage cites V1.1–V1.3 and Mathlib `cfc` only (`README.md:433`), all earlier in the same roadmap or at the pin, so the change adds no supplier edge.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` at this head: exit 0, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), no other warning. The file is byte-identical to 32452f4 (`git diff 32452f4 HEAD -- Suggested.lean` empty), so the previous review's `#check @name` comparison of all eleven elaborated types with the README (no section binder lost) and its one-tactic probe (all seven `sorry` sites fail under `first | simp | rfl | aesop | decide | infer_instance`, so nothing is padding) stand; the worker's `signatures.md` for this head shows the same eleven types, and `kaplansky_closure_unitBall` (`:71`) still states exactly the unit-ball clause of V1.4 (`README.md:396–400`), the only clause the Lean file carries, with `A : StarSubalgebra ℂ (H →L[ℂ] H)` (unital and star-closed, as the README's hypothesis) over `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`. The positive and self-adjoint clauses are README targets without Lean counterparts, as before.

**Sources: the changed passage.** Read at the cached texts (Houdayer `21d589d7…`, Peterson `5a30c5db…`, Jones 2009 `69b08503…`; pdf page = printed page in all three). The seeded sample's target 7 (Kaplansky density) falls in the diff and was re-read; the other 14 targets lie outside the changed lines and stand as the previous review recorded them.

1. Houdayer Theorem 3.16, p. 17 (houdayer line 784–787): `A ⊆ B(H)` a unital star subalgebra, `M` its strong closure; the strong closure of `(A)₁` is `(M)₁`, and of `(ℜ(A))₁` is `(ℜ(M))₁`. Supports the two clauses at `README.md:396–398` with the README's hypotheses.
2. Jones Theorem 5.2.1, pp. 32–33 (jones-vna line 957–960): `A` a star subalgebra (not assumed unital; the README's "unital" is narrower, so the citation covers it); unit ball strongly dense in the unit ball of the weak closure, and the self-adjoint part of the unit ball likewise. Supports `:396–398`.
3. Peterson Theorem 2.6.4, p. 31 (peterson-notes line 1128–1131): `A` self-adjoint subalgebra, `B` its SOT closure; (i) the SOT closure of `A_{s.a.}` is `B_{s.a.}`, with no norm bound; (ii) the SOT closure of `(A)₁` is `(B)₁`. The proof, line 1136–1139, obtains that `(A)₁ ∩ A_{s.a.}` is SOT dense in `(B)₁ ∩ B_{s.a.}`. The README's qualification "and its proof … whose statement gives the self-adjoint part without the norm bound" (`:398–399`) is exactly right.
4. The route named at `:400–403` (homeomorphism `t ↦ 2t/(1 + t²)`, the identity for `y − x`, the amplification `[[0, x], [x*, 0]]`) is the proof of houdayer line 788–800 and jones-vna line 968–1007; the word "positive" occurs in none of the three statements or proofs, so the positive clause is correctly presented as derived.
5. V1.1's joint strong continuity of products on norm-bounded sets, which the derivation invokes at `:407–408`: jones-vna line 551–552 (Exercise 3.4.1, on page 19: marker line 529) and peterson-notes line 994–995 (Exercise 2.4.7, on page 27: marker line 960) state it as cited at `README.md:261–262`.

**Computed adversarial pass.** The two rows marked (this round) are the statements the diff changes; the remaining rows are carried from the previous report (round 22, which recomputed 22 of them on the same file contents and carried the rest from round 20/21), with the values that report recorded.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| V1.4 positive clause, derivation `:403–408` (this round) | identity for `y² − x`; `x = 0`; `x = 1`; `x = e₁₁ ∈ M₂`, `y = diag(1, t)` | `y² − x = y(y − √x) + (y − √x)√x`, so `‖(y² − x)ξ‖ ≤ ‖y‖‖(y − √x)ξ‖ + ‖(y − √x)√xξ‖ ≤ ‖(y − √x)ξ‖ + ‖(y − √x)√xξ‖` using `‖y‖ ≤ 1`: the stated inequality; `√x ∈ M` self-adjoint with `‖√x‖ = ‖x‖^{1/2} ≤ 1`, so the self-adjoint clause applies; `x = 0`: `y_α → 0`, `y_α² → 0`; `x = 1`: `√x = 1 ∈ A`; `M₂`: `y² − e₁₁ = diag(0, t²)`, `‖(y² − e₁₁)ξ‖ = t²|ξ₂| ≤ |t||ξ₂| + 0`, both sides as stated | retain |
| V1.4 Check `q` `:424–431` (this round) | `q` even-vector projection on `ℓ²(ℕ)`, `A` = finite rank `+ ℂ·1`; `c = 0, 1, 1/2`; `n = 3`; `A = M₂` | `q − c·1 = (1 − c)q − c(1 − q)`: eigenvalues `1 − c` on the even span and `−c` on the odd span, each of infinite multiplicity; `c = 0`: rank `∞` (even span); `c = 1`: rank `∞` (odd span, eigenvalue `−1`); `c = 1/2`: both; so `q ∉ A`. `qP₃` = projection onto `span{e₀, e₂}`, rank 2, in `A`, `0 ≤ qP_n ≤ 1`; `qP_nξ = P_n(qξ) → qξ`. `ker F` has finite codimension, the even span is infinite-dimensional, so a unit `ξ ∈ ker F` with `qξ = ξ` exists and `(q − a)ξ = (1 − c)ξ`; likewise `−c` on the odd span; `max(|1 − c|, |c|) ≥ (|1 − c| + |c|)/2 ≥ 1/2`; at `c = 1/2`: `‖q − a‖ ≥ 1/2`. `A = M₂`: positive unit balls coincide | retain |
| `exists_faithful_representation` `:52` (r22) | zero algebra; `ℂ²`, `a = (1, 0)` | zero: `K = 0`, `π = 0` injective on one element; `ℂ²`: state `(z, w) ↦ z` has `f(a*a) = 1 ≠ 0`, so `π_f(a) ≠ 0` | retain |
| `bicommutant_eq_iff_isClosed_wot` `:62` (r22) | `ℂ·1` on `ℂ²`; finite rank `+ ℂ·1` on `ℓ²` | `ℂ·1`: `A'' = A`, image closed, both true; finite rank: `A'' = B(H) ≠ A`, `P_n S P_n → S ∉ A` weakly, both false | retain |
| `kaplansky_closure_unitBall` `:71` (r22) | finite rank `+ ℂ·1`; upper triangular in `M₂` | `‖P_n S P_n‖ ≤ 1 = ‖S‖`, strong limit `S`; strong limits of contractions are contractions (`⊆`); upper triangular: `A'' = M₂`, `dist(e₂₁, A) = 1`, false without the star hypothesis, which `StarSubalgebra` carries | retain |
| `MurrayVonNeumannEquiv` orientation `:82` (r22) | `v = e₂₁` in `M₂` | `v*v = e₁₁ = p`, `vv* = e₂₂ = q`: initial projection first, as README `:519–520` | retain |
| `MurrayVonNeumannSubequiv`, `murrayVonNeumannEquiv_of_subequiv` `:88–94` (r22) | `B(ℓ²)`, `p = 1`, `q = 1 − e₀`; `p = q = 0` | `S*S = 1`, `SS* = 1 − e₀ ≤ q`: `1 ≼ 1 − e₀`; `v = 1 − e₀`: `1 − e₀ ≼ 1`; `1 ∼ 1 − e₀` by `S`; `p = q = 0`: `v = 0` | retain |
| `exists_predual` `:106` (r22) | `H = 0`; `N = ℂ` on `ℂ` | `H = 0`: `X = 0`, `StrongDual ℂ 0 = 0 ≃ N = 0`; `N = ℂ`: `X = ℂ`, `L ↦ conj(L(1))` conjugate-linear isometric | retain |
| `exists_vonNeumannAlgebra_starAlgEquiv` `:114` (r22) | zero algebra; Peterson's `X* ≅ A` | zero: `K = 0`, `N = ⊤` on `0`; conjugating scalars on `X` turns the conjugate-linear isometry into a linear one, Peterson 4.4.6 applies | retain |
| `IsCyclicVector`, `IsSeparatingVector`, the iff `:121–131` (r22) | `M₂`, `e₁`; `D`, `e₁`; `ξ = 0`; `H = 0` | `M₂e₁ = ℂ²` dense, `M' = ℂ·1`: both true; `De₁ = ℂe₁` not dense, `e₂₂ ∈ D'`, `e₂₂e₁ = 0`: both false; `ξ = 0`: both false; `H = 0`: both true | retain |
| V0.1 Checks `:233–241` (r22) | `ℂ²`, `(z, w) ↦ (z − w)/2`; `z − w` | `sup |z − w|/2 = 1` at `(1, −1)`; value `−1/2` at `(0, 1)`; `z − w` has norm `2` | retain |
| V1.1 `T_n` Check `:284–287` (r22) | `T_n e₀ = n^(−1/2) Σ_{k ≤ n} e_k` | `‖T_n e₀‖² = 1`; `|⟪η, T_n e₀⟫| ≤ C_N n^(−1/2) + (Σ_{k > N} |η_k|²)^(1/2) → 0` | retain |
| V1.2 convex-hull Check `:327–330` (r22) | `(1/N) Σ_{n ≤ N} Sⁿ e₀` | `= (1/N) Σ_{n ≤ N} e_n`, norm² `1/N` | retain |
| V1.3 `{e₁₂}` Check `:382–384` (r22) | `x = [[a, b], [c, d]]` | `xe₁₂ = e₁₂x` ⟹ `c = 0`, `a = d`; `{e₁₂}'' = span{1, e₁₂}`; `{e₁₂, e₂₁}'' = M₂` | retain |
| V2.2 `(pq)ⁿ` Check `:515–518` (r22) | lines `ℂu`, `ℂv`, `cos θ = |⟪u, v⟫| < 1` | `(pq)ⁿ = |⟪u, v⟫|^(2n−2) pq`, norm `(cos θ)^(2n−1) → 0`, `p ∧ q = 0`; `1 − p ∼ q` | retain |
| V2.3 Checks `:553–565` (r22) | `M₂ ⊕ ℂ`, `p = e₁₁`; `V = span{e₁₁, e₃₃}`, `W = span{e₁₁ + e₂₂, e₃₃}` | `c(p) = e₁₁ + e₂₂`; `e₃₃p = 0 = e₃₃c(p)`; `dim VW = 2 < 4` | retain |
| V2.5 weights and Checks `:636–642`, `:699–711` (r22) | `3⁻ⁿ`; `2⁻ⁿ`; `e₀ = 1_{[0,1/2]}`, `e₁ = 1`; two atoms; `a = e₁₁` | `Σ_{k > n} 3⁻ᵏ = 3⁻ⁿ/2 < 3⁻ⁿ`; `Σ_{k > n} 2⁻ᵏ = 2⁻ⁿ`; `a = 4/3` on `[0, 1/2]`, `1/3` on `(1/2, 1]`; `a = 1_A + ½1_B`; `2⁻ⁿ`: `a = 1`; `‖e₂₂‖ = 1 = ess sup_μ 1_{{0}}`, `ess sup_{δ₁} = 0` | retain |
| V3.1 Check `:794–795` (r22) | `M₂ ⊗ 1` on `ℂ² ⊗ ℂ³` | `e₁₁ ⊗ 1` has rank `3`; commutant `1 ⊗ M₃` | retain |
| V3.2 Checks `:830–839` (r22) | `M₂ ⊕ ℂ ⊆ M₅ ⊕ M₃`; identity on `ℂ ⊕ ℂ`; `ℂ ⊆ M₂ ⊆ M₄` | `Λ = [[2, 1], [1, 1]]`, `5 = 2·2 + 1·1`, `3 = 1·2 + 1·1`; `Λ = I`; `[2][2] = [4]` | retain |
| V3.3 Checks `:868–873` (r22) | `M₂`; `U` on `ℓ²(ℤ)` | `τ(e₁₂) = 0`, `τ(e₁₁) = τ(e₂₂)`; `(2 − U)⁻¹ = Σ 2^(−n−1) Uⁿ`, `‖U/2‖ = 1/2` | retain |
| V4.Core Checks `:977–991` (r22) | `diag(1/n²)`; `diag(1/n)`; Banach limit | `‖h‖₁ = π²/6`; `Σ 1/n² < ∞ = Σ 1/n`; `φ(e_n) = 0`, `φ(1) = 1` | retain |
| V4.PositivePredual Checks `:1061–1072` (r22) | `h = diag(2, −1)`; `φ = tr/2`, `ξ = √2 e₁` | `‖h‖₁ = 3`; `a'(1) + b'(1) = 5`; `‖ξ‖² = 2 > 1`; `φ(f) = 1/2`, `ω_ξ(f) = 2|w₁|²`; `φ(xe₁₁) = x₁₁/2 = ⟪e₁/2, xe₁⟫` | retain |
| V4.Normality Radon–Nikodym `:1118` (r22) | `M = ℂ`, `ψ = ½ω_ξ` | `ω_{sξ} = |s|² ω_ξ`, `s = 1/√2 ∈ [0, 1]` | retain |
| V4.0.Fields change of measure `:1166–1167` (r22) | `μ = 2λ`, `ν = λ` | `dμ/dν = 2`, `‖√2 f‖²_ν = ∫|f|² dμ`; `1/√2` halves norms | retain |
| V1.3 amplification step `:355–358` (r21) | `A = D` in `M₂`, `n = 2`; control `A = T` upper triangular | `p = diag(e₁₁, e₂₂) ∈ Ã'`; `T`: `p = e₁₁ ∉ T'` since `e₁₁e₁₂ ≠ e₁₂e₁₁` | retain |
| V1.1 `φ = Σ n⁻² ⟨e_n, · e_n⟩` `:265–289` (r20) | `P_η`; `e_m + m e_n` | `φ(P_η) = Σ n⁻² |⟨e_n, η⟩|²`, `‖φ‖ = π²/6`; ultrastrong seminorm of `e_m + m e_n` below `ε` | retain |
| V1.2 `V = ker φ` `:333–340` (r20) | `1` | `φ(1) = π²/6 ≠ 0`, `1 ∉ V`, `1` in the weak closure | retain |
| V1.3 nonunital `ℂe₁₁` `:385–386` (r20) | `W = ⋂ ker a` | `W = ℂe₂`, bicommutant = diagonals `∋ 1 ≠ e₁₁` | retain |
| V2.1 Checks `:466–475` (r20) | `diag(1/2, 0)`; `e₁₁ + ie₂₂`; `u = −1` | `(a/‖a‖)^(1/n) = diag(1, 0)`; `(u + u*)/2 = e₁₁`; `h = π`, `σ(h) = {π}` | retain |
| V2.4 Checks `:610–621` (r20) | `M₂ ⊗̄ M₂`; slice `e₁₂` | `16 = 4·4`; `R(x ⊗ e₁₂) = x`; `⟨e₂, e₁⟩x = 0`; `M₂ ⊗̄ 0 = 0` | retain |
| V2.5 classification `:737–741` (r20) | `(δ₀ + λ)/2`; `μ = 0` | atom mass `1/2`, `L∞[0,1] ⊕ ℂ`; `μ = 0` gives `0/0`, so `μ(X) > 0` is needed and stated | retain |
| V3.2 entry formula vs Jones 875–877 (r20) | Example 4.4.4 | `tr(p₁e₁) = 2`, `tr(p₂e₁) = 1` | retain |
| V4.0.Fields Checks `:1157–1172` (r20) | `λ|_{[0,1/2]}`; constant fibre | fibre zero on `(1/2, 1]`; decomposables `= L∞ = (L∞)'` | retain |

33 rows, 2 computed this round on the changed statements; none leads to a mathematical finding. The previous Check for the positive clause (`1 − e₀` as the limit of `P_n − e₀`) was replaced by the `q` Check, which is discriminating where the old one was not: `1 − e₀ ∈ A` already, whereas `q ∉ A` and `dist(q, A) ≥ 1/2`, so the new Check separates the strong-density clause from a norm-density misreading.

**Library and suppliers.** The changed passage adds no library or supplier citation beyond those the previous review resolved: Mathlib `cfc` (`Analysis/CStarAlgebra/ContinuousFunctionalCalculus/…` at the pin, as in `README.md:116`) for `√x`, and V1.1–V1.3 of this roadmap. The 15-target sample, the Mathlib declarations (file and line) and the main-branch supplier sections listed in the previous report were not re-read, as the diff does not touch them.

**Declared gaps.** None declared (no readable `design/plan.json`), and `## Exact supplier contracts` states no `gap:` contract.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`README.md:1138`, `:1223–1225`): no legal full text is reachable; cited by locator, as the README does. Not touched by the diff.
- Ownership against open pull requests was checked on the index of 2026-11-06T11:02:12Z (462 pull requests, `roadmaps list` shows #1041 as the only open pull request carrying `VonNeumannAlgebras`); pull requests outside that index were not searched.

## Source issues

- none new in the lines checked this round (houdayer line 784–800, jones-vna line 551–554 and 957–1012, peterson-notes line 991–995 and 1128–1152). The three items of the previous report (jones-vna Corollary 5.1.4 proof weight, Lemma 7.1.4 proof vector functional, the inclusion-matrix definition after Theorem 4.4.2) stand and are already in the register.
