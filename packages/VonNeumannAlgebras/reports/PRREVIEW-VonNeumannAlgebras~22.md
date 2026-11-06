# Review of VonNeumannAlgebras (pull request #1041 at 32452f4)

**Verdict:** rejected

Full review of the folder at 32452f4, the same head the previous review read (the change set is empty: 0 changed lines, nothing outside the folder). The single defect no edit inside the folder can repair, that the folder re-plans the roadmap that is on main, is written again as R01. One new P3 on a locator is R02. Everything else checked out, and the record is under `## Verified sound`.

## R01 (P1) — The folder re-plans a roadmap that is on main

**Location:** the whole folder: `TauCetiRoadmap/VonNeumannAlgebras/README.md:1` ("# Roadmap: von Neumann algebras: operator foundations and measurable fields") and `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:43` (`namespace TauCetiRoadmap.VonNeumannAlgebras`).

**Claim:** `TauCetiRoadmap/VonNeumannAlgebras` on main (read at ffac5139) is the folder added by commit f8dfe0ad, "Von Neumann algebras, factors and modular theory": a 4337-line README with `## Layer 0` to `## Layer 13` (`:275`, `:392`, `:523`, `:905`, `:970`, `:1339`, …, `:3688`) and a 215-line `Suggested.lean` with 17 declarations in this namespace. This head's folder is a 1214-line README of five layers under other section names (`## V0.` … `## V4.`) and a 135-line `Suggested.lean` with 11 declarations, every one of which states an object main already states under another name: `exists_faithful_representation` for main's `exists_injective_nondegenerate_representation_lp` (main `Suggested.lean:71`), `bicommutant_eq_iff_isClosed_wot` for `double_commutant_iff_isClosed_image_ofCLM` (`:82`), `kaplansky_closure_unitBall` for `closure_unitBall_eq_unitBall_double_centralizer` (`:91`), `IsCyclicVector`/`IsSeparatingVector` for `IsCyclic`/`IsSeparating` (`:110`, `:114`), `MurrayVonNeumannEquiv`/`MurrayVonNeumannSubequiv`/`murrayVonNeumannEquiv_of_subequiv` for `ProjectionEquivalent`/`ProjectionSubequivalent`/`equivalent_of_subequivalent` (`:127`, `:133`, `:139`). Merged, it would replace main's roadmap by a smaller, differently named snapshot of its first five layers, delete Layers 5–13 and the sections `V4.0.Decomposition`, `V4.0.Multiplication`, `V2.BorelCalculus` and the rest, and break every consumer on main that cites them. The principle "a Tau Ceti roadmap is existing work: it is built on, never re-planned" applies to this folder itself; the pull request's own description says the programme "is retained and corrected in the full single-owner" roadmap and calls this branch "its historical staged snapshot".

**Witness:** `git log -1 origin/main -- TauCetiRoadmap/VonNeumannAlgebras` → `f8dfe0ad`; `git merge-tree --write-tree origin/main HEAD` → `CONFLICT (add/add)` on `README.md` and on `Suggested.lean`; on main outside the folder, 73 citations of `VonNeumannAlgebras V5`–`V13` or `V4.0.Decomposition` (for example `OperatorTheory/SelfAdjointSpectralTheory/README.md:1406` "VonNeumannAlgebras V4.0.Decomposition"), each resolving on main and none in this folder.

Re-raised: H01 of the repair reports (rounds 13–19), which answered the two-owner finding with "nothing in this folder can change the other pull request". That reason fails because the second owner is no longer an open pull request but main itself, and this head still conflicts with it on both files.

**Repair:** close this pull request. Whatever this folder states that main's Layers 0–4 do not (the V3.2 zero-corner clause with its identity-inclusion Check at `README.md:834–838`, the V2.5 weights `3⁻ⁿ` with the `2⁻ⁿ` negative control at `:636–642` and `:705–708`, the V1.2 negative control for a unit-ball criterion at `:333–340`, the Jones 4.4.2 attribution at `:810–813`, the V1.3 locator "Lemma 2.5.5 and the proof of Theorem 2.5.6" at `:357–358`) is submitted as a revision of main's folder, written as a diff against main that keeps main's headings, section names and declaration names. Control: `git merge-tree origin/main <head>` reports no conflict, and every citation of `VonNeumannAlgebras V5`–`V13` and `V4.0.Decomposition` on main still resolves.

