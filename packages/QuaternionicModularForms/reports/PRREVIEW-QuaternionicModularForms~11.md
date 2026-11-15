# Review of QuaternionicModularForms (pull request #934 at e40ec42)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since e40ec42. The folder is unchanged and stands as accepted there; every finding below is about the pull request's description, which no longer describes this head. All are P3 and are repaired by editing the description only.

## R01 (P3) — The description says `Suggested.lean` has proved declarations; it declares nothing

**Location:** description, "Section 5.3 …" block, last paragraph: "`Suggested.lean` gives representative interfaces against native Mathlib and Tau Ceti carriers, including a proved comparison between the native quaternion norm form and Hamilton norm, and proved integer estimates for the weighted Mahler matrix."

**Claim:** The head's `Suggested.lean` has no interface, no proved comparison and no Mahler estimate.

**Witness:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:7`–`8`: "No headline theorem is statable at the pins, so this file declares nothing"; lines 46–48 are an empty namespace.

**Repair:** Replace the sentence with: "The README is definitive. `Suggested.lean` declares nothing: no headline theorem is statable at the pins, and its module docstring names each headline with the carrier it lacks (the analytic weight action on the Tate algebra, Fredholm determinants on (Pr) modules, adelic automorphic forms and cuspidal cohomology)."

## R02 (P3) — The Checks section reports 16 admitted targets and Lean proofs that the head does not have

**Location:** description, "Checks": "Its only warnings are 16 intentionally admitted theorem targets"; "the existing Lean interfaces already separate general adelic/evaluation definitions from the definite stabiliser theorem"; "proves the elementary exponent inequalities in Lean".

**Claim:** The build of this head has no warning, no admitted target, no Lean interface and no Lean proof.

**Witness:** `lake env lean TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` at e40ec42: exit 0, empty output. The file has no `theorem`, `def` or `sorry`. The exponent inequality is prose in `README.md` §4.4 (`w(n)−w(m)+max(m−⌊n/p⌋,0) ≥ ⌈m/2⌉`).

**Repair:** First bullet: "`lake build TauCetiRoadmap.QuaternionicModularForms.Suggested` passes against Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c` with no warning; the file declares nothing." Third bullet: delete "The current revision changes only … stabiliser theorem." Fourth bullet: replace "proves the elementary exponent inequalities in Lean" by "states the elementary exponent inequalities in §4.4".

## R03 (P3) — The description has AdelicAlgebraicGroups consuming this roadmap's class sets; at the head the supply runs the other way only

**Location:** description, "Boundaries and dependencies": "its quaternionic application AA.5.3 consumes this roadmap's §0.3 class-set and stabiliser interfaces. Section 0.3 compares with FLT's central division-algebra finiteness theorem … Its numerical Hurwitz check still cites our former §0.5". Also the Layer 0 bullet ("finite class sets under the central division-algebra hypothesis, stabilisers modulo central scalars") and "External coordination" ("its quaternionic application consumes this roadmap's class-set theorem"; "no single supplier-first order").

**Claim:** At the head this roadmap owns neither class-set finiteness nor the stabiliser theorem, §0.3 does not mention FLT or a division-algebra hypothesis, and AdelicAlgebraicGroups on main cites nothing here.

**Witness:** `README.md` §0.3: "`Cl(U)` … finite with representatives and factorisations by AdelicAlgebraicGroups §5.3 … for every quaternion algebra". AdelicAlgebraicGroups on main (3cf7342), `README.md:5599`–`5680`: §5.3 owns *quaternion-class-sets* and *definite-quaternion-stabilizers*; the string `QuaternionicModularForms` occurs nowhere in it.

