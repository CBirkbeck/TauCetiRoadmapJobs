# Review of EtaleDualityAndPerverseSheaves (pull request #3027 at 3b77a6a)

**Verdict:** needs changes

**Summary.** The repaired §7.6 is mathematically sound. The new lemma finitelyManyStabilizers and the rewritten route of the torus fixed-point formula hold in every case I computed, and the two new locators (Serre's Proposition 3, Dudas–Michel Proposition 13.9) say what the text claims. One finding remains, and the repair introduced it: the stabilizer lemma, and part (a) for every connected algebraic group, now have a second owner. FiniteReductiveGroups 3.4 still states and proves both itself and misdescribes §7.6. That change belongs in FiniteReductiveGroups, which is also in this pull request; nothing in this folder needs to change for it. There are two small corrections and no format notes. The deferred ReductiveGroups loop stands. The only question for the human reviewers is that the Deligne–Lusztig paper has no legal open copy.

## R01 (P2) — §7.6 and FiniteReductiveGroups 3.4 both own the stabilizer lemma and part (a) for every connected algebraic group

Someone implementing FiniteReductiveGroups 3.4 (d) is sent to prove the stabilizer lemma again, by a different route (SGA 3 rigidity), although their supplier now proves it. The same holds for (a) beyond linear groups. FiniteReductiveGroups also misdescribes what §7.6 says.

The new text of §7.6 does three things. It states finitelyManyStabilizers (`TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` lines 7522–7551). It states (a) for every connected algebraic group (line 7563). It calls (b) "this roadmap's own formulation" (line 7605).

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/README.md` at this head still has the older picture:

- Its *Origin:* line (1223–1225) says that "(a) for a connected algebraic group that need not be linear, by the same route, and (d) are this roadmap's own formulation".
- It states (d) on line 1234 and proves it with its own Noetherian induction on lines 1245–1253.
- Its route (line 1238) says that §7.6 "cites the published proof of (b); (a) is proved here for every connected algebraic group". Both halves are no longer true.
- Its *Needs:* line (1262) does not cite finitelyManyStabilizers.

I searched every roadmap on main and at the open heads: the lemma appears only in these two places. FiniteReductiveGroups consumes §7.6, so §7.6 is the owner.

The smallest change is in FiniteReductiveGroups 3.4:

- Keep (a) and (d) with their statements, since 3.4 is an item on main.
- Replace "(a) is proved here for every connected algebraic group" and the route of (d) with a citation of §7.6 (lefschetzGroupActions (a); finitelyManyStabilizers).
- Add finitelyManyStabilizers to its *Needs:* line.
- Drop "which cites the published proof of (b)".
- Attribute both to §7.6 in its *Origin:* line.

## C01 — The description still does not mention that ReductiveGroups Layer 9F cites §7.6

This carries over the previous C03 unchanged. The paragraph beginning "The additions create new supplier relations between general roadmaps" still omits one edge: ReductiveGroups Layer 9F now cites EtaleDualityAndPerverseSheaves §7.6. The sentence "in the general roadmaps, sections joining a mutual dependence already on `main`" does not cover it either, because ReductiveGroups cites this roadmap nowhere on main.

One sentence would fix it, for example: "ReductiveGroups Layer 9F cites EtaleDualityAndPerverseSheaves §7.6 for the Lefschetz numbers of finite-order automorphisms, which FiniteReductiveGroups Layer 3 stated on main."

## C02 — The generic flatness that finitelyManyStabilizers needs is already proved in the pinned Tau Ceti

The route and the *Needs:* line (lines 7537 and 7550) send the reader to SchemeAndStackFoundations §4.12. That section is a plan, and the Lean name it gives (`Formal.generic_flatness`) does not exist at the pin. The pinned Tau Ceti already has the step: `AlgebraicGeometry.exists_dense_open_flat` (`TauCeti/AlgebraicGeometry/Morphisms/Flat/Generic.lean:124`). It says that a quasi-compact morphism, locally of finite type, to a reduced locally Noetherian scheme is flat over a dense open subset. The stabilizer family `S → Z₁` meets these hypotheses.

The fix would cite it in the *Needs:* line and under the Tau Ceti supplier contracts, next to or instead of §4.12.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: "Stabilizers of diagonalizable group actions … Name the resulting statement finitelyManyStabilizers" (lines 7522–7551), proved via generic flatness and group-like characters; (b) cites it, and every point of `T(k)` has finite order prime to `p`. The repair introduced R01 above.
- R02 — not repaired: deferred (D01)
- C01 — repaired: "(a) A connected algebraic group `G` acting on `X` acts trivially on every `H^i_c(X)`" (line 7563), located by Serre-1977 Proposition 3; the restricted setting stays declared (lines 7397–7400).
- C02 — repaired: "(b) is this roadmap's own formulation, proved by the route above" (line 7605).
- C03 — not repaired: the description's paragraph on new supplier relations still omits ReductiveGroups Layer 9F's citation of §7.6 (C01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| finitelyManyStabilizers | `𝔾_m` on `𝔸²`, weights `(1,2)`, `char ≠ 2` and `= 2` | stabilizers `𝔾_m` (origin), `μ₂` (`a = 0, b ≠ 0`), `1` (`a ≠ 0`): three; in char 2 `μ₂` is non-reduced with one `F`-point | holds; Check true | none |
| finitelyManyStabilizers | `μ_p` scaling `𝔸¹` in char `p`; `μ₂` swapping two points; `W = ∅` | 2 stabilizers (`μ_p`, `1`) though `μ_p(F) = 1`; 1 stabilizer; none | holds | none |
| route, `S_V = D(M/N) × V` | components of the `(1,2)` action: closure of the punctured `b`-axis; `a ≠ 0` | `N = 2ℤ`, `S_V = μ₂ × V`; `N = ℤ`, `S_V = V` | holds | none |
| Check: diagonalizability needed | `𝔾_a²` on `𝔸²`, `(s,u)·(a,b) = (a, b+s+au)` | it is an action; stabilizer `s = −au`, a different line for each `a`; family `≅ Spec F[u,a,b]`, flat over `𝔸²` | Check true | none |
| lefschetzGroupActions (a), any connected `G` | elliptic curve `E`, translation `τ_P`, `P ≠ 0` of order `n` | trivial on `H¹_c` (dimension 2): `Lef = 1 − 2 + 1 = 0`; `τ_P` has no fixed points, and lefschetzDevissage (d) gives `0` for `p ∤ n` | holds | none |
| (a), connectedness needed | `ℤ/2` acting on `𝔾_m` by inversion | acts by `−1` on `H¹_c`: `Lef = 2 ≠ 0 = Lef(1)` | hypothesis needed | none |
| lefschetzGroupActions (b), new route | `T = 𝔾_m` on `𝔸²`, weights `(1,1)`, `g` = swap, `p ≠ 2, 3` | stabilizers in `T × ⟨g⟩`: all, `⟨g⟩`, `{1, (−1, g)}`, `1`; excluded `t = ±1`; `t` of order 3: `X^{gt} = {0} = (X^g)^T`; `Lef = 1 = 1` | holds | none |
| (b) route, `p = 2` | `k = 𝔽̄₂` | every element of `(k^×)^r` has odd order; `⟨g_{p′}⟩` of odd order `n` is `μ_n = D(ℤ/n)` | holds | none |
| Mathlib inputs of the route | `linearIndepOn_isGroupLikeElem`; `Module.Flat.torsion_eq_bot` | need `IsDomain` + torsion-free coalgebra, resp. `Flat`; met by `K[M]/I` over `K`, `O(S_V)` over `A` | holds | none |
| Generic flatness input | SchemeAndStackFoundations §4.12 (main, line 6921); Tau Ceti `exists_dense_open_flat` | reduced locally Noetherian target, quasi-compact finite-type map; `S → Z₁` meets both | holds; at the pin | C02 |
| Ownership of the lemma and of (a) | FiniteReductiveGroups 3.4 at head, lines 1223–1262 | (a) for every connected `G` and (d) stated and proved there; §7.6 lines 7522–7563 state the same | two owners | R01 |
| Supply direction (deferred) | ReductiveGroups README at head | lines 1267–1279 and 6329–6566 cite §7.6; line 7792 here names Layer 9F as a consumer | stands | D01 |

The rows for the untouched statements (lefschetzIntegrality, lefschetzDevissage, lefschetzJordanFormula, (c), and the headlines `uniformizerQuotient_selfInjective` and `form_similitude_det_alt`) stand as in the previous review, of `477bb48`.

- Source locators checked against the text: Serre-1977 Proposition 3 (line 163, "groupe algébrique connexe"), and Dudas-Michel-2015 Proposition 13.9 (lines 2678–2681, connected linear groups) with Propositions 13.7–13.8 (lines 2648–2673). None of the 15 seeded targets lies in the changed text.
- Library declarations opened at the pins: 3. They are Mathlib `linearIndepOn_isGroupLikeElem` (`Mathlib/RingTheory/Coalgebra/GroupLike.lean:103`, section variables lines 98–99), Mathlib `Module.Flat.torsion_eq_bot` (`Mathlib/RingTheory/Flat/TorsionFree.lean:84`) and Tau Ceti `AlgebraicGeometry.exists_dense_open_flat` (`TauCeti/AlgebraicGeometry/Morphisms/Flat/Generic.lean:124`). Tau Ceti has no statement that a diagonalizable action has finitely many stabilizers.
- Cross-roadmap citations resolved: 4. They are SchemeAndStackFoundations §4.12 (main), ReductiveGroups Layer 4 (diagonalizable groups, head line 2278), and FiniteReductiveGroups 3.4 and the ReductiveGroups contracts (head).
- Record: no layer removed or retitled since the merge base. `Suggested.lean` is unchanged since the merge base, and its elaborated signatures match the previous comparison: the `Category` binder flagged as dropped is present, and `gradedDelta`'s body does not use finite dimensionality.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`. It does not see the deferred loop between roadmaps on main.
- Automatic checks: the worker's run passed every check. Elaboration with `lake env lean` gives 7 `sorry` warnings and no errors.
- Overlap check: I read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology, SheafTheoreticSmithTheory, GlobalShtukasAndFunctionFieldLanglands and DeligneWeightsAndPurity. None states stabilizer finiteness or Lefschetz numbers of finite-order automorphisms; SheafTheoreticSmithTheory only cites §7.3. Across main and the 450 open heads, the stabilizer lemma's only other statement is FiniteReductiveGroups 3.4 (d). The owner is §7.6, the supplier (R01).

Source independence: changed passages only. I compared 6 passages with 2 sources (Dudas-Michel-2015 Proposition 13.9, Serre-1977 Proposition 3): the statement of (a), its locator sentence, the stabilizer lemma and its route, its Checks, and the route of (b). The longest shared run is 4 words of forced terminology ("acting on X", "acts trivially on"). The largest share of the changed passages' locators is Dudas-Michel-2015, 3 of 5. No layer was added, removed or reordered, so the contents were not compared.

Research link: §7.6 states the Lefschetz-number calculus of Deligne–Lusztig 1976 §3 (Serre 1977; Dudas–Michel 2015 §13), on which Deligne–Lusztig induction in ReductiveGroups Layer 9F rests. The roadmap's headlines (the decomposition theorem, and the Fujiwara–Varshavsky formula with local terms, from Varshavsky 2023 and Hansen–Kaletha–Weinstein 2022) serve geometric Satake and local Langlands. This rests on the README and Serre-1977.

## Not verifiable

- Deligne-Lusztig-1976, Proposition 3.3, Theorem 3.2, §3 and Proposition 6.4. It is only on JSTOR, and Lusztig's publication page lists it without a file. I checked these locators through Serre-1977 lines 119, 144, 163 and Illusie-Zheng-2013 line 802.
- Illusie-Zheng-2013: I read arXiv v3 and did not check its numbering against the published version.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its own roadmap folders (so that a change no review covers cannot merge unseen), when I ran it by hand without the list of this pull request's own folders, flagged 120 files. All of them are in folders this pull request owns, and the diff outside those folders is empty.

## Source issues

- none

## For the human reviewers

- Deligne-Lusztig-1976 (Ann. of Math. 103) has no legal open copy: it is on JSTOR, and Lusztig's page has no file. Its locators in §7.6 (README lines 7431, 7481, 7510, 7604) were checked only through Serre-1977 and Illusie-Zheng-2013.