## R02 (P3) — Kaplansky density: the positive-part clause has no locator

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:395–399`: "the self-adjoint part of the unit ball of `A` is strongly dense in the self-adjoint part of the unit ball of `M`, and likewise for the positive parts (Houdayer, Theorem 3.16, p. 17; Peterson, Theorem 2.6.4, p. 31; Jones, Theorem 5.2.1, pp. 32–33)".

**Claim:** none of the three cited statements contains the positive-part clause. Houdayer Theorem 3.16 (houdayer line 784–787) states the unit-ball and self-adjoint clauses only; Peterson Theorem 2.6.4 (peterson-notes line 1128–1131) states (i) the self-adjoint part and (ii) the unit ball; Jones Theorem 5.2.1 (jones-vna line 957–960) states the unit ball and its self-adjoint part, and the word "positive" does not occur in its proof (lines 961–1007). The clause is true, and the README's own route at `:400–403` derives it ("the positive case by `x ↦ x*x` applied to self-adjoint approximants of `√x`", which is sound: `y_α` self-adjoint contractions of `A` with `y_α → √x` strongly give `y_α² ≥ 0`, `‖y_α²‖ ≤ 1`, `y_α² → x` strongly by joint strong continuity of the product on bounded sets, V1.1); but as written the parenthetical attributes all three clauses to the sources.

**Witness:** houdayer line 786–787 (two bullet clauses), peterson-notes line 1130–1131 ((i) and (ii)), jones-vna line 957–960.

**Repair:** move the locators to the two clauses they support and say that the positive clause is derived: "… in the self-adjoint part of the unit ball of `M` (Houdayer, Theorem 3.16, p. 17; Peterson, Theorem 2.6.4, p. 31; Jones, Theorem 5.2.1, pp. 32–33), and likewise for the positive parts, by the route below." Tested: the three locators then say exactly what they are cited for, and the positive clause keeps its stated route and its Check at `:419–420` (`1 − e₀` as the strong limit of `P_n − e₀`).

## Previous findings

Review of this pull request at 32452f4 (round 21):

- R01 — not repaired: the folder is byte-identical to the head that review read (`git diff` of the folder between the two heads is empty); main still carries the folder from f8dfe0ad and `git merge-tree` still conflicts on both files. Written again as R01 above.

## Verified sound

**Gate.** My run at 32452f4 against `origin/main`: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The gate diffs against the merge base and so does not see R01.

**Dependency check** (verbatim):

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists VonNeumannAlgebras at line 5. The worker's citation resolver reports no cross-roadmap citation and no Lean name found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0, exactly seven `declaration uses sorry` warnings (`:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`), no other warning. Imports: the single `import Mathlib`; no `set_option`, no sorry'd data, `theorem` throughout. One-tactic probe on a scratch copy with each `sorry` replaced by `first | simp | rfl | aesop | decide | infer_instance`: all seven fail (errors at the seven proof sites; `aesop` reports exhaustive search failed on `:62` and `:131`), so nothing in the file is padding. A `#check @name` for all eleven declarations in the same scratch file elaborates and agrees with the worker's `signatures.md`: `exists_faithful_representation` and `exists_vonNeumannAlgebra_starAlgEquiv` take `(A : Type u) [CStarAlgebra A]` (the second also `[WStarAlgebra M]`); every other declaration carries `{H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`; no section binder is lost, and each type matches its README statement (V0.2 `:218`, V1.3 `:352`, V1.4 `:400`, V2.2 `:491–499`, V4.Core `:910`, `:917`, V4.Normality `:1093–1095`).

