# Review of LocalGainOfThetaChains (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 23 lines changed since `2ac59b9`. Accepted, with no finding. The change corrects three attributions (Bannai–Kobayashi at a supersingular prime in 4.9a, the two parts of the model (i) in the formal proof in 4.9a, Rallis through Kudla's notes in 4.12); each was read at its locator and says what the source says. There are two small corrections (one carried over, one in untouched text that the change makes visible) and three carried format notes; none blocks. Nothing new is left for a human to decide beyond the standing scope and licence facts.

## C01 — The Origin label of 4.9b still names a published result by author and year only

"nearest published result: Mumford (1969), biextensions of formal groups, with the theorem of the cube" (line 273) gives no section, so the result the label compares with cannot be opened. The companion label of 4.12 now has its locator (Kudla, Chapter VI, Proposition 3.2); a section number of Mumford's paper would settle this one.

## C02 — In 4.9a (i) the series `t(c·ℓ(T))` has linear term `c·T`, not `T`

Statement (i) (line 216) says that `t = −2℘/℘′` at `z = c·ℓ(T)` "is an integral series in `T` with linear term `T`". Since `t = z + O(z⁵)` and `ℓ(T) = T + T^{p²}/p + …`, the linear term is `c·T`; it is `T` only when `c = 1`. The rest of the section is consistent with `c·T` (`φ(T) := −log(θ(cℓ(T))/(cT))`), and the formal statement that the changed Sources sentence now cites, `Formalism.L2.Th1.CM.CM3`, asserts integrality only, with no condition on the linear term. "with linear term `c·T`" (or dropping the clause) makes (i) agree with both. This is untouched text; it does not block.

## N01 — The six `*Sources:*` lines keep the parentheses of the tags they replace

For example "*Sources:* (Serre–Tate, Deuring, Lubin–Tate for the model, …)" in 4.9a; the others are in 4.10a, 4.12, 4.14a, 4.14c and 4.14f. Dropping the parentheses would read more cleanly.

## N02 — 4.16 restates the served data with fewer conditions than 4.9e (c) has

"served data as in 4.9e (c), with depth data such that …" would not invite a reader to take the shorter list that follows as the hypotheses.

## N03 — In the route of 4.17a the top window is cited as §2.3 of ThetaChainsOnDefiniteUnitaryGroups; it is in §2.3b

## Previous findings

The previous review, of `2ac59b9`, had no finding. Of its remarks: its C01 (two Origin labels without locators) is partly repaired: 4.12 now reads "restated, for even-dimensional quadratic spaces, as Kudla (1996), Chapter VI, Proposition 3.2", and 4.9b is unchanged (C01 above). Its N01, N02 and N03 are unchanged and are written again above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.9a Origin: Bannai–Kobayashi Cor. 2.16 | hypotheses at the locator | `BannaiKobayashi2010` line 1331: `p ≥ 5` split in `𝒪_K`, torsion translates of order prime to `p`; (i) `θ̂` unit series, (ii) `Θ̂` integral. README: "ordinary primes", "torsion translates" | agree | none |
| 4.9a Origin: Bannai–Kobayashi §4 | curve, prime, radius | lines 2339–2357: `y² = 4x³ − 4x`, `p = 7`, denominators of `ĉ_{m,n}` grow with slope `p/(p²−1)`; lines 2369–2372: radius exactly `p^{−p/(p²−1)}`, proof deferred to a later paper | agree ("announces, without proof") | none |
| 4.9a (i) second part vs `CM3` | definitions unfolded | `uSer = X·wpNum/wpDen = z·z²℘/(−z³℘′/2) = −2℘/℘′`; `ltLog = Σ T^{l^{2j}}/l^j = ℓ`; `ε` of norm 1 in the completed maximal unramified extension; `5 ≤ l`, `l ∤ d`, `−d` a non-square mod `l` (inert); all coefficients of norm `≤ 1` | agrees with the changed sentence | none |
| 4.9a (i) linear term | `t = z + O(z⁵)`, `ℓ = T + …` | README: linear term `T`; computed: `c·T`; `CM3`: no condition | slip in untouched text | C02 |
| 4.9a "without Artin reciprocity" | hypotheses of the proofs | `cm3 : CM3` has no hypothesis; `cmGoodModel_of_globalArtinReciprocity (hA : GlobalArtinReciprocity) : CM2`; the consumer `GenusOneDatumExistence` calls `cm2` then `cm3` on the model obtained | as the README says | none |
| 4.12 Origin: Kudla VI, Prop. 3.2 | chapter, hypothesis, attribution | `Kudla96` line 3486: VI.3 restricted to even-dimensional quadratic spaces; line 3582: proved by Rallis, ref. [59] = Amer. J. Math. 104 (1982) (line 4122); line 3583: `θ(τ(μ), W_n) = π(θ(μ))`, explicit unramified matching | agree | none |

