# Review of VonNeumannAlgebras (pull request #1041 at dbb77c9)

**Verdict:** needs changes

Incremental re-review of the 47 changed lines since a324aaf (29 insertions, 18 deletions in `README.md` and `Suggested.lean`; nothing outside the folder). R01, R02 and R04 of the previous report are repaired. R03 (the branch is not rebased on main) is not. Moving the Layer 13 locators (R04) attached Anantharaman–Popa Theorem 10.3.1, which is stated for II₁ factors, to a sentence that claims the projection Følner criterion for every finite algebra. At that generality the claim is false; a two-dimensional counterexample is below (R01). The R02 repair makes V0.SeparableFaithful consume Tau Ceti declarations that its `*Needs:*` line does not list (R02 below).

## R01 (P2) — Connes's projection Følner criterion is claimed for all finite algebras; it fails for `ℂ²` with a non-uniform trace

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:3949–3957`: "for finite algebras … prove Connes's finite-rank Følner criterion: finite subsets of the left action admit nonzero finite-rank projections whose Hilbert–Schmidt commutators divided by their Hilbert–Schmidt norms are arbitrarily small, with normalized compressed traces approximating τ (Anantharaman–Popa, … Theorem 10.3.1, p. 166 …)".

**Claim:** the projection form together with the trace clause does not hold for finite algebras in general, and neither cited theorem states it. Anantharaman–Popa Theorem 10.3.1 (anantharaman-popa line 7413) gives finite-rank projections only for a II₁ factor and has no trace clause. Theorem 10.2.9 (line 7333) covers every tracial `M` and has the trace clause (10.2), but it gives a positive finite-rank operator `T`, not a projection. When `L²M` has a type I_n summand of finite multiplicity and the trace is not proportional to the canonical trace there, no projection meets both conditions.

**Witness:** `M = ℂ²`, `τ(a,b) = (a+2b)/3`, `L²M = ℂ²`, `u = (1,−1)`, `x = (1,0)`, `ε = 1/10`. Rank one: `‖uP−Pu‖₂ = 2√2|c|` forces `p(1−p) < 1/800`, so the ratio `Tr(xP)/Tr(P) = p` is near 0 or 1. `P = 1` gives `1/2`. Neither is within `1/10` of `τ(x) = 1/3`.

**Repair:** replace the clause from "prove Connes's finite-rank Følner criterion:" to "approximating τ" by: "prove Connes's Følner criterion: for every ε>0 and finite set F of unitaries of M there is a positive finite-rank T on L²M with `‖T‖₂=1`, `‖uT−Tu‖₂≤ε` for u∈F and `|Tr(xT²)−τ(x)|≤ε‖x‖` for all x∈M (Anantharaman–Popa, Theorem 10.2.9, pp. 164–165); for a II₁ factor T can be taken to be a nonzero finite-rank projection divided by its Hilbert–Schmidt norm, and the factor case needs no trace clause (Theorem 10.3.1, p. 166)". Also add the witness above as a negative-control Check to the 13.2 Checks list at `:3901`. Tested on the refuting instance: `T = diag(3^(−1/2), (2/3)^(1/2))` gives `‖T‖₂² = 1`, `[u,T] = 0` and `Tr(xT²) = a/3 + 2b/3 = τ(x)`.

## R02 (P3) — V0.SeparableFaithful now uses Tau Ceti GNS declarations that its `*Needs:*` line does not list

**Location:** `README.md:354–358` ("prove faithfulness and nondegeneracy from the native positive contractive approximate unit and the dense classes [a]. When A is unital, … take the cyclic vector … from `PositiveLinearMap.gnsVector` and `PositiveLinearMap.denseRange_gnsStarAlgHom_gnsVector`") and `:378–379` (*Needs:* "Mathlib `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `gnsNonUnitalStarAlgHom`, the C*-algebra approximate unit and `lp`; …").