**Mathlib at the pin** (file and line in `.lake/packages/mathlib/Mathlib`): `WStarAlgebra` with field `exists_predual` (`Analysis/VonNeumannAlgebra/Basic.lean:45–48`), `VonNeumannAlgebra` with `centralizer_centralizer'` (`:67–70`) and `commutant` (`:123`); `ContinuousLinearMapWOT.instLocallyConvexSpace` (`Analysis/LocallyConvex/WeakOperatorTopology.lean:416`), `ContinuousLinearMap.WOTofCLM` (`:438`); `ContinuousLinearMap.toPointwiseConvergenceCLM` (`Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:155`), the theorem `UniformConvergenceCLM.continuousSMul` (`…/UniformConvergenceCLM.lean:256`); `PositiveLinearMap.GNS` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:147`, the completion of `PreGNS`), `gnsNonUnitalStarAlgHom` (`:196`), `gnsStarAlgHom` (`:246`); `PositiveContinuousLinearMap.norm_map_sq_le_opNorm_mul` (`Analysis/CStarAlgebra/PositiveLinearFunctional.lean:40`), `ofReal_opNorm_eq_map_one` (`:74`), `PositiveLinearMap.cauchy_schwarz_star_mul` (same file); `CStarAlgebra.increasingApproximateUnit` (`Analysis/CStarAlgebra/ApproximateUnit.lean:319`); `CStarAlgebra.span_unitary` (`Analysis/CStarAlgebra/Unitary/Span.lean:106`); `StarSubalgebra.cstarAlgebra` needing `[IsClosed (s : Set A)]` (`Analysis/CStarAlgebra/Classes.lean:50–52`, as the README's supplier contract says); the inner product on `TensorProduct` (`Analysis/InnerProductSpace/TensorProduct.lean:145`, `norm_tmul :147`), `commIsometry` (`:347`), `assocIsometry` (`:437`), `mapL` (`:602`); `LinearMap.dualEmbedding_surjective` (`Analysis/LocallyConvex/WeakDual.lean:184`), `rightDualEquiv` (`:193`); `ContinuousLinearMap.instLoewnerPartialOrder` (`Analysis/InnerProductSpace/Positive.lean`). Tau Ceti at the pin has no declaration mentioning `VonNeumannAlgebra` or `WStarAlgebra`, so no duplication there.

**Suppliers on main** (content checkout at ffac5139): PolarDecomposition PD-B22, PD-B24, PD-B29 (`OperatorTheory/PolarDecomposition/README.md:361`, `:373`, `:384`); SelfAdjointSpectralTheory SA-B05 (`…/SelfAdjointSpectralTheory/README.md:29`), SA-B10–B13 (`:30–31`), SA-B30 (`:35`), SA-B46 (`:42`), SA-B49 (`:43`), SA-B53 (`:44`), SA-B84 (`:66`), SA-B85 (`:67`, which at `:255` and `:690` consumes VonNeumannAlgebras V4.0.Fields, the direction the README states), SA-B86 (`:75`); OperatorIdeals OI-B29 (`…/OperatorIdeals/README.md:349`), OI-B31 (`:353`), OI-B32 (`:355`), OI-B41 (`:375`); OrthogonalGeometry (`OperatorTheory/OrthogonalGeometry/`); BanachSpaceTheory `## B1` (`BanachSpaceTheory/README.md:54`), `## B2` (`:135`), `## B4` (`:239`); RepresentationTheory/SemisimpleAlgebras `### Layer 3: the double-centralizer (density) theorem` (`:233`). All five consumers named under `## Downstream consumers` exist on main. The ownership search for the folder's objects finds them on main (R01); `roadmaps list` (460 open pull requests, index of 2026-11-06T07:40:45Z) shows #1041 as the only open pull request carrying `VonNeumannAlgebras`.

**Sources: the sample.** Read at the cached texts (Houdayer `21d589d7…`, Peterson `5a30c5db…`, Jones 2009 `69b08503…`; pdf page = printed page in all three). 15 targets, none found by heading:

