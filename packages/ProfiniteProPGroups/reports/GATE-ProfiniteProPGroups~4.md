# GATE-ProfiniteProPGroups~4: answers to the review of `9d07815`

The repairs are in commit `9af5d7e5` on top of `9d07815`. Only `TauCetiRoadmap/ProfiniteProPGroups/README.md` and
`TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean` changed. The diff is 281 insertions and 180 deletions.

## H01 (CBirkbeck) — applied
README Layer 9 "Division" bullet (now line 2022). Old: `v_p(φ(0)) = v_p(ψ(0)) - v_p(c)`, with no condition on `c`. New: the additive form `v_p(ψ(0)) = v_p(c) + v_p(φ(0))` in `ℕ ∪ {∞}` holds for every `c`, and the subtractive form is stated only for `c ≠ 0`. The bullet records three witnesses: `(T, 1)` and `(2T, 2)` at `p = 2, c = 0` (where `∞ = ∞ + 0` and `∞ = ∞ + 1`), and `c = -6, φ = 1` (where `0 = 1 − 1`). The division criterion at `c = 0` is unchanged.

## H02 (CBirkbeck) — applied
README Layer 9 completed-group-algebra edge cases (line 1954). Old: "a finite procyclic `Γ`, where evaluation at `γ - 1` has kernel `((1+T)^|Γ| - 1)`". New: the claim is restricted to a finite cyclic `p`-group with a chosen generator. The Checks are:
- `C₃` at `p = 3`: the polynomial is `T³+3T²+3T`, distinguished of degree 3, and the rank is 3.
- The trivial group: the kernel is `(T)`.
- Negative control, `C₂` at `p = 3`: `(1+T)²−1 = T(2+T)` with `2+T` a unit, so the quotient has rank 1 against rank 2 for `ℤ₃[C₂]`. Also `(γ−1)ⁿ = (−2)ⁿ⁻¹(γ−1)` with 2 a unit, so `γ−1` is not topologically nilpotent.

## H03 (CBirkbeck) — applied
- README Layer 7 (line 1231). Old: "its `IsProP` field is what confines it to pro-`p`, hence profinite, groups". New: the field only constrains quotients by open normal subgroups, as `TauCeti.IsProP` does in `Topology/Algebra/Group/Profinite/ProP/Basic.lean` line 68. The discrete `⊕_ℕ C₂` satisfies it and is not compact, while `∏_ℕ C₂` is compact. Theorems carry `[CompactSpace G] [TotallyDisconnectedSpace G]` separately.
- `Suggested.lean` docstring of `IsDemushkin` (line 578): the same correction.
- The pro-`p` sentence moved into the new `## Conventions` section (line 109), reworded the same way.

The elaborated signatures were checked mechanically (see the binder check below). Every theorem whose type mentions `IsDemushkin`/`IsProP` of a variable `G` carries both instances. The only exceptions are theorems about `presentedProP p (Fin n) {r}`, which has them as instances.

## H04 (CBirkbeck) — applied
`Suggested.lean` gains three declarations:
- the alias `demushkinWordTwoOddTop` (line 867);
- `isDemushkin_marked_of_q_two_odd_top` (line 1021);
- `isDemushkin_marked_of_q_two_even_top` (line 1037).

The two theorems are closed by `TauCeti.isDemushkin_marked_of_q_two_odd_top` and `TauCeti.isDemushkin_marked_of_q_two_even_top` (`Demushkin/NormalForm/Marked.lean` lines 173 and 319), with hypothesis `Im χ = zpowers (−1)`. The README marked-classification bullet (line 2508) changes from "four statements" to "six statements". It now names the `{±1}` relators `x₁²(x₂,x₃)⋯` (`χ(x₁) = −1`) and `x₁²(x₁,x₂)(x₃,x₄)⋯` (`χ(x₂) = −1`).

The review's witnesses are recorded as computed:
- `⟨x,y ∣ x²(x,y)⟩` with `n = 2, q = 2, Im χ = {±1}`: only the even statement applies, giving `χ(x) = 1, χ(y) = −1`. This matches `χ(y) = (1−q)⁻¹ = −1`.
- `x₁²(x₂,x₃)` at rank 3: gives `(−1, 1, 1)`.

The "separate statement" sentence of the even-rank bullet now names `isDemushkin_marked_of_q_two_even_top`. The same pattern also covered `twoPowENat`, `demushkinWordTwoOddPadic` and `demushkinWordTwoEvenPadic`: they were definitions that no stated theorem used, so they are deleted. The README now describes the 2-adic words in prose through `TauCeti.IsProP.padicPow` and `TauCeti.IsProP.padicPow_natCast`, both pinned by `#check`.

