# Review of MotivesAndAlgebraicCycles (pull request #1313 at 2fbac06)

**Verdict:** accepted

Incremental re-review of the 9 lines changed since 6be1873 (5 insertions, 4 deletions, all in `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`): the functoriality paragraph of §7.1a (line 1313), its curve Check (line 1320), the new line-in-`ℙ²` Check (line 1323), the Layer 7 Dependencies sentence (line 1709) and the Arapura–Kang reference (line 1748). `Suggested.lean` and `metadata.toml` are unchanged; nothing outside the folder changed. No finding.

## Previous findings

- R01 — repaired: “For every `f`, prove `f^*Ñ^pH^i(Y,ℚ)⊆Ñ^pH^i(X,ℚ)` … If the Gysin description of the next paragraph holds for the target `Y` of `f`, deduce `f^*N^pH^i(Y,ℚ)⊆N^pH^i(X,ℚ)`”; cup product and Corollary 1.2 added.
- R02 — repaired: “`L¹H¹=0`, although `F¹H¹=H^{1,0}` is nonzero as soon as a component has positive genus (on `ℙ¹` both are zero)”.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `f^*Ñ^p(Y)⊆Ñ^p(X)` for every `f` (line 1313) | `g:Z→Y`, `dim Z=m-r`, `dim X=n`, `dim Y=m` | composite cycle in `Z×Y×X`: `2(m-r+n)-(2m-r+n)=n-r`; component `W` resolved by `W̃`: action `(pr_X)_*(pr_Z)^*`, codimension `n-(n-r)=r≥p` | holds; for `r>n` the composite is zero |
| same, degrees and twists | class in `H^{i-2r}(Z)(-r)` | `(pr_Z)^*` keeps degree `i-2r`; Gysin from `W̃` of codimension `r` lands in `H^i(X)` | holds |
| `Ñ^p∪Ñ^q⊆Ñ^{p+q}` on `X` | exterior product, then `Δ:X→X×X` | `Ñ^p⊗Ñ^q⊆Ñ^{p+q}(X×X)`; `Δ^*Ñ^{p+q}(X×X)⊆Ñ^{p+q}(X)` by the previous row | holds, unconditionally |
| `f^*N^p(Y)⊆N^p(X)` under the Gysin description for `Y` | hypothesis for `Y` only | `N^p(Y)=Ñ^p(Y)`; `f^*Ñ^p(Y)⊆Ñ^p(X)⊆N^p(X)`; nothing asked of `X` | holds; agrees with ArapuraKang lines 57–58 |
| `N^p∪N^q⊆N^{p+q}` under the Gysin description for `X` | hypothesis for `X` only, not `X×X` | `N^p(X)=Ñ^p(X)`, `N^q(X)=Ñ^q(X)`; `Ñ^p∪Ñ^q⊆Ñ^{p+q}(X)⊆N^{p+q}(X)` | holds; agrees with ArapuraKang lines 60–63 |
| Curve Check (line 1320) | genus 0, genus 1, two components of genus 0 and 2 | `dim F¹H¹` = sum of genera: `0`, `1`, `2`; `L¹H¹=N¹H¹=0` in all three | holds |
| Line-in-`ℙ²` Check (line 1323) | `f=g:L→ℙ²`, `r=1`, `n=1`, `m=2` | `deg f^*h=L·L=1`; `f^{-1}(L)=L`, codimension `0`; composite: diagonal of `L×L` with excess `c₁(N)`, zero-cycle of degree `1`, dimension `n-r=0` | holds; `L¹H²=H²` on both, same inclusion |
| Dependencies sentence (line 1709) | uses of the Gysin hypothesis in §7.1a | general inclusion `N^p⊆L^p`; pullback for `N^p` (for `Y`); cup product for `N^p` (for `X`); none for `Ñ^p` | agrees with line 1313 |

The rows of the previous review for untouched statements stand as in the previous review, of `6be1873`. None of the seeded sample targets falls in the changed passages.

- Source locators checked against the text: 4. ArapuraKang Theorem 1.1(1)–(3) on p.2 (lines 50–58), Corollary 1.2 on p.2 (lines 60–63), the proof of parts (1)–(2) on p.2 (lines 66–75), the flat case on pp.3–4 (lines 134–149).
- Sections the new route cites, opened at this head: §0.1 (composition, degree `r+s`, compatibility of actions with composition), §0.2 (graph and transpose with their two actions), §2.3 (all-degree composition and graph identities for a Weil theory), ResolutionOfSingularitiesCharacteristicZero §5.2 (already a supplier of the same section). No new supplier, no new cross-roadmap citation.
- Remark, no change asked: at line 1313 the action of a resolved component is the Gysin map from `W̃` composed with pullback from `Z`; the inclusion stated follows as written.
- Gate at 2fbac06: every counter zero, `OK`. Dependency check: `depcheck: 240 roadmaps, 2180 edges, 0 problem(s)`, no UPWARD or CYCLE line. Elaboration of `Suggested.lean`: four `sorry` warnings (lines 88, 102, 118, 141), nothing else; the file is unchanged, so the `#check` comparison and the padding probe of the earlier reviews stand.
- Headlines: the change adds inclusions on Betti cohomology with supports, which has no carrier at the pins; the Layer 7 bullet of the module docstring already names the cycle-conjecture implications as not statable. No statable headline is missing.
- Overlap check: read MotivicEtaleKTheory, SchemeKTheoryOperations and EtaleCohomologyFoundations for the coniveau filtration on Betti cohomology and its functoriality; `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy; nothing shared.
- Pull request text: no sentence of the title or description is contradicted by this head; the change adds or removes no section, declaration or supplier. Remark, no change asked: the summary's list of formulated conjectures does not name the Hodge and generalized Hodge predicates.
- Source independence: changed passages only; 4 passages compared with 1 source (ArapuraKang), none shared beyond formulas, and the route for arbitrary `f` (composition of correspondences) is not the source's (graph factorization and hyperplane sections, lines 319–335); no layer was added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- **Grothendieck 1969** (§7.1a, pp.299–303): settled as uncertified; outside the changed passages; carried from the previous report.
- **KunnemannPicard** (§7.17): unchanged and outside the changed passages; carried from the previous report.

## Source issues

- **Misprint** in ArapuraKang at §1, p.1 of arXiv v1: the source says the Gysin description is Proposition 8.2.8 of Deligne's paper; it should be Corollaire 8.2.8; affects nothing.
- **Misprint** in ArapuraKang at the proof of Theorem 1.1(2), p.2 of arXiv v1: the source says the second class lies in the coniveau of the cohomology of `X`; it should be of `Y`; affects nothing.
- **Misprint** in ArapuraKang at §3, p.8 of arXiv v1: the source says the class may be assumed outside the next coniveau step of the cohomology of `X`; it should be of `Y`; affects nothing.

## For the human reviewers

- none