1. Peterson Prop 4.1.4–4.1.5, p. 56 (peterson-notes line 2185–2203): a state with `φ(x) = λ` for `λ ∈ σ(x)`, and states separate points; the README's `f(a) = ‖a‖` for `a ≥ 0` nonzero is 4.1.4 at `λ = ‖a‖ ∈ σ(a)`. Supports V0.2 `:208–211`.
2. Peterson Cor 4.1.7, p. 58 (line 2248–2251) and Houdayer Cor 1.28, p. 6 (houdayer line 232–235): faithful representation as the direct sum of GNS representations over states. Supports `:211–215`.
3. Jones Cor 5.1.4, p. 32 (jones-vna line 945–950): the functional with weights `1/n²` over an orthonormal basis is ultraweakly continuous and not weakly continuous. Supports V1.1 `:264–267`.
4. Houdayer Prop 2.8, pp. 8–9 (line 331–344): `V` ultraweakly closed, five equivalent conditions (ℓ²-pairings, ultrastrong, ultraweak, strong on the ball, weak on the ball). Supports V1.2 `:307–310` and V4.Core `:970–972`.
5. Houdayer Thm 2.4, pp. 7–8 (line 284–288): the unit ball of `B(H)` is weakly compact. Supports `:323–324`.
6. Jones Thm 3.2.1, p. 12 (line 237–238): self-adjoint subalgebra containing `1`, `dim H = n < ∞`, `M = M''`. Supports V1.3 `:353–354`.
7. Houdayer Thm 3.16, p. 17; Peterson Thm 2.6.4, p. 31; Jones Thm 5.2.1, pp. 32–33: the unit-ball and self-adjoint clauses, hypotheses "unital star subalgebra" (Houdayer), "self-adjoint subalgebra" (Peterson, Jones with EP6 reduction). The positive clause: R02.
8. Jones Cor 5.2.2, p. 33 (line 1008–1012): star subalgebra containing `1` is a von Neumann algebra iff its unit ball is weakly compact. Supports V1.4 `:405–409`.
9. Peterson Thm 2.7.4, pp. 33–34 (line 1246–1259): the Borel calculus of a spectral measure is a star homomorphism whose image lies in the von Neumann algebra generated by the image of `C(K)`, with monotone SOT convergence. Supports V2.1 `:449–450` (`f(a) ∈ W*(a)`).
10. Peterson Prop 3.1.7, p. 43 (line 1641–1646): Kaplansky's formula `p ∨ q − p ∼ q − p ∧ q` in a von Neumann algebra via `(1 − p)q`. Supports V2.2 `:496–498`.
11. Jones Thm 6.1.12, pp. 37–38 (line 1118–1126): an ultraweakly closed left ideal is `Me` for a unique projection, central when two-sided. Supports `:503–506`.
12. Jones Cor 3.4.4 and 3.4.5, p. 22 (line 657–667): corners of factors are factors, `x ↦ xp` a weakly continuous star isomorphism `M' → M'p`, and `ab = 0` forces `a = 0` or `b = 0` in a factor. Supports V2.3 `:537–541`.
13. Peterson Thm 2.8.9, pp. 38–39 (line 1531–1540): separable (= separable predual, p. 36) abelian algebras are `ℓ∞(K)` or `L∞([0,1], λ) ⊕ ℓ∞(K)`, `K` countable possibly empty, defined as the atoms of `σ(x)`. Supports V2.5 `:724–730`; the README's "separable `H`" implies Peterson's hypothesis through V4.Core's separability of the predual.
14. Jones Thm 4.4.1, p. 28 (line 840–845): finite-dimensional algebra on any `H`, unitary `⊕ ℓ²(X_i, K_i) → H` with `u*Mu = ⊕ B(ℓ²(X_i)) ⊗ 1`. Supports V3.2 `:802–805` word for word.
15. Peterson Thm 4.4.6 (Sakai), p. 66 (line 2579–2584): a C*-algebra with a Banach space `X` and `X* ≅ A` is isomorphic to a von Neumann algebra, via the direct sum of GNS representations of the states in `X`. Supports V4.Core `:914–917` and `exists_vonNeumannAlgebra_starAlgEquiv`.

Also read: Peterson Prop 2.8.1, p. 36 (line 1426–1430, nonzero `ξ`; the README drops the hypothesis and the table below checks `ξ = 0` in both directions); Jones Lemma 7.1.4, p. 44 (line 1347–1355, `s ∈ A'` with `ψ = ω_{sξ}`; `0 ≤ s ≤ 1` follows from `0 ≤ t ≤ 1` on `closure(Aξ)`, which `ψ ≤ ω_ξ` gives); Houdayer Thm 3.13, p. 16 (line 688–700); Peterson Prop 4.5.2, p. 67 (line 2620–2624); Jones Thm 4.4.2 and the definition of `Λ`, pp. 28–29 (line 856–859, 868–874).