## H05 (CBirkbeck) — applied
`Suggested.lean` gains two theorems, with no extra hypotheses:
- `nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff` (line 457). It needs no finite generation of `H` and quantifies over `Q : FiniteGrp.{u}`. It is closed by the Tau Ceti theorem of the same name (`Profinite/FiniteQuotients.lean` line 189) through `FiniteGrp.of`.
- `cd_p_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation` (line 1837). It needs no finite generation of `G`. It is closed by `TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation` (`Free/Pointed/Serre.lean` line 108).

README lines 1769 and 2691 name both theorems and add Checks:
- determinacy: `C₂` against `C₂`; `C₂` against `C₄` (negative); `ℤ_p` against `ℤ_p²` (negative). A further Check shows the finite-generation hypothesis on `G` cannot be dropped: `∏ C_{pⁿ}` against `∏ C_{pⁿ} × ℤ_p` have the same finite quotients but are not isomorphic.
- Serre: the trivial group; the free pro-`p` group on `ℕ⁺` (rank `ℵ₀`, `cd_p = 1`); `ℤ/p` (negative); `ℤ_p²` (negative).

## H06 (CBirkbeck) — applied
README Layer 9 (line 1842). The bullets "Basics", "Alternating…", "Symplectic normal form", "Characteristic two, nonalternating" and "The change-of-basis theorem" were milestones to build. They are replaced by one "Supplied normal forms" bullet that consumes Tau Ceti's:
- `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `IsAlt.even_finrank` (`SymplecticBasis.lean` line 301);
- `IsSymm.exists_basis_toMatrix_eq_one` and `Nondegenerate.exists_basis_toMatrix_eq_J_or_toMatrix_eq_one` (`Diagonalization.lean` lines 227 and 264), with the squares hypothesis over `𝔽₂` from Mathlib's `isSquare_of_charTwo'`.

The Layer 9 introduction no longer calls these "owned inputs … built here". The bullet's Checks:
- `J` against `I₂` over `𝔽₂`: the two branches.
- The empty form: `m = 0`.
- `I₁`: the second branch, odd dimension.
- `I₂` over `𝔽₃`: excluded, because 2 is not a square.

What is kept is the application from relator to cup matrix, now with an explicit sign (see H08).

## H07 (CBirkbeck) — applied
Deleted from `Suggested.lean`:
- `isUnit_neg_three`, `negThreeUnit_coe` and `standardD0Orientation_continuous`;
- the value theorems `standardD0Orientation_d0A`, `_d0S`, `_d0Y` and `_relator`;
- the alias `d0Relator`, which no remaining statement used.

`standardD0Orientation_surjective` and `standardD0Orientation_unique` remain. The README gains a Layer 7 bullet, "The standard orientation of `D₀`" (line 1276). It cites the Tau Ceti value theorems by their `TauCeti.` names and has three Checks:
- `χ(A) = −1, χ(S) = 1, χ(Y) = −1/3`, and the relator maps to `(−1)²·1⁴·1 = 1`. The trivial character also kills the relator.
- With `χ(A) = 1` the image is `U^(2)`, of index 2.
- `−3 = 1 − 2²` gives level `f = 2`, not 3.

## H08 (CBirkbeck) — applied differently
Applied:
- A `## Conventions` section (line 109). It holds the existing conventions paragraph plus the trace convention and Mathlib's `Matrix.J = fromBlocks 0 (−1) 1 0`.
- Supernatural Checks (line 219): product `216`, `gcd 6`/`lcm 36`, the all-ones and `2^∞` non-naturals, and `p^∞·p = p^∞`.
- The `C₂` warning (line 1511). Old: "the rank formula fails for it". New: the formula holds there (`0 − 2 = 2·(1 − 2)`), and it is the Demushkin property of the subgroup `1` (`H² = 0`) that fails.
- The two local "Layers 9 and 11" references are corrected to Layer 9. The other "Layer 11" references point to ProfiniteCohomology Layer 11, which exists on main ("Layer 11: cohomological dimension").
- The "up to one global sign" is pinned at line 1875. With `tr(c) = φ(r)` and `δφ(g,h) = φ(g)+φ(h)−φ(gh)`, the cup matrix is `−a_{ik}` above the diagonal, `a_{ik}` below it, and `−binom(p,2)c_i` on it. The witness: `(x₁,x₂)` mapped to the Heisenberg group gives `r ↦ (0,0,1)`, so `B₁₂ = −1, B₂₁ = 1`, which is `Matrix.J (Fin 1)`. `x₁²` gives `−1 = 1` in `𝔽₂`.

