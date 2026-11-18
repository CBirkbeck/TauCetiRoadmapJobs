# Review of PotentialAutomorphyInfrastructure (pull request #1081 at 584324b)

**Verdict:** accepted

**Summary.** Accepted: the 34 lines changed since the last review repair all five of its small corrections, each repair agrees with the supplier sections it now cites (IgusaVarietiesAndTorsionConcentration IG.0.3–IG.0.4, IG.6.6a–IG.6.6b, IG.7.6, IG.7.14–IG.7.15, read at that roadmap's open head), and no repair introduced a new problem. The title and description agree with this head. There are no findings and no small corrections; two format notes are carried over, neither blocking. The two points for the human reviewers stand as before: archived author copies of two sources, and a supplier that is still a draft pull request.

## N01 — About 140 target names in code font are declared nowhere

The description now says that the README's code-font target names are proposed names; the README itself does not, so a reader of the folder alone who searches for `siegel_coefficient_retract` or `ordinary_local_global` still cannot tell a proposed name from a declaration. One sentence in Conventions would settle it.

## N02 — Koshikawa and Caraiani–Newton are named in the text but have no entry in References

§1.0 (line 428) and the supplier table (line 2251) name "Koshikawa's global vanishing" and "the Caraiani–Newton middle-degree export"; the locators of §§0.13 and 1.0 now point to IG.7.14–IG.7.15 for the stronger statement, which helps, but the two works still have no entry. Either add them to References or say once that they are cited as in IgusaVarietiesAndTorsionConcentration IG.7.14–IG.7.15.

## Previous findings

The review of `5b0a4d9` was an acceptance with no finding (no R-numbered point). Its small corrections and format notes, at this head:

- C01 — repaired: §§0.7a, 0.7b and the supplier rows now say "IG.0.4's restriction isomorphism from its operator algebra to the unitary algebra", "IG.6.6b's residual representation of the lower unitary Levi factors", "the image compactification of §2.1"; none of the sixteen names remains.
- C02 — repaired: "Use Mathlib and Tau Ceti at the commits pinned by the repository's lake manifest."
- C03 — repaired: "(strictly, for every `n ≥ 1`)" in §3.19, its third Check and the route of §3.20; the Check gives the witness `diag(1,ϖ_ṽ)` at `n=1`.
- C04 — repaired: the description reads "The README's code-font target names are proposed names; `Suggested.lean` declares none of them."
- C05 — repaired: §§0.13 and 1.0 read "`f=[F⁺:ℚ]`" and "semisimple residual representation, of any length"; the locators say the two sources "also assume `f>1` and length at most two"; §3.41a states both hypotheses itself.
- N01 — not repaired in the README (repaired in the description): written again above.
- N02 — partly repaired: written again above.
- N03 — not taken up (a suggested clause on the pinned Weyl construction); not raised again.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.13 (changed: no `f>1`, any length) | `f=1, n=1`, trivial coefficients; three constituents | `d=1`; the `H⁰` eigensystem has Frobenius ratio `l` at split `l`, so `α_i=lα_j`: not generic, `H⁰_𝔪̃=0` as claimed; IG.7.14 states no bound on `f` or length | holds |
| §0.13 compact support | dual ideal at split `l` | eigenvalues `l^{2n−1}α_i⁻¹`; ratios are inverted, so `α_i≠lα_j` for all `i≠j` is preserved; no length used | holds |
| §1.0 (changed) | long exact sequences, `f=1` allowed | `H^{d−1}(V/ϖ)=0 ⇒ H^d(V)[ϖ]=0`; `H^d → H^d_∂ → H_c^{d+1}=0`; IG.7.6 (2)–(3) and IG.7.15 state the same maps, IG.7.15 "for `F⁺=ℚ`" | holds |
| §3.19 monoids (changed) | `n=1`, `t=(1,ϖ)`; `n=2`, `t=(1,1,ϖ,ϖ)` | `n=1`: `N` entry scaled by `t₁/t₂=ϖ⁻¹`, not contracting; `N₁=1` so `T₁⁺=T₁`. `n=2`: each block scalar, in `T₂⁺×T₂⁺`; Siegel entries scaled by `ϖ⁻¹` | strict for every `n≥1` |
| §3.20 route (changed clause) | relation `Ũ_{vᶜ,i}=Ũ_{v,2n−i}Ũ_{v,2n}⁻¹` | `i<n`, `i=n`, `i>n` give `U_{v,n−i}U_{v,n}⁻¹`, `U_{v,n}⁻¹`, `U_{vᶜ,i−n}U_{v,n}⁻¹` on both sides | holds |
| §3.41a (changed: hypotheses now explicit) | `H̃=0`; `f>1`, length ≤ 2 stated in the target | zero module: `Ã_ord=0`, empty product; statement no wider than before the change | holds |
| §0.7a twist (cited by changed text) | general `a, j`; `a=1`; `a=2` | `j(j−2a+1)/2 + j(a−1) = j(j−1)/2`; `a=1`: twist trivial, `1, −U₁, qU₂`; `a=2`: `j(j−3)/2 + j` | holds; equals IG.6.6b |
| §0.7b polynomials (cited by changed text) | `m=1,q=3,U=2`; `m=2,q=2,U=(3,5)` | `1−6X` ↔ `Y−2`; `1−6X+40X²` ↔ `Y²−3Y+10` | holds; equals IG.6.6a's Checks |
| IG.0.4 restriction (cited by changed text) | `U_q·U_q⁻¹=1` in the full algebra | restriction sends both factors to `0` and `1` to `1`: not multiplicative on the full algebra; isomorphism only on the operator algebra, as §0.7a says | holds |

The rows for the untouched statements stand as in the previous review, of `5b0a4d9`.

- Changed passages checked: all 17 changed lines (§§0.7a, 0.7b, 0.13, 1.0, 3.19, 3.20, 3.41a, the pins sentence and three supplier rows), and every other occurrence in the README of `[F⁺:ℚ]>1`, "length at most two" and the two target names of §§0.13 and 1.0 (lines 514, 522, 1543, 1598 keep their own `[F⁺:ℚ]>1`).
- Cross-roadmap citations resolved at the suppliers' open heads: IgusaVarietiesAndTorsionConcentration 0.3, 0.4, 5.1, 6.6a, 6.6b, 7.4, 7.6, 7.14, 7.15 (read in full); HodgeTateAndCanonicalSubgroups 2.1–2.3, 2.12, 3.4–3.8 and PerfectoidShimuraVarieties 2.1 (headings and, for 2.1, the finite map from the minimal compactification); the eight TorsionCohomologyInfrastructure names kept in the rows each occur in that README. No other roadmap, open or on main, cites the two changed target names.
- Seeded sample: none of the fifteen sampled targets lies in a changed passage; they stand as verified in the previous review.
- Headline theorems: unchanged; none is statable at the pins and the module docstring names the missing carriers by layer. `Suggested.lean` declares nothing, so there is no one-tactic probe and no signature comparison to run.
- Automatic checks: all passed at this head. `lake env lean` on `TauCetiRoadmap/PotentialAutomorphyInfrastructure/Suggested.lean`: exit 0, no output. Dependency check, verbatim: `depcheck: 200 roadmaps, 2209 edges, 0 problem(s)`. No file outside the folder differs from the merge base.
- Title and description against the head: the folder is added (three files, 2384 lines, no heading or declaration removed), as the description says; "`Suggested.lean` declares nothing", the two named lifting targets, the consumers named in the summary block and "neither lifting theorem assumes a polarization" (line 2168) all agree with the head; nothing the head contradicts and no removal left unstated.
- Overlap check: read CrystallineLocalGlobalCompatibilityCM, PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, AutomorphicGaloisRepresentationsPartII, ArithmeticLocallySymmetricSpaces, LocalGaloisDeformationRings (scopes as read in the review of `5b0a4d9`; the change adds, removes and moves no object); nothing shared. No open pull request changes this roadmap and no cited id is dropped.
- Source independence: changed passages only: 11 changed passages compared with the supplier sections they cite and with the hypotheses of `cs` Theorem 1.1 and `acc` Theorem 4.3.3 as recorded in the previous review, none shared (the new text is supplier citations in the roadmap's own words and two locator clauses); largest share `acc`, 123 of 167 locators; contents not compared again, since the change adds, removes and reorders no layer (previous result: independent).
- Research link: Layers 1, 3 and 5 are the local–global compatibility and automorphy lifting theorems of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne (2023); Layer 2's lemmas are those Qian (2023) and Boxer–Calegari–Gee–Newton–Thorne use for potential automorphy and Sato–Tate over CM fields. Rests on the README's Summary and References and on `acc` §6.1, `bcgnt` §6.1, `qian` §2.

## Not verifiable

- Koshikawa's Theorem 1.3 and Caraiani–Newton's Theorems 2.1.26 and 2.1.28: not opened; that §§0.13 and 1.0 hold without `[F⁺:ℚ]>1` and without a length bound was checked against IG.7.14–IG.7.15 as that roadmap states them, not against its sources.
- Caraiani–Scholze Theorem 1.1 and ACC Theorem 4.3.3 were not reopened this round; that they assume `f>1` and length at most two is taken from the previous review's reading (`cs` lines 195–203, `acc` lines 3090–3098).
- The items the previous review could not verify (the books, the works not in its sample, Qian's journal pagination) are untouched by the change and stand as listed there.

## Source issues

- none

## For the human reviewers

- Licence: References link Geraghty's 2010 manuscript and Larsen's "Maximality of Galois actions for compatible systems" through web.archive.org snapshots of the authors' former pages (`TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md`, References), not a live author page or the publisher.
- Merge order: §§0.7a, 0.7b, 0.13 and 1.0 rest on IgusaVarietiesAndTorsionConcentration, which is still an open pull request; §§0.13 and 1.0 now take from its IG.7.14–IG.7.15 a statement stronger than the two cited papers' theorems (no `[F⁺:ℚ]>1`, no length bound).
