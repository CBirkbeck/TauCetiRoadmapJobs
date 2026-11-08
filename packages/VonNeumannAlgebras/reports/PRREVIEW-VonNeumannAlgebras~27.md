# Review of VonNeumannAlgebras (pull request #1041 at 2f112b6)

**Verdict:** needs changes

Incremental re-review of the 87 changed lines since dbb77c9 (66 insertions, 21 deletions, all in `README.md`; `Suggested.lean` is byte-identical to dbb77c9; nothing outside the folder). R01 and R02 of the previous report are repaired, and the repairs introduced no new problem: the operator form of Connes's Følner criterion now matches Anantharaman–Popa Theorem 10.2.9 clause by clause, the projection form is restricted to II₁ factors with Theorems 10.3.1 and 10.3.4 as its locators, the four new Checks compute correctly, and every Tau Ceti GNS name the Layer 0 text now lists exists at main's pin. R03 (the branch is not rebased on main) is unchanged and is the only finding.

## R01 (P3) — The branch is still not rebased on main

**Location:** the branch as a whole. Its `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`. `README.md:194–200`, `:310–315`, `:320–322`, `:365–367`, `:388–390` and `:423–427` cite `PositiveLinearMap.toGNS`, `PositiveLinearMap.denseRange_toGNS`, `PositiveLinearMap.gnsVector` and its lemmas in `TauCeti/Analysis/CStarAlgebra/GNS.lean`.

**Claim:** unchanged since the two previous reports. The merge base is `350e970c`, which predates the merge of the roadmap to main, so git sees the branch as adding both files that main already has, and the pull request cannot merge as it stands. The branch's own Tau Ceti pin has none of the GNS declarations the README cites (its `TauCeti/Analysis/CStarAlgebra/` holds only `CharacterSpaceMeasure.lean` and `UnitaryCharacter.lean`); they exist only at main's pin, where the citations were checked.

**Witness:** at 2f112b6, `git merge-tree --write-tree origin/main HEAD` reports `CONFLICT (add/add)` on `TauCetiRoadmap/VonNeumannAlgebras/README.md` and `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`, listing each at stages 2 and 3. `git diff --stat origin/main HEAD -- TauCetiRoadmap/VonNeumannAlgebras` is `229 insertions, 47 deletions`.

**Repair:** rebase onto main, resolving both files to this head's content, so that the branch carries main's `lake-manifest.json` and `git diff origin/main HEAD -- TauCetiRoadmap/VonNeumannAlgebras` is the whole pull request. Control: `git merge-tree --write-tree origin/main <new head>` prints only a tree id, and `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested` passes at main's pins (the fourteen sorried declarations use only Mathlib carriers, so nothing in the Lean file depends on the pin bump).

## Previous findings

- R01 — repaired: `README.md:3964–3977` "prove Connes's Følner criterion in operator form: … a positive finite-rank operator T on L²M with `‖T‖_(2,Tr)=1`, `‖uT−Tu‖_(2,Tr)≤ε` for u∈F and `|Tr(xT²)−τ(x)|≤ε‖x‖` … For an injective II₁ factor prove the finite-rank projection form … a condition with no trace clause". The ℂ² witness is now the first Check at `:3996–4001`.
- R02 — repaired: `:365` "dense classes [a] (`PositiveLinearMap.denseRange_toGNS`)"; `:388–390` *Needs:* "Tau Ceti `PositiveLinearMap.toGNS`, `PositiveLinearMap.denseRange_toGNS`, `PositiveLinearMap.gnsVector` and `PositiveLinearMap.denseRange_gnsStarAlgHom_gnsVector`"; the contract at `:194–197` and the Layer 0 Dependencies bullet at `:423–427` list them.
- R03 — not repaired: `git merge-tree --write-tree origin/main HEAD` still reports add/add conflicts on both files; the Lake pin is still `a91d3aaf`/`6b7abb3c` (R01 above).

## Verified sound

**Gate.** My run at 2f112b6: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (verbatim):