**Computed adversarial pass.** Rows marked (this round) were recomputed on this head; the remaining rows of the previous review's 32-row table (round 20, same file contents) were re-read and their values stand, and are listed with the values that review computed.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_representation` `:52` (this round) | zero algebra; `ℂ²`, `a = (1, 0)` | zero: `K = 0`, `π = 0` injective on one element; `ℂ²`: state `(z, w) ↦ z` has `f(a*a) = 1 ≠ 0`, so `π_f(a) ≠ 0` | retain |
| `bicommutant_eq_iff_isClosed_wot` `:62` (this round) | `ℂ·1` on `ℂ²`; finite rank `+ ℂ·1` on `ℓ²` | `ℂ·1`: `A'' = A`, image closed (finite dimension), both true; finite rank: `A'' = B(H) ≠ A`, `P_n S P_n → S ∉ A` weakly, both false; `StarSubalgebra` is unital, matching "unital star subalgebra" | retain |
| `kaplansky_closure_unitBall` `:71` (this round) | finite rank `+ ℂ·1`; upper triangular in `M₂` | `‖P_n S P_n‖ ≤ 1 = ‖S‖`, strong limit `S`; strong limits of contractions are contractions (`⊆`); upper triangular: `A'' = M₂`, `dist(e₂₁, A) = 1`, false without the star hypothesis, which `StarSubalgebra` carries | retain |
| `MurrayVonNeumannEquiv` orientation `:82` (this round) | `v = e₂₁` in `M₂` | `v*v = e₁₂e₂₁ = e₁₁ = p`, `vv* = e₂₁e₁₂ = e₂₂ = q`: initial projection first, as README `:519–520`; the swapped model is excluded by that Check | retain |
| `MurrayVonNeumannSubequiv`, `murrayVonNeumannEquiv_of_subequiv` `:88–94` (this round) | `B(ℓ²)`, `p = 1`, `q = 1 − e₀`; `p = q = 0` | `S*S = 1`, `SS* = 1 − e₀ ≤ q`: `1 ≼ 1 − e₀`; `v = 1 − e₀`: `1 − e₀ ≼ 1`; `1 ∼ 1 − e₀` by `S`, `1 ≠ 1 − e₀`; `p = q = 0`: `v = 0` | retain |
| `exists_predual` `:106` (this round) | `H = 0`; `N = ℂ` on `ℂ` | `H = 0`: `X = 0`, `StrongDual ℂ 0 = 0 ≃ N = 0`; `N = ℂ`: `X = ℂ`, `L ↦ conj(L(1))` conjugate-linear isometric as `≃ₗᵢ⋆` requires; `X : Type u` matches `WStarAlgebra` | retain |
| `exists_vonNeumannAlgebra_starAlgEquiv` `:114` (this round) | zero algebra; Peterson's `X* ≅ A` | zero: `K = 0`, `N = ⊤` on `0`, `M ≃⋆ₐ N` between one-element algebras; conjugating scalars on `X` turns the conjugate-linear isometry into a linear one, Peterson 4.4.6 applies | retain |
| `IsCyclicVector`, `IsSeparatingVector`, the iff `:121–131` (this round) | `M₂`, `e₁`; `D`, `e₁`; `ξ = 0` with `H ≠ 0`; `H = 0` | `M₂e₁ = ℂ²` dense, `M' = ℂ·1`, `x e₁ = 0 ⟹ x = 0`: both true; `De₁ = ℂe₁` not dense, `e₂₂ ∈ D' = D`, `e₂₂e₁ = 0`, `e₂₂ ≠ 0`: both false; `ξ = 0`: orbit `{0}` not dense, `1 ∈ M'` kills `0` with `1 ≠ 0`: both false; `H = 0`: both true. Peterson's nonzero hypothesis is not needed | retain |
| V0.1 Checks `:233–241` (this round) | `ℂ²`, `(z, w) ↦ (z − w)/2`; `z − w` | `sup |z − w|/2 = 1` at `(1, −1)`; value `−1/2` at `(0, 1)`, not positive; `z − w` has norm `2` | retain |
| V1.1 `T_n` Check `:284–287` (this round) | `T_n e₀ = n^(−1/2) Σ_{k ≤ n} e_k` | `‖T_n e₀‖² = n · n⁻¹ = 1`; `|n^(−1/2) Σ_{k ≤ n} ⟪η, e_k⟫| ≤ C_N n^(−1/2) + (Σ_{k > N} |η_k|²)^(1/2) → 0` by splitting at `N` | retain |
| V1.2 convex-hull Check `:327–330` (this round) | `(1/N) Σ_{n ≤ N} Sⁿ e₀` | `= (1/N) Σ_{n ≤ N} e_n`, norm² `N/N² = 1/N` | retain |
| V1.3 `{e₁₂}` Check `:382–384` (this round) | `x = [[a, b], [c, d]]` | `xe₁₂ = [[0, a], [0, c]]`, `e₁₂x = [[c, d], [0, 0]]` ⟹ `c = 0`, `a = d`; `{e₁₂}'' = span{1, e₁₂}`; `{e₁₂, e₂₁}'' = M₂` | retain |
| V2.2 `(pq)ⁿ` Check `:515–518` (this round) | lines `ℂu`, `ℂv`, `cos θ = |⟪u, v⟫| < 1` | `pq = ⟪u, v⟫ u ⊗ v*`, `(pq)² = |⟪u, v⟫|² pq`, `(pq)ⁿ = |⟪u, v⟫|^(2n−2) pq`, norm `(cos θ)^(2n−1) → 0`, `p ∧ q = 0`; Kaplansky: `1 − p ∼ q`, both rank one | retain |
| V2.3 Checks `:553–565` (this round) | `M₂ ⊕ ℂ`, `p = e₁₁`; `V = span{e₁₁, e₃₃}`, `W = span{e₁₁ + e₂₂, e₃₃}` | `Mpℂ³ = span{e₁, e₂}`, `c(p) = e₁₁ + e₂₂`; `e₃₃ ∈ M'`, `e₃₃p = 0 = e₃₃c(p)`; products `e₁₁, 0, 0, e₃₃`: `dim VW = 2 < 4` | retain |
| V2.5 weights and Checks `:636–642`, `:699–711` (this round) | `3⁻ⁿ`; `2⁻ⁿ`; `e₀ = 1_{[0,1/2]}`, `e₁ = 1`; two atoms; `a = e₁₁` | `Σ_{k > n} 3⁻ᵏ = 3⁻ⁿ/2 < 3⁻ⁿ`; `Σ_{k > n} 2⁻ᵏ = 2⁻ⁿ`; `a = 4/3` on `[0, 1/2]`, `1/3` on `(1/2, 1]`; `Σ_{n ≥ 1} 3⁻ⁿ = 1/2`, `a = 1_A + ½1_B`; `2⁻ⁿ`: `a = 1`; `‖e₂₂‖ = 1 = ess sup_μ 1_{{0}}`, `ess sup_{δ₁} = 0` | retain |
| V3.1 Check `:794–795` (this round) | `M₂ ⊗ 1` on `ℂ² ⊗ ℂ³` | `e₁₁ ⊗ 1` has rank `3`; commutant `1 ⊗ M₃` | retain |
| V3.2 Checks `:830–839` (this round) | `M₂ ⊕ ℂ ⊆ M₅ ⊕ M₃`; identity on `ℂ ⊕ ℂ`; `ℂ ⊆ M₂ ⊆ M₄` | `Λ = [[2, 1], [1, 1]]`, `5 = 2·2 + 1·1`, `3 = 1·2 + 1·1`; `p₁q₂ = 0`, `Λ = I`, `Λ² = Λ`; `[2][2] = [4]` | retain |
| V3.3 Checks `:868–873` (this round) | `M₂`; `U` on `ℓ²(ℤ)` | `τ(e₁₂) = τ(e₁₂e₁₁) = 0`, `τ(e₁₁) = τ(e₂₂)`; `(2 − U)⁻¹ = ½(1 − U/2)⁻¹ = Σ 2^(−n−1) Uⁿ`, `‖U/2‖ = 1/2` | retain |
| V4.Core Checks `:977–991` (this round) | `diag(1/n²)`; `diag(1/n)`; Banach limit | `‖h‖₁ = π²/6`; `Σ 1/n² < ∞ = Σ 1/n`: Hilbert–Schmidt, not trace class; `φ(e_n) = 0`, `φ(1) = 1` | retain |
| V4.PositivePredual Checks `:1061–1072` (this round) | `h = diag(2, −1)`; `φ = tr/2`, `ξ = √2 e₁` | `‖h‖₁ = 3 = 2 + 1`; `a' − b' = 2Tr(·e₁₁) − Tr(·e₂₂) = φ`, `a'(1) + b'(1) = 3 + 2 = 5`; `‖ξ‖² = 2 > 1`; `φ(f) = 1/2`, `ω_ξ(f) = 2|w₁|²`; `{e₂₂}` maximal (`e₁₁` has `|w₁|² = 1 > 1/4`); `φ(xe₁₁) = x₁₁/2 = ⟪e₁/2, xe₁⟫` | retain |
| V4.Normality Radon–Nikodym `:1118` (this round) | `M = ℂ`, `ψ = ½ω_ξ` | `ω_{sξ} = |s|² ω_ξ`, `s = 1/√2 ∈ [0, 1]` | retain |
| V4.0.Fields change of measure `:1166–1167` (this round) | `μ = 2λ`, `ν = λ` | `dμ/dν = 2`, `‖√2 f‖²_ν = 2∫|f|² dλ = ∫|f|² dμ`; `1/√2` halves norms | retain |
| V1.3 amplification step `:355–358` (r21) | `A = D` in `M₂`, `n = 2`; control `A = T` upper triangular | `p = diag(e₁₁, e₂₂) ∈ Ã'`; `x = e₁₁` preserves the closure; `T`: `p = e₁₁ ∉ T'` since `e₁₁e₁₂ ≠ e₁₂e₁₁` | retain |
| V1.1 `φ = Σ n⁻² ⟨e_n, · e_n⟩` `:265–289` (r20) | `P_η`; `e_m + m e_n` | `φ(P_η) = Σ n⁻² |⟨e_n, η⟩|²`, `‖φ‖ = π²/6`; ultrastrong seminorm of `e_m + m e_n` below `ε` | retain |
| V1.2 `V = ker φ` `:333–340` (r20) | `1` | `φ(1) = π²/6 ≠ 0`, `1 ∉ V`, `1` in the weak closure | retain |
| V1.3 nonunital `ℂe₁₁` `:385–386` (r20) | `W = ⋂ ker a` | `W = ℂe₂`, bicommutant in `B(ℂ²)` = diagonals `∋ 1 ≠ e₁₁` | retain |
| V2.1 Checks `:466–475` (r20) | `diag(1/2, 0)`; `e₁₁ + ie₂₂`; `u = −1` | `(a/‖a‖)^(1/n) = diag(1, 0)`; `(u + u*)/2 = e₁₁`; `h = π`, `σ(h) = {π}` | retain |
| V2.4 Checks `:610–621` (r20) | `M₂ ⊗̄ M₂`; slice `e₁₂` | `16 = 4·4`; `R(x ⊗ e₁₂) = x`; `⟨e₂, e₁⟩x = 0`; `M₂ ⊗̄ 0 = 0` | retain |
| V2.5 classification `:737–741` (r20) | `(δ₀ + λ)/2`; `μ = 0` | atom mass `1/2`, `L∞[0,1] ⊕ ℂ`; `μ = 0` gives `0/0`, so `μ(X) > 0` is needed and stated | retain |
| V3.2 entry formula vs Jones 875–877 (r20) | Example 4.4.4 | `tr(p₁e₁) = 2`, `tr(p₂e₁) = 1` | retain |
| V4.0.Fields Checks `:1157–1172` (r20) | `λ|_{[0,1/2]}`; constant fibre | fibre zero on `(1/2, 1]`; decomposables `= L∞ = (L∞)'` | retain |

