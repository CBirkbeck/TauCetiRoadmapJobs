# Review of AdelicAlgebraicGroups (pull request #3027 at 6ff5aef)

**Verdict:** accepted

**Summary.** An incremental re-review of the 38 lines changed since `71bbefa`, and a check of the pull request's title and description against this head. The verdict is accepted, with no findings: the general case of the comparison of Tamagawa measures now stated in 2.6 (iii) agrees with Oesterlé's theorem and was recomputed on the norm sequence of a quadratic extension, the added locators into Oesterlé, Loeffler and Rapinchuk were read at the text, and the description now names this roadmap's additions. One small correction is carried, in untouched text, and there are no format notes. One question for the author is carried; nothing is left for the human reviewers.

## C01 — Untouched text: README 1.5 (lines 1018 and 1024) cites [Borel] §5.5 for unimodularity, and that lemma does not treat groups with a rational character

*Local unimodularity of reductive groups* and *Adelic groups of reductive groups are unimodular* cite "[Borel], §5.5, p. 20". Borel's Lemma 5.5 (borel lines 655–658) proves that unimodularity is equivalent to every left-invariant rational top form being right-invariant, and concludes only when `G` has no rational character; `GL_n` has one. The statements are true. Oesterlé, Chapter I, Proposition 5.3 and Corollaire 5.4, p. 23 (oesterle lines 470–477), already in the References, gives both targets directly. This is for a separate pull request.

## Questions for the author

- *tamagawa-torus-ono* (lines 4213–4245): are ClassFieldTheory layers 5 and 10 needed as well as 0 and 11? The route cites Oesterlé IV 2.7, where the map `Λ_T` is defined through the local invariants `H²(F_v, G_m) → ℚ/ℤ` and their sum (oesterle lines 1643–1649), which this README elsewhere attributes to layers 5 and 10 (the local Brauer group and the global Brauer sequence). What stopped me: I could not tell whether layer 11 is meant to carry the invariant maps for this purpose.

## Previous findings

- none: the previous report raised no finding. Its five small corrections stand as follows.
- C01 (description omits this roadmap) — repaired: the sentence on the largest additions now ends "and AdelicAlgebraicGroups (Tamagawa numbers of tori, strong approximation for any finite set of places, the mass)".
- C02 (2.6 (iii) only without characters) — repaired: (iii) adds "Without the hypothesis on characters, … the quotient of `τ_G` by `τ_H` is … the restriction of `τ_{G/H}` to the open image", with a route, and 4.1a's *Needs* cites it.
- C03 (missing locators) — repaired: Oesterlé IV, Corollary 3.3, p. 56 for the norm-one torus; [Platonov–Rapinchuk], §7.4; Gross's Proposition 1.4 through [Loeffler], Proposition 3.1.2 and Remark 3.1.6, p. 15; Kneser and Platonov as attributed in Rapinchuk's Theorem 2.3.
- C04 (ownership of the adelic mass identity) — repaired: the ownership paragraph now says that §3.3.4 there is "the case of *class-set-integration* (AA.4.5a) for `G = SO(Q)` and `U` the stabilizer of a lattice".
- C05 (Borel §5.5 for unimodularity, untouched text) — not repaired: carried as C01 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 2.6 *homogeneous-gauge-measure* (iii), general case (changed) | `1 → R¹_{E/F}G_m → Res_{E/F}G_m → G_m → 1`, norm; inert unramified `v` | `L_v`: `(1−q^{−2s})^{−1} = (1+q^{−s})^{−1}(1−q^{−s})^{−1}`; volumes `(1−q^{−2})/(1+q^{−1}) = 1−q^{−1} = vol G_m(𝒪_v)`; norm image open | true; oesterle lines 1025–1033 |
| 2.6 (iii) route: characters (changed) | `GL₂ ⊃ G_m`; `GL₂ ⊃ SL₂`; Borel `B ⊃ N` | `det|_{G_m} = t²`, cokernel `ℤ/2`, kernel `X*(PGL₂) = 0`; `0 → ℤ → ℤ → 0`; `X*(N) = 0`, `X*(B/N) = X*(B) = ℤ`; ranks add | exact after `⊗ ℂ`; A.1.4, p. 81 |
| 2.6 (iii) route: `G(𝒪_v) → Ξ(𝒪_v)` onto (changed) | `H` connected (hypothesis); control `G_m → G_m`, `t ↦ t²`, `H = μ₂` | connected fibre: Lang gives a `k_v`-point, Hensel lifts it; `μ₂`: image of `ℤ_p^×` is the squares, index 2 | true; connectedness of `H` is in scope |
| 4.1a *tamagawa-torus-ono* with the new *Needs* (changed) | same norm sequence over `F` | `τ(Res G_m) = 1`, `τ(G_m) = 1`, norm image of index 2 in `𝔸_F^1/F^×`: `1 = τ(R¹)·(1/2)`, so `τ(R¹) = 2 = #H¹(C₂, ℤ_−)/1` | true; agrees with *tamagawa-quadratic-norm-torus* |
| 4.2a attribution (changed) | Rapinchuk Theorem 2.3 | heading credits Kneser and Platonov in characteristic zero (rapinchuk line 565) | as written |
| 4.5a credit to Gross (changed) | Loeffler 3.1.2, 3.1.6 | 3.1.2: `G_∞` compact ⇒ `G(F)` discrete in `G(𝔸_f)`, proved from Gross 1.4; 3.1.6: Gross treats groups with finite arithmetic subgroups (loeffler lines 686–716) | as written |
| Ownership paragraph against GeometryOfNumbersAndQuadraticArithmetic §3.3.4 (changed) | `G = SO(q)`, `q` totally positive | `A_G = 1`; 4.5a: `vol = vol(U)·vol(G(F_∞))·mass(U)`; §3.3.4 (line 1138): mass `= vol/(vol(G(K_∞))·vol(K_f))` | same identity; clause true |