```text
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations: `roadmaps resolve` finds no cross-roadmap citation and no Lean name missing. Overlaps: no other open pull request changes this roadmap; no id this README cites is dropped by an open pull request; no id is defined only by an open revision; main's folder is unchanged since f8dfe0ad. No gaps are declared. `roadmaps list` shows #1041 as a revision of the roadmap on main, not a new folder.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly fourteen `declaration uses sorry` warnings (`:76`, `:87`, `:98`, `:107`, `:118`, `:130`, `:139`, `:154`, `:174`, `:203`, `:211`, `:218`, `:227`, `:241`) and nothing else, as at dbb77c9. The file is byte-identical to dbb77c9 (`git diff dbb77c9 HEAD -- Suggested.lean` is empty), so the `#check` comparison of the 22 declarations and the one-tactic probes of the previous two reports carry over unchanged; the worker's `signatures.md` agrees with them. Its 23rd entry, "`are` (theorem, line 32)", is the word "theorem" at the start of docstring line 32 ("theorem are statable through `WStarAlgebra`'s conjugate-linear predual"), not a declaration: a false positive of the signature scanner, not a defect of the file.

**Library objects opened** at main's Tau Ceti pin `2fd255d9`, `TauCeti/Analysis/CStarAlgebra/GNS.lean` (under `[NonUnitalCStarAlgebra A] [PartialOrder A] [StarOrderedRing A]` at `:38`, unital section under `[CStarAlgebra B] …` at `:68`):
- `PositiveLinearMap.toGNS : A →L[ℂ] f.GNS` (`:54`): the continuous linear class map, as `README.md:195–196` says.
- `PositiveLinearMap.denseRange_toGNS : DenseRange f.toGNS` (`:62`).
- `gnsVector` (`:72`), `inner_gnsStarAlgHom_gnsVector` (`:86`), `inner_gnsVector_coe` (`:94`), `denseRange_gnsStarAlgHom_gnsVector` (`:99`), `norm_gnsVector` (`:110`, hypothesis `f 1 = 1`).

All seven names of the contract at `:194–200`, the *Needs:* lines at `:326–331` and `:388–390` and the Dependencies bullet at `:423–427` resolve; none exists at the branch's own pin (R01).