**Claim:** the repaired route uses two Tau Ceti declarations by name, but the paragraph's *Needs:* line still lists only Mathlib items and earlier V0 targets. The house rule asks for every input of a route to be listed, item by item. The nonunital route also uses "the dense classes [a]", and that input is a pinned Tau Ceti theorem the README never names.

**Witness:** at main's Tau Ceti pin (`2fd255d9`), `TauCeti/Analysis/CStarAlgebra/GNS.lean:54` has `PositiveLinearMap.toGNS`, `:62` has `denseRange_toGNS` (under `[NonUnitalCStarAlgebra A]`), and `:72` and `:99` have `gnsVector` and `denseRange_gnsStarAlgHom_gnsVector` (unital).

**Repair:**
- At `:356`, write "the dense classes [a] (`PositiveLinearMap.denseRange_toGNS`)".
- Extend `:378–379` with "; Tau Ceti `PositiveLinearMap.toGNS`, `PositiveLinearMap.denseRange_toGNS`, `PositiveLinearMap.gnsVector` and `PositiveLinearMap.denseRange_gnsStarAlgHom_gnsVector`".
- Add `toGNS` and `denseRange_toGNS` to the Tau Ceti contract at `:194–197` and to the Layer 0 Dependencies bullet at `:413`.

## R03 (P3) — The branch is still not rebased on main

**Location:** the branch as a whole. Its `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`. `README.md:194–205`, `:309–312` and `:358` cite `TauCeti/Analysis/CStarAlgebra/GNS.lean` and `TauCeti/Analysis/VonNeumannAlgebra/*.lean`.

**Claim:** this is unchanged since the previous report. The merge base is `350e970c`, which predates f8dfe0ad, so git sees the branch as adding both files that main already has. The pull request cannot merge, and the branch's Lake pin has none of the Tau Ceti GNS or von Neumann files that the README, the Lean docstrings and R02's repair cite.

**Witness:** at dbb77c9, `git merge-tree --write-tree origin/main HEAD` reports a CONFLICT (add/add) on `README.md` and `Suggested.lean`, listing each file at stages 2 and 3. On the branch, `.lake/packages/TauCeti/TauCeti/Analysis/CStarAlgebra` holds only `CharacterSpaceMeasure.lean` and `UnitaryCharacter.lean`.

**Repair:** rebase onto main, resolving both files to this head's content, so that `git diff origin/main HEAD -- TauCetiRoadmap/VonNeumannAlgebras` is the whole pull request (now `179 insertions, 42 deletions`) and the branch carries main's `lake-manifest.json`. Control: `git merge-tree --write-tree origin/main <new head>` prints only a tree id, and `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested` passes.

## Previous findings

- R01 — repaired: `Suggested.lean:76` `exists_faithful_nondegenerate_representation (A : Type u) [NonUnitalCStarAlgebra A]`, giving `π : A →⋆ₙₐ[ℂ] (K →L[ℂ] K)` with `Function.Injective π ∧ Dense (Submodule.span …)`; `README.md:318–323` "stated for every C*-algebra A, possibly nonunital and nonseparable … the zero space when A=0".
- R02 — repaired: `README.md:354–358` "For nonunital A there is no class of the unit; … When A is unital, use `gnsStarAlgHom`, retain unit preservation, and take the cyclic vector … from `PositiveLinearMap.gnsVector`". The repair left the *Needs:* line behind: R02 above.
- R03 — not repaired: `git merge-tree --write-tree origin/main HEAD` still reports add/add conflicts on both files; the Lake pin is still `a91d3aaf`/`6b7abb3c` (R03 above).
- R04 — repaired: `README.md:3923–3924` now reads "minimal-norm criterion (Takesaki III XV.3, Theorem 3.1 and Definition 3.5)". The moved locators at `:3954–3957` resolve, but they exposed R01 above.

## Verified sound