Not applied: there is no "Exact supplier contracts" heading, and the README does not yet have three Checks for every definition or `### Examples`/`### Dependencies` subsections in every layer. That is a restructuring of the whole 2700-line README. The supplier contracts remain in "Scope and exported contract" and in the *In Tau Ceti:* lines.

## H09 (CBirkbeck) — applied
README line 729. Old: `(continuousCohomology (ZMod p) G n).obj (trivialFp p G)`. New: `continuousCohomology n (trivialFp p G)`. This matches Mathlib `RepresentationTheory/Homological/ContCohomology/Basic.lean` line 131 and `TauCeti.cohomFp` (`ContCohomology/TrivialFp.lean` line 246). No other occurrence exists in either file.

## Build and gate

- `lake build TauCetiRoadmap.ProfiniteProPGroups.Suggested`: **Build completed successfully (9471 jobs)**. There are no errors and no warnings. The output has 22 `info:` lines, from the pinning `#check`s; the two new ones are `TauCeti.IsProP.padicPow` and `TauCeti.IsProP.padicPow_natCast`. There is no `sorry`.
- Gate: `gate ProfiniteProPGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1176 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Binder check: before the final build I appended `#check @TauCetiRoadmap.ProfiniteProPGroups.<name>` for all 116 declarations to `Suggested.lean`, built once, read the elaborated types, and removed the block. Three extra lines matched docstring words and failed as unknown identifiers; every real declaration elaborated. The four new theorems have exactly the binders stated above. The marked theorems take `G : Type` from the section `variable`, as the four existing ones do. No binder changed as a result of the check.
- Ownership: no new construction was added. Every new statement is closed by a Tau Ceti theorem at the pin. Ownership against open pull requests was not re-searched, because nothing new is planned.
- Sources: no new source was fetched. The cup-matrix sign is pinned by the computation above rather than by NSW's printed sign. The review's Labute locator (`labute1967` line 660) was not checked, because no sources cache exists for this roadmap.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| constant-term valuation | `p=2,c=0,(T,1)`; `(2T,2)`; `c=−6,φ=1` | additive: `∞=∞+0`, `∞=∞+1`, `1=1+0`; subtractive at `c=−6`: `0=1−1` | additive always true; subtractive needs `c≠0` | H01 |
| finite cyclic coordinate | `C₃,p=3`; `1`; `C₂,p=3` | ranks 3=3; 1=1; 1≠2 | `p`-group needed | H02 |
| `IsProP` vs compactness | `⊕ℕ C₂`; `∏ℕ C₂` | both have only 2-group open quotients; only the product is compact | prose corrected | H03 |
| `…_odd_top` | `ℤ/2` (n=1); `x₁²(x₂,x₃)` | `χ(x₁)=−1`; `(−1,1,1)` | true, no rank bound needed | added |
| `…_even_top` | `x²(x,y)`; n=4 `x₁²(x₁,x₂)(x₃,x₄)` | `χ(y)=(1−2)⁻¹=−1, χ(x)=1`; `χ(x₂)=−1`, rest 1 | true | added |
| determinacy | `C₂/C₂`; `C₂/C₄`; `∏C_{pⁿ}` vs `×ℤ_p` | quotients `{1,C₂}` both; `C₄` only for `H`; same quotients, but Hom to `ℤ_p` is 0 vs onto | f.g. of `G` is necessary | added |
| Serre iff | `1`; `ℤ/p`; `ℤ_p²` | `cd 0`, `s=∅`; `cd ∞`, torsion; `cd 2`, `H²≠0` | both directions are consistent | added |
| normal-form dichotomy | `J`,`I₂`/𝔽₂; empty; `I₁`; `I₂`/𝔽₃ | alt/m=1; nonalt/id; m=0; odd dim; 2 not a square | the squares hypothesis matters | H06 |
| cup-matrix sign | `(x₁,x₂)`; `x₁²` at p=2 | Heisenberg `z(r)=1`, `B₁₂=−1`; `φ(x₁²)=−1≡1` | matches `Matrix.J` | H08 |
| `D₀` orientation | values; `χ(A)=1` variant | relator `→1`; image `U^(2)`, index 2 | sign on `A` needed for onto | H07 |
| supernatural ops | 12,18; all-ones; `2^∞` | 216; gcd 6, lcm 36; infinite support; infinite value | both clauses of the predicate needed | H08 |

## Suspicious passages
None. The review contained no instructions outside its findings.