31 rows, 22 recomputed this round; none leads to a mathematical finding.

**Declared gaps.** None declared (no readable `design/plan.json`), and the README's `## Exact supplier contracts` states no `gap:` contract; every supplier citation resolves on main as listed above.

## Not verifiable

- Dixmier, *Von Neumann algebras*, Part II, Chapters 1–2, and Takesaki, *Theory of Operator Algebras I*, Chapter IV §8 (`README.md:1127`, `:1212–1214`): no legal full text is reachable (North-Holland and Springer, not in the cache, no author-page or institutional copy); cited by locator, as the README does.
- Ownership against open pull requests was checked on the index of 2026-11-06T07:40:45Z (460 pull requests); pull requests outside that index were not searched.

## Source issues

- **Misprint** in jones-vna at Corollary 5.1.4, proof, printed page 32: the functional is written as a sum over `i` with weight `1/n²`; it should be the weight `1/i²` matching the summation index; affects nothing.
- **Misprint** in jones-vna at Lemma 7.1.4, proof, printed page 44: the concluding display names the vector functional of `ξ` where the one of `sξ` is meant; it should read `ω_{sξ}(a)`; affects nothing.
- **Gap** in jones-vna at the definition of the inclusion matrix `Λ` following Theorem 4.4.2, printed page 29: every corner `p_j q_i M q_i p_j` is taken to be a factor, although it is the zero algebra when `p_j q_i = 0`; it should set `λ_ij = 0` in that case; affects a stated result (the definition of `Λ`, which the README's zero-corner clause repairs).