**Sources: the diff's locators**, checked at the page markers of anantharaman-popa (printed page = pdf page − 6):
- Hypertrace (§10.2.2, line 7262, p. 162): a state ψ on B(L²M) with ψ(xT) = ψ(Tx) for x ∈ M, T ∈ B(L²M), and ψ|M = τ; the note at 7264 that ψ|M = τ is automatic for a II₁ factor. This is the parenthesis at `README.md:3962–3963` verbatim in content.
- Definition 10.2.1 (7191, p. 161), Proposition 10.2.2 (7198, p. 161), Proposition 10.2.5 (7269, p. 163; amenable ⟺ hypertrace, direction ⇒ by τ∘E at 7271), Theorem 10.2.8 (7325, p. 164): as in the previous report.
- Theorem 10.2.9 (7333, p. 164): for a tracial von Neumann algebra, amenable ⟺ (2): for every ε > 0 and finite set F of unitaries a positive finite-rank T with ‖T‖_{2,Tr} = 1, max_{u∈F} ‖uT − Tu‖_{2,Tr} ≤ ε (10.1) and sup_{‖x‖≤1} |Tr(xT²) − τ(x)| ≤ ε (10.2). The README's `|Tr(xT²)−τ(x)|≤ε‖x‖ for every x∈M` is (10.2) by homogeneity. Anantharaman–Popa's "tracial von Neumann algebra" (line 315) is a von Neumann algebra with a faithful normal tracial state and carries no separability assumption, so the README's "injective finite von Neumann algebra M with a faithful normal tracial state τ" is the source's generality; the proof (7355–7398) uses a hypertrace, Day's convexity argument and Powers–Størmer, none of which needs a separable predual.
- The remark at 7405–7406 (p. 166): (10.2) is unnecessary for II₁ factors because a hypertrace restricts to the unique tracial state. This is the last sentence of the third Check at `:4008–4010`.
- Theorem 10.3.1 (7413, p. 166): a II₁ factor is amenable iff for every ε > 0 and finite F there is a finite-rank projection P with max_{u∈F} ‖uPu* − P‖_{2,Tr} < ε‖P‖_{2,Tr}; the proof (7419–7433) takes P = E^c_t(T), a spectral projection of the T of Theorem 10.2.9, by Connes's trick. The README's "nonzero" is implied by the strict inequality. Theorem 10.3.4 (Connes' trick, 7532, after the page-174 marker at 7500, printed p. 168) gives, for positive finite-rank x₁,…,xₙ with ‖xᵢ − x₁‖_{2,Tr} < ε‖x₁‖_{2,Tr}, a t₀ with ‖E^c_{t₀}(xᵢ) − E^c_{t₀}(x₁)‖_{2,Tr} < (3nε)^{1/2}‖E^c_{t₀}(x₁)‖_{2,Tr}. Both locators at `:3977` are right.
- Peterson Theorem 6.3.8 (4146, p. 103): unchanged.

**Sources: the seeded sample 13.1 and 13.2.** 13.1 is untouched by the diff; its locators (Hiai 6.5; Peterson 6.2.1, 6.2.2, 6.3.6) are carried from the round-25 report. In 13.2 the diff rewrites the finite-case paragraph and adds the Checks block; its locators are the ones listed above. The remaining locators of 13.2 (Anantharaman–Popa §§11.1, 11.2, 12.5; Connes–Feldman–Weiss Definitions 5–6, Proposition 7, Lemmas 8–9, Theorem 10; Haagerup 2016 and 1989) are unchanged and carried from round 25.

**Adversarial pass.** Rows for the changed statements were computed this round. Rows for statements the diff leaves untouched are carried from the previous reports (PRREVIEW-VonNeumannAlgebras~26 for the Layer 0 headline and routes, ~25 for everything else).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Hypertrace definition `:3961–3963` | `M = ℂ²`, `τ = (1/3, 2/3)` on `L²M = ℂ²`; `M = M₂ ⊆ B(ℂ²)`, `τ = tr/2` | `ψ(T) = Tr(DT)`, `D = diag(1/3, 2/3)` in the orthonormal basis: `ψ(xT) = Tr(DxT) = Tr(xDT) = ψ(Tx)` since `D` and `x` are diagonal; `ψ(x) = a/3 + 2b/3 = τ(x)`. `M₂`: `ψ = tr/2` is central and restricts to `τ` | holds |
| Operator-form Følner criterion `:3964–3969` | `ℂ²` as above, `u = (1,−1)`, `F = {u}`, every ε; `M₂(ℂ)`, `τ = tr/2`, `F` = all unitaries | `ℂ²`: `T = diag(3^(−1/2), (2/3)^(1/2))`, `Tr(T²) = 1/3 + 2/3 = 1`, `[u,T] = 0`, `Tr(xT²) = a/3 + 2b/3 = τ(x)`, so the bound holds with 0. `M₂`: `L²M` has dimension 4, `T = ½·1`, `Tr(T²) = 4/4 = 1`, commutes with everything, `Tr(xT²) = ¼·Tr(L_x) = ¼·2·tr(x) = τ(x)` | holds |
| "T is not in general a normalized projection" `:3972–3973` | `ℂ²`, `ε = 1/10` | the first Check's values below: no projection meets both clauses | holds |
| Projection form for II₁ factors `:3973–3977` | `R = ⊗M₂`, `F ⊆ M_{2^k}(ℂ) ⊆ R`; negative controls `ℂ²` (not a factor), `L(F₂)` (not injective) | `R`: `P` = projection of `L²R` onto `L²(M_{2^k})`, rank `4^k`, invariant under left and right multiplication by `F`, so `‖uPu*−P‖₂ = 0 < ε·2^k = ε‖P‖₂`. `ℂ²`: the trace clause fails (Check 1). `L(F₂)`: no hypertrace (Check 4) | holds |
| Check 1 `:3996–4001` | rank-one `P` onto `(α,β)`, `p = |α|²`; `P = 1` | orthonormal basis: `‖δ₁‖² = τ(δ₁) = 1/3`, `‖δ₂‖² = 2/3`, so `√3δ₁`, `√(3/2)δ₂`. `‖uP−Pu‖₂² = 2 − 2(p−(1−p))² = 8p(1−p)` (numeric control at `(α,β) = (0.6, 0.8)`: `1.8432` both ways); `Tr(xP)/Tr(P) = p` (`0.36`). `8p(1−p) ≤ 1/100` ⟺ `p ≤ 0.0012516` or `p ≥ 0.9987484`, within the stated `0.0013`/`0.9987`. `P = 1`: ratio `1/2`. Distances from `1/3`: `≥ 0.332`, `≥ 0.665`, `1/6`, all `> 1/10` | holds |
| Check 2 `:4002–4004` | `T = diag(3^(−1/2), (2/3)^(1/2))`, `x = (5, 7)` | `Tr(T²) = 1`; `[u,T] = 0`; `Tr(xT²) = 5/3 + 14/3 = 19/3 = τ(5,7)` | holds |
| Check 3 `:4005–4010` | `T = e₁₁`, `x = (1,0)` | `Tr(T²) = 1`, `T` commutes with the diagonal algebra, `Tr(xT²) = 1 ≠ 1/3`. Uniqueness of the tracial state of a II₁ factor: anantharaman-popa 7405–7406 | holds |
| Check 4 `:4011–4016` | `L(F₂)`, `g = a`, `f = 1_S` | `ψ(λ_g f λ_g*) = ψ(f λ_g* λ_g) = ψ(f)` by centrality with `x = λ_g`, `T = fλ_g*`; `(λ_g f λ_g* δ_h) = f(g⁻¹h)δ_h`, so `m(gS) = m(S)`. `F₂ = W(a) ⊔ aW(a⁻¹)` (every word not starting with `a`, including `e = a·a⁻¹`, is `a·(a⁻¹…)`): `m(W(a)) + m(W(a⁻¹)) = 1`, likewise for `b`, total `2 > 1 ≥ m(W(a) ⊔ W(a⁻¹) ⊔ W(b) ⊔ W(b⁻¹))` | holds |
| Powers–Størmer `:3964` (re-flowed only) | as in round 26 | `a = diag(1,0)`, `b = diag(0,1)`: `‖a^(1/2)−b^(1/2)‖₂² = 2 = ‖a−b‖₁` | carried |
| GNS nondegeneracy sentence `:318–321` | `A = c₀`, `ψ = Σ 2^(−n−1)δ_n`, `b = Σ 2^(−n)δ_n`, `e_N = 1_[0,N)` | `‖e_N b − b‖ = 2^(−N)`; `ψ(|e_Nb−b|²) = Σ_{n≥N} 2^(−n−1)4^(−n) ≤ 4^(−N) = ‖ψ‖‖e_Nb−b‖²`; `π_ψ(e_N)[b] = [e_N b] → [b]`, and the `[b]` are dense by `denseRange_toGNS` | holds |
| Contract description of `toGNS` `:194–196` | `GNS.lean:54` | `A →L[ℂ] f.GNS`, continuous linear, `a ↦ [a]` (`toGNS_apply`, `:58`); dense range `:62` | holds |
| `exists_faithful_nondegenerate_representation`, nondegeneracy negative control, `π 1 = 1`, unitization cut-down, V0.SeparableFaithful unital clause, min-norm criterion, hypertrace ⟺ expectation | as in round 26 | carried with the values of the round-26 table (e.g. `π(z) = diag(z,0)` on `ℂ²`: span `ℂ × 0`, not dense) | unchanged |
| `exists_injective_nondegenerate_representation_lp`, `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv`, `double_commutant_iff_isClosed_image_ofCLM`, `closure_unitBall_eq_unitBall_double_centralizer`, `closure_isStarProjection_eq_positive_contractions`, `isCyclic_iff_isSeparating_commutant`, `ProjectionEquivalent`, `equivalent_of_subequivalent`, `tracialState_unique`, `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne`, `ergodicSMul_dense_subgroup`, `tomiyama`; README Checks and routes of Layers 1, 3, 4 and 13 | as in round 25 | carried with the values of the round-25 table (e.g. `tomiyama` on `M₂`: `axb = [[10,28],[45,84]]`, diagonal `diag(10,84) = aE(x)b`; `{x,y}`: `a(x) = 4/9`, `a(y) = 7/18`) | unchanged |

Eleven rows were computed this round; the remaining rows of the round-25 and round-26 tables are carried in the last two rows.

**Duplication and ownership.** The new Checks state no new object; the Følner criterion, hypertraces and Connes's trick are owned here in 13.2 as before, and no roadmap on main or at an open head states them: `roadmaps grep` for "hypertrace" finds, besides this folder, only consumers of this roadmap's §V13 (Subfactors `README.md:256`, `:1545`, `:1559`; FactorRigidity `README.md:232`); "Følner" outside this folder finds AmenableGroups Layer 5's group-theoretic Følner sets (`README.md:289–291`), which 13.2 consumes, and group-level uses in PointProcesses, GeometryOfNumbersAndQuadraticArithmetic, CategoricalOperatorAlgebras, OperatorAlgebraDynamics, CompactQuantumMetricSpaces and QuantumGroups; "Connes' trick" matches nothing. Ownership against open pull requests was checked on the index of 2026-11-08T01:48:05Z (476 pull requests).

## Not verifiable

- Takesaki III XV.3 (Theorem 3.1, Definition 3.5), Tomiyama 1957, Arveson 1969, Haagerup 1985 and 1987, Connes–Størmer 1978, Connes–Woods, Runde and Dixmier: unchanged from the previous rounds, no legal full text, cited by locator. None of them is touched by the diff.
- Pull requests outside the index of 2026-11-08T01:48:05Z were not searched.

## Source issues

- none