The rows for untouched statements stand as in the previous review, of `2ac59b9`.

- Source locators checked against the text: 3 (Bannai–Kobayashi Corollary 2.16 and section 4; Kudla Chapter VI, Proposition 3.2), and the title and journal of Rallis (1982) against Kudla's bibliography.
- Declarations of [FormalProof] opened: 6 (`CM2`, `CM3`, `IsGoodModel`, `cm3`, `cmGoodModel_of_globalArtinReciprocity`, `kernels_integral_inert`); the four cited files exist at the cited commit `40e56ba` and do not differ from the copy read; each name is in the namespace the README gives.
- Seeded sample: of its targets only 4.12 lies in a changed passage (the Origin label), checked above; the others are untouched.
- Cross-roadmap citations: the change adds none; the `*Needs:*` line of 4.9a is unchanged.
- Record against the merge base: no layer, heading, Check or worked example removed or renumbered by the change.
- Files changed outside the folder: all lie in folders the pull request owns (the family and AnabelianGeometryAndNonabelianChabauty).
- Dependency check: `depcheck: 121 roadmaps, 1396 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Lean: `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no signature to compare and no one-tactic probe to run. Automatic checks: all pass.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality; nothing shared. The change adds no object.

The pull request's title and description: no sentence is contradicted by this head; the description's statement that the family's attributions were checked against the Lean source and the papers covers this change.

Source independence: changed passages only; 3 passages compared with 2 sources (`BannaiKobayashi2010`, `Kudla96`), none shared; largest share [FormalProof], all but a handful of the locators; the change adds, removes and reorders no layer, so the arrangement was not compared.

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its Origin labels set it beside Rallis (1982), Mínguez (2008), Finis (2006), Bannai–Kobayashi (2010) and Tange (2012). Basis: the README's References and labels; Tange, Mínguez, Bannai–Kobayashi and Kudla read.

## Not verifiable

- Rallis (1982) itself was not read: its result is checked through Kudla's restatement and attribution only.
- Mumford (1969), Finis (2006) and Knapp (2002): not read, as in the previous review.
- That `cm3` and its dependencies compile was not checked; the statements and the hypotheses of the proofs were read.

Automatic checks set aside as false positives: the citation finder lists the formal-proof declaration names as Lean names found nowhere; they are locators into [FormalProof]. The signature listing reads the word "sets" of the module docstring as a declaration; the file declares nothing and elaborates cleanly.

## Source issues

- none

## For the human reviewers

- Scope: the roadmap rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; its labels mark 31 of its 35 non-definition sections "particular to this proof" and 4 "adapted from" published work.
- Licence: the README cites file paths and declaration names of [FormalProof] and no text of it; the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) says the proof belongs to its author and was published without a licence.
- The price of 4.9e (b), `DepthBound` of 4.15 and the exponent of 4.14f′ (iii) are the formal proof's forms, each weaker than the statement on `main`, which stays as a remark; the description says so.
- The two recorded decisions of the human reviewers do not apply to this folder: it loses no section and none moves to another roadmap.