**Gate.** My run at dbb77c9: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (verbatim):

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, and VonNeumannAlgebras is line 6 of the merge order. Citations: `roadmaps resolve` finds nothing missing. Overlaps: no other open pull request changes this roadmap, and there is no dropped id and no id defined only by an open revision. No gaps are declared.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly fourteen `declaration uses sorry` warnings (`:76`, `:87`, `:98`, `:107`, `:118`, `:130`, `:139`, `:154`, `:174`, `:203`, `:211`, `:218`, `:227`, `:241`) and nothing else.

- **`#check`.** A scratch copy with `#check @name` for all 22 declarations elaborates. The changed headline prints `∀ (A : Type u_1) [NonUnitalCStarAlgebra A], ∃ K _ _ (_ : CompleteSpace K) π, Function.Injective ⇑π ∧ Dense ↑(Submodule.span ℂ {ξ | ∃ a η, (π a) η = ξ})`. This matches the worker's `signatures.md` and `README.md:318–323`. It has no section binder (none is needed), and the source line declares `K : Type u`, the universe of `A`.
- **One-tactic probe.** A scratch copy replaces that headline's `sorry` by `first | simp | rfl | aesop | decide | infer_instance`, and it errors at `:80`, so the headline is not padding.
- **Rename.** The rename from `exists_faithful_representation` breaks nothing: the old name occurs nowhere on main or at any open head (`roadmaps grep`). The remaining 21 declarations are byte-identical to a324aaf. Their rows carry over from the round-25 report.

**Library objects opened.** Mathlib at the branch pin:
- `NonUnitalCStarAlgebra` (`Analysis/CStarAlgebra/Classes.lean:30`).
- `gnsNonUnitalStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:196`) and `gnsStarAlgHom` (`:246`).