The rows for the untouched statements stand as in the previous review, of `71bbefa`.

- Source locators read at the text: Oesterlé III 3.1–3.3, pp. 36–37 (oesterle lines 1010–1033); III 1, p. 34 (connected groups, line 917); I 3.6, p. 20 (line 345); Appendix 1, A.1.4, p. 81 (line 2811, with its uses at lines 1028 and 1726); IV, Corollary 3.3, p. 56 (line 1778); Loeffler 3.1.2 and 3.1.6, p. 15; Rapinchuk Theorem 2.3. All support the text as written.
- Cross-roadmap citations of the changed text resolved: ReductiveGroupsPartII RG2.3.7 (Lang's theorem and lifting) on `main` and at this head; GeometryOfNumbersAndQuadraticArithmetic §3.3.4 at this head. OrbitMeasuresOnAdelicGroups cites 2.6 (ii) and (iii), which the added sentence leaves as they were.
- Record: no layer, heading or Lean declaration is removed against the merge base; `Suggested.lean` is identical to `main`'s.
- Title and description read against this head: the three subjects named for this roadmap (4.1a, 4.2a, 4.5a) are in the head; "stated in the generality of its source" now holds for 2.6 (iii); no sentence about this folder is contradicted.
- Dependency check: `depcheck: 1 roadmaps, 4 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``. The diff changes no Lean declaration, so the one-tactic probe and the signature comparison had nothing new to test.

Overlap check: read OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces (main) as in the previous review; the change adds no object. Class-set integration and the mass: owner AA 4.5a, with GeometryOfNumbersAndQuadraticArithmetic §3.3.4 its `SO(q)` case, now said in the ownership paragraph. Nothing else shared.

Source independence: changed passages only: 6 passages compared with 3 sources (Oesterlé, Loeffler, Rapinchuk), none shared; largest share in the changed passages Oesterlé, 5 of 8 locators; no layer is added, removed or reordered, so the arrangement was not compared. Weil and Tate could not be read.

Research link: 2.6, 3.4a and 4.1a are the Tamagawa measure and number of Weil (1961), Ono (1963) and Oesterlé (1984); 4.2a is the Kneser–Platonov strong approximation theorem as in Rapinchuk (2014); 4.5a is the mass of Gross (1999). Rests on the README's citations and on Oesterlé and Rapinchuk as read.

## Not verifiable

- [Platonov–Rapinchuk], §7.4 (4.2a): paywalled; the theorem was read in Rapinchuk's Theorem 2.3 instead.
- [Gross], Proposition 1.4 (4.5a): paywalled; read as Loeffler's Proposition 3.1.2 restates it.
- [Ono] (4.1a): no open copy; Oesterlé IV 3.3 was read in its place.
- [Weil], *Adeles and Algebraic Groups*, II §2.4 (2.6): no open copy.

## Source issues

- none

## For the human reviewers

- none
