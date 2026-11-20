# Review of TemperleyLieb (pull request #2711 at c13610b)

**Verdict:** accepted

**Summary.** Accepted: the 22 lines changed since `6459425` repair both small corrections of the previous review (the role of the square root in §3.6, the redundant idempotent completeness in §7.3), the new sentences were recomputed and are true, and no finding remains. The pull request's description was read against this head and against the change from main, and no sentence of it is contradicted. Two format notes are carried over, neither blocking. One fact about the most-cited source is left for the human reviewers.

## N01 — Three works are cited without a locator, and one of them is not cited in the text at all

Westbury is cited in §§1.2, 5.2 and 5.3 (lines 247, 889, 909) and Wenzl in §§6.1 and 6.4, without a theorem or page; Kauffman–Lins is listed in the References but no section cites it. Each would get a locator or, for Kauffman–Lins, a place in the text where it is used.

## N02 — §4.1 lists Mathlib's `StarModule` for `star (r • x) = r • star x`

Mathlib's `StarModule R A` states `star (r • a) = star r • star a` and needs a `Star R`, which a bare commutative ring does not carry (line 707). The target as written is the `R`-linearity of `star`; the *Needs:* line would name that, or say that `R` is given the trivial star.

## Previous findings

The previous review, of `6459425`, had no findings (R-numbered); its two small corrections and two format notes are accounted for here.

- C01 — repaired: "The square root is needed only to state the Kauffman braiding (§3.5) … At `q = −A²`, `B` is `−A` times this cap and `B⁻¹` is `−A⁻¹` times this cup" (§3.6, lines 637–643).
- C02 — repaired: "for a field `K`, a `K`-linear additive category with a family of objects `X_i` such that `End(X_i) ≃ₐ[K] K`" (§7.3, line 1265); the *Needs:* line and the third Check no longer mention idempotent completeness.
- N01 — not repaired: carried above as N01.
- N02 — not repaired: carried above as N02.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §3.6, `B` against the `A`-form at `q = −A²` | cap, cup, snake, circle, `e_i` | `−A·[[0,A],[−A⁻¹,0]] = [[0,−A²],[1,0]] = B`; `−A⁻¹·[[0,−A],[A⁻¹,0]] = [[0,1],[−A⁻²,0]] = B⁻¹`; circle `q+q⁻¹ = −A²−A⁻²` both | sound | none |
| §3.6, factor `(−A)^((n−m)/2)` | cap `2→0`, cup `0→2`, `c` caps and `u` cups | `(−A)¹`; `(−A)⁻¹ = −A⁻¹`; `(−A)^c(−A⁻¹)^u = (−1)^(c+u)A^(c−u) = (−A)^(c−u)`, `c−u = (n−m)/2`; `1` at `n = m` | sound | none |
| §7.3 without idempotent completeness | one `X` over `K`; zero category; kernel of a block map; idempotent on `X²` | `Hom(Xⁿ,Xᵐ) = M_(m×n)(K)`, dim `mn`; trivially abelian; kernel `⊞ X_i^(k_i)` exists by additivity; `diag(1,0)` splits through `X` | sound | none |
| §7.3, need for a field and for `End = K` | `K[ε]/(ε²)` free modules | `ε ≠ 0`, `ε² = 0`; maps killed by `ε` have entries in `(ε)`, not mono; no kernel, as the Check says | sound | none |
| §7.3, `X_i` pairwise distinct | `X_i ≅ X_j`, `i ≠ j` | would give `Hom(X_i,X_j) ≅ K ≠ 0`, excluded since `K` is a field | sound | none |

The rows for the untouched statements stand as in the previous review, of `6459425`.

- Changed passages: 2 (§3.6 lines 637–643, §7.3 lines 1264–1286), both recomputed; no layer, section number, name or `Suggested.lean` statement changed. Remaining mentions of idempotent completeness (§7.2, lines 1240–1258, and the Mathlib contract, lines 1355, 1482) belong to §§7.1–7.2 and stay correct.
- Seeded sample: none of its targets falls in a changed passage; the changed sentences carry no new source locator.
- Library declarations opened at the pin for the description: `TauCeti.CirclesCommuteAt`, `circlesCommuteAt_isMonoidal`, `circlesCommuteAt_smul_id` (`CategoryTheory/Monoidal/Scalar.lean`), `middleLoopCount_add_middleLoopCount_composeDiagram` (`Combinatorics/Brauer/WeightedAssociativity.lean`), `qIntAux` (`QuantumGroups/QuantumInteger/Chebyshev.lean`).
- Pull-request description against the head and the change from main: 67 Checks in 37 lists (counted); four theorems removed, three definitions and two examples removed, one theorem added, four kept with the same statements (compared with main's file); the layer titles unchanged; the supplier contract from PivotalSpherical present; the two bullets on §3.6 and §7.3 agree with this head (main's §7.3 did assume idempotent completeness). No sentence contradicted, no change left unstated.
- Cross-roadmap: TemperleyLiebOperatorAlgebras on main has the Layer 1 cited in §4.2; no change outside the folder.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else; the file is unchanged since `6459425`, a single `import Mathlib` and four `TauCeti.*` modules, no `set_option`. The five elaborated types agree with the README statements; no section binder is lost.

Overlap check: read TemperleyLiebOperatorAlgebras, QuantumGroups, PivotalSpherical, PresentationsOfMonoidalCategories (as in the previous review; the change touches no owned object); nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 2 passages compared with 2 sources (tingley-minus-sign for §3.6, chen-tl-categories for §7.3), none shared; the added sentences are the roadmap's own computations and have no counterpart there; largest share chen-tl-categories, 22 of about 49 locators; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 6–7 state Goodman–Wenzl's unique-tensor-ideal theorem (2003, appendix to Freedman's magnetic-model paper) and build the `A_n` fusion categories surveyed by Edie-Michell–Morrison (2017). Layer 5 is Ridout–Saint-Aubin's Gram determinant (2012) with Graham–Lehrer's criterion (1996). This rests on the README's references and goodman-wenzl-ideals lines 12–15.

## Not verifiable

- Graham–Lehrer, Westbury, Wenzl, Kauffman–Lins: no legal copy in the cache, as in the previous review; none is cited in a changed passage.

## Source issues

- none

## For the human reviewers

- chen-tl-categories, the source with the largest share of locators (22 of about 49), is a 2014 Australian National University honours thesis posted on arXiv. The tensor-ideal headline is located in Goodman–Wenzl, which appeared in Comm. Math. Phys.