Neither the branch's Mathlib pin nor main's has a noncommutative Gelfand–Naimark theorem: `Function.Injective` occurs in `Analysis/CStarAlgebra` only in `Hom.lean`, `CStarMatrix.lean` and `Multiplier.lean`, and there is no "nondegenerate" in the directory. No other roadmap states a Gelfand–Naimark theorem. A search of all Lean files for faithful representations finds only the CStarAlgebras (#860) quasidiagonality statements, which assume a faithful representation and do not construct one. Tau Ceti at main's pin is `GNS.lean:54`, `:62`, `:72`, `:99` and `:110`, as in R02.

**Sources: the diff's locators**, checked at the page markers:

- *Peterson, Layer 0:*
  - Proposition 4.1.4 (peterson-notes line 2185) and Proposition 4.1.5 (2193), both p. 56. Their C*-algebras may be nonunital: the proof of 4.1.4 reduces to the unitization (2187).
  - Theorem 4.1.6 (2218), p. 57, is stated for unital `A`.
  - Corollary 4.1.7 (2248), p. 58, gives a faithful representation of every C*-algebra by the direct sum of GNS representations, with the separable remark (2251–2253).

  So the new sentence at `:315–317` ("4.1.6 is stated for unital algebras and the corollary for every C*-algebra") is accurate. Nondegeneracy is not in 4.1.7; the README derives it (cut-down to the essential subspace, or the approximate unit), and both routes are checked in the table.
- *Anantharaman–Popa* (printed page = pdf page − 6; headers at lines 7180, 7268, 7309, 7354, 7401):
  - Definition 10.2.1 (7191, p. 161): amenable = injective = a conditional expectation from some `B(H)`.
  - Proposition 10.2.2 (7198, p. 161): independence of `H` and CP extension.
  - Proposition 10.2.5 (7269, p. 163): amenable iff a hypertrace exists, for tracial `M`.
  - Theorem 10.2.8 (7325, p. 164): Powers–Størmer, `‖x−y‖₂² ≤ ‖Tr(x²·)−Tr(y²·)‖` for bounded positive `x, y` with `Tr(x²), Tr(y²) < ∞`. This is the README's `‖a^(1/2)−b^(1/2)‖₂²≤‖a−b‖₁` with `a = x²`, extended to positive `L¹` by truncation `a·1_[0,n](a)`.
  - Theorem 10.2.9 (7333, statement p. 164, proof p. 165): operator form with (10.1) and (10.2).
  - Theorem 10.3.1 (7413, p. 166): II₁ factors, projections (R01).
- *Peterson Theorem 6.3.8* (4146, p. 103): for a finite `N ⊆ M`, a hypertrace exists iff a conditional expectation does.

**Sources: the seeded sample 13.1 and 13.2.** 13.1 is untouched by the diff. Its locators (Hiai 6.5; Peterson 6.2.1, 6.2.2, 6.3.6) are carried from the round-25 report. In 13.2 the only changes are the locator move above and the R01 sentence. The remaining locators of 13.2 (Anantharaman–Popa §§11.1, 11.2, 12.5; Connes–Feldman–Weiss Definitions 5–6, Proposition 7, Lemmas 8–9, Theorem 10; Haagerup 2016 and 1989) are unchanged and carried from round 25.

**Adversarial pass.** Rows for the changed statements were computed this round. Rows for the statements the diff leaves untouched are carried from the round-25 report (PRREVIEW-VonNeumannAlgebras~25, "Computed adversarial pass").

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` `:76` (new) | `A = 0`; `A = ℂ`; `A = c₀`; `A = ℓ∞(ℕ)` (unital, nonseparable); `A = K(ℓ²(S))`, `S` uncountable | `A = 0`: `K` is forced to `0`, since the span of the range is `0` and must be dense; `π = 0` is injective on one point. `ℂ`: `K = ℂ`, `π(z) = z·1`. `c₀`: `K = ℓ²(ℕ)`, `π(a) = diag(a_n)`, injective; `π(e_n)δ_n = δ_n`, so the range spans the finitely supported vectors, dense. `ℓ∞`: same `K`, unital. `K(ℓ²(S))` on `ℓ²(S)`: finite-rank operators give every vector; `K : Type u` | holds |
| nondegeneracy clause, negative control | `A = ℂ` on `ℂ²`, `π(z) = diag(z, 0)` | injective; the span of the range is `ℂ × 0`, not dense: excluded, so the clause has content. `π(1) = diag(1, 0) ≠ 1` | holds |
| "nondegeneracy forces `π 1 = 1`" (README `:322–323`, docstring `Suggested.lean:73–74`) | unital `A`, `P = π(1)` | `P* = P`, `P² = P`, `Pπ(a)η = π(a)η` on a dense span, `P` continuous ⟹ `P = 1`, so a unital `→⋆ₐ` results | holds |
| docstring "classes `[ab]` dense" | `c₀`, `ψ = Σ 2^(−n−1)δ_n`, `e_N = 1_[0,N)` | `‖[e_N b − b]‖² = ψ(|e_N b − b|²) ≤ ‖e_N b − b‖² → 0`, so `[ab]` approximates `[b]`, and `[b]` is dense (`denseRange_toGNS`) | holds |
| unitization cut-down route `:316–318` | `π̃ : Ã → B(K)` faithful, `K₀ = closed span π(A)K` | for `ξ ⊥ K₀`, `⟨π(a)ξ, η⟩ = ⟨ξ, π(a*)η⟩ = 0`, so `π(a) = π(a)|K₀ ⊕ 0`; injectivity is kept | holds |
| V0.SeparableFaithful unital clause `:356–358` | `A = ℂ²`, `ψ(z,w) = (z+w)/2` | `gnsVector = [1]`, `π(z,w)[1] = [(z,w)]`, the orbit is the whole `GNS ≅ ℂ²`; `‖[1]‖² = ψ(1) = 1` | holds |
| Følner criterion `:3949–3957` | `M = ℂ²`, `τ = (1/3, 2/3)`, `u = (1,−1)`, `x = (1,0)`, `ε = 1/10`; `M = R` | rank one: `8p(1−p) < 1/100` ⟹ `p < 0.0013` or `> 0.9987`, ratio `p`; `P = 1`: ratio `1/2`; `|·−1/3| ≥ 1/6`, so no `P` exists. `R`: Theorem 10.3.1 applies | **fails, R01** |
| R01 repair (operator form) | the same `ℂ²` | `T² = diag(1/3, 2/3)`: `Tr(T²) = 1`, `[u,T] = 0`, `Tr(xT²) = a/3 + 2b/3 = τ(x)` | holds |
| Powers–Størmer `:3950–3951` | `1×1`; `a = diag(1,0)`, `b = diag(0,1)` | `|√a−√b|² ≤ |a−b|`; the matrix pair gives `‖a^(1/2)−b^(1/2)‖₂² = 2 = ‖a−b‖₁`, equality | holds |
| hypertrace ⟺ expectation (Proposition 10.2.5, Theorem 6.3.8) | `M = M₂ ⊆ B(ℂ²)` | `E = id`, `ψ = tr/2` is `M`-central and restricts to `τ` | holds |
| min-norm criterion `:3923–3927` (locator only) | `M = B(H)`, `M′ = ℂ`; `M = ℓ∞ = M′` on `ℓ²` | scalars `y_i`: `‖Σ x_iy_i‖ = ‖Σ x_i ⊗ y_i‖`; abelian: `Σ x_iy_i` is the diagonal restriction of `Σ x_i ⊗ y_i ∈ C(X×X)`, sup over the diagonal ≤ sup | holds |
| `exists_injective_nondegenerate_representation_lp`, `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv`, `double_commutant_iff_isClosed_image_ofCLM`, `closure_unitBall_eq_unitBall_double_centralizer`, `closure_isStarProjection_eq_positive_contractions`, `isCyclic_iff_isSeparating_commutant`, `ProjectionEquivalent`, `equivalent_of_subequivalent`, `tracialState_unique`, `exists_faithful_tracialState`, `ergodicSMul_dense_subgroup`, `tomiyama` and its closedness clause | as in round 25 | carried, with the values of the round-25 table (e.g. `tomiyama` on `M₂`: `axb = [[10,28],[45,84]]`, diagonal `diag(10,84) = aE(x)b`; `equivalent_of_subequivalent` on `B(ℓ²)`: `1 ∼ 1−e₀` by the shift) | unchanged |
| README Checks and routes of Layers 1, 3, 4 and 13 (Kaplansky positive clause and its `q` Check, the unit-ball control, `adjoin`, amplification, Corollary 5.2.2, the `3⁻ⁿ` generator, inclusion matrices, V4.Core, the 13.1 negative Checks, Arveson non-uniqueness, injective ⟺ norm-one projection, spatial-norm and representation-independence Checks, point-ultraweak semidiscreteness, hyperfiniteness, Connes–Feldman–Weiss) | as in round 25 | carried from round 25 (e.g. `{x,y}`: `a(x) = 4/9`, `a(y) = 7/18`; `Λ = [[2,1],[1,1]]`, `5 = 2·2+1·1`) | unchanged |

Eleven rows were computed this round; the remaining 30 rows of the round-25 table are carried in the last two rows.

## Not verifiable

- Takesaki III XV.3, Theorem 3.1 and Definition 3.5, is now the only locator for the minimal-norm criterion at `:3924`. No legal full text is reachable, so it is cited by locator. Tomiyama 1957, Arveson 1969, Haagerup 1985 and 1987, Connes–Størmer 1978, Connes–Woods, Runde and Dixmier are unchanged from round 25.
- Ownership against open pull requests was checked on the index of 2026-11-07T20:04:29Z (472 pull requests) with `roadmaps grep` and `overlaps`. Pull requests outside that index were not searched.

## Source issues

- **Misprint** in anantharaman-popa at Definition 10.2.1, printed page 161: the source says a "von Neumann M" is amenable when it has a conditional expectation, omitting the noun; it should be "a von Neumann algebra M"; affects nothing.
- The items of the round-22, round-24 and round-25 reports stand and are already in the register.