**Repair:** Layer 0 bullet: "arithmetic quaternion data, the structure of `GL_1(D)`, integral local splittings and levels over any number field, the fibres of class-set refinement in group-theoretic form, and double-coset certificates; class-set finiteness and the definite stabiliser theorem are consumed from AdelicAlgebraicGroups §5.3." Boundaries bullet: "**AdelicAlgebraicGroups** (on main) owns the adelic points of `GL_1(D)`, the reduced-norm images (§4.6), class-set finiteness for every quaternion algebra and stabiliser finiteness modulo the centre for totally definite `D` (§5.3). This roadmap consumes them and supplies nothing to it." Delete the two sentences of "External coordination" about #792 and the paragraph "The adic/distributions roadmaps, and #792 … listed below."

## R04 (P3) — The merge-order prose lists merged roadmaps as open suppliers and omits the open ones

**Location:** description, "Merge order": "Recommended supplier-first merge order for the six roadmap PRs in this series … **This PR is stage 5: after #919, #926, #930 and #932.**"; "Boundaries and dependencies": "This PR has mathematical suppliers in open roadmap PRs", followed by bullets for #919, #930, #932, #926, #792, #817.

**Claim:** Every supplier that prose names as open is on main; the suppliers still open are not named as such, and two suppliers of the README are not named at all.

**Witness:** On main (3cf7342): `TauCetiRoadmap/{RestrictedPowerSeries,NewtonPolygons,PadicFunctionalAnalysis,CompactOperators,RigidAnalyticGeometry,AdelicAlgebraicGroups,AdicSpacesPartII,ReductiveGroups}`. `README.md:197`–`248`: contracts from ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups, KleinianGroups (not on main) and ReductiveGroups Layer 6.

**Repair:** Replace the "Merge order" prose (down to "External coordination") with: "RestrictedPowerSeries, NewtonPolygons, PadicFunctionalAnalysis, CompactOperators, AdelicAlgebraicGroups, AdicSpacesPartII and ReductiveGroups are on main. Three suppliers are still open and merge first: ArithmeticLocallySymmetricSpaces (automorphic forms, local systems, cuspidal cohomology; §§2.4–2.6), AutomorphicFormsOnReductiveGroups (§7.4 level-form carrier and Hecke action, §§7.5–7.6; all of Layers 2–3) and KleinianGroups (`H^3` and the Bianchi groups; §2.6)." In "Boundaries and dependencies", drop the pull-request numbers of the merged suppliers and add ReductiveGroups Layer 6 (reductivity of `GL_1(D)`, §0.1).

## R05 (P3) — The description states theta, the determinant identity and classicality over `ℚ` only

**Location:** description, "Scope and conventions", Layers 4–5: "followed by theta operators and small-slope classicality over `ℚ` with explicit normalisations"; and the paragraph "Section 5.3 states the block-triangular Fredholm identity explicitly: … `H_V(T)=H_κ′(p^r T)`".

**Claim:** At the head Layer 5 is over totally real fields with partial theta maps; the `ℚ` statements are its special case.

**Witness:** `README.md:259`–`260`: "the partial determinant identity and small-slope classicality over totally real fields, with Buzzard's factorisation over `ℚ`"; §5.3: `H_κ(T) = H_{W_τ}(T) · H_{κ′_τ}(τ(π_v)^{r_τ} T)`, cutoff `v_p(μ_v)<min_τ r_τ/e_v`.

**Repair:** Layers 4–5 bullet: "… followed by Bol's identity, partial theta maps `Θ_τ` and small-slope classicality for totally definite algebras over totally real fields (cutoff `min_τ r_τ/e_v`; over `ℚ`, `k+1`)." Section 5.3 paragraph: "for the closed `U_P`-stable `W_τ=ker Θ_τ` with bounded complement `N_τ` and `U_P=((U_P|W_τ,B),(0,V))`, it gives `H_κ=H_{W_τ}·H_V` and `H_V(T)=H_{κ′_τ}(τ(π_v)^{r_τ}T)`; over `ℚ` this is `H_κ=det(1−TU_p|M_cl)·H_κ′(p^rT)`."

## Previous findings

- none: the review of e40ec42 raised no finding (its one carried finding, on §3.1/§3.2, was recorded there as repaired, and the folder has not changed since).

## Verified sound

| Statement the description cites | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §5.3 block factor `H_κ=det(1−TU_cl)·H_V` (description and README) | `U=((a,b),(0,v))` on a rank-2 module | `det(1−TU)=(1−aT)(1−vT)−0·(−bT)=(1−aT)(1−vT)`; `b` drops out, so `N` need not be invariant | Pass |
| §5.3 diagonal intertwining `H_V(T)=H_κ′(cT)` without inverting the diagonal | `ΘV=cU′Θ`, `Θ=diag(d_i)`, `d_i≠0`, a finite principal minor on indices `I` | `V_{ij}=c·d_i⁻¹U′_{ij}d_j` entrywise; each cycle product over `I` has the `d`'s cancel, so the minors of `V` and `cU′` agree | Pass |
| §5.3 over `ℚ`, `k=0`, one class | `M_cl` the constants, `U_p` the coset count | `U_p|M_cl=p`; `H_κ(T)=(1−pT)·H_κ′(pT)`; slope of constants `1=r`, the boundary the strict cutoff excludes | Pass |
| §0.2 `c(η_p)=π_p/p` (description, Checks) | `η_p=diag(π_p,1)` over `ℚ` | `|nrd η_p|_f=|π_p|_p=p⁻¹`, `det=π_p`, so `c=π_p·p⁻¹`; `1` iff `π_p=p` | Pass |

The rows for all other statements stand as in the previous review, of e40ec42.

- Description sentences checked against the head and found to agree: the title (the roadmap is not on main; 1548 lines added, 3 files); the summary block's first two paragraphs (scope by field and algebra, the `ℚ`-only annular model, the consumers named under Downstream consumers); the Layers 1–2 and Layer 3 bullets; "Compact levels need not be open for the stabiliser theorem"; §§2.4–2.6 through ALS.F.6 and AutomorphicFormsOnReductiveGroups §§7.4–7.6; the pins `a91d3aaf` and `6b7abb3c` (`lake-manifest.json`); `c(η_p)=π_p/p` (`README.md:338`); the secondary provenance section with a fixed commit (`README.md`, "Existing Lean work"); topic `math.NT` (`metadata.toml`).
- Library and supplier files opened: AdelicAlgebraicGroups on main, `README.md:5599`–`5680` (§5.3); `lake-manifest.json` lines 8 and 18.
- Gate at e40ec42 (`--base origin/main`): every check `0`, `OK`; the worker's gate records `build=0`.
- `lake env lean TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`: exit 0, no output. The file has no declaration, so there is no signature to `#check` and nothing to probe for padding.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The merge order lists QuaternionicModularForms directly after AutomorphicFormsOnReductiveGroups.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Overlap check: no folder change since e40ec42, so the audit of the last full review stands; this round read AdelicAlgebraicGroups §5.3 on main, the owner of class-set finiteness and the definite stabiliser theorem, which this roadmap cites; nothing shared. The overlaps report lists no dropped id, no conflicting head and no second copy.
- Source independence: changed passages only; 0 passages changed, so none compared this round; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "labelled `awaiting-dependencies`" (description): the pull request's labels are not in the material this review reads.
- The description's claims about #931 and #928 consuming §§1.3, 2.1, 2.2 and 3.1 were not re-resolved at those heads this round; the README's Downstream consumers section lists GL2AutomorphicRepresentationsAndTransfer R17.3 with §§0.2–0.4, 1.3, 2.1–2.2 and 3.1.
- The summary block's phrase "Tau Ceti's adelic class sets and functional analysis" was not checked against the pinned library; the README takes both from the roadmaps AdelicAlgebraicGroups §5.3 and PadicFunctionalAnalysis.
- Gross (1999) and Harder (1987), §3: paywalled, cited by locator only, unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md`, "Existing Lean work", links the repository WilliamCoram/PhD at commit `eefb3d9` as a secondary implementation reference; its licence was not read. `Suggested.lean` declares nothing, so no Lean is adapted from it.
