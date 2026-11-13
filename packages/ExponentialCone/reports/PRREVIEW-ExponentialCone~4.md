# Review of ExponentialCone (pull request #2293 at a3dce72)

**Verdict:** accepted

No finding at this head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ExponentialCone/README.md:76` “## How to read the build” now follows the supplier contracts and precedes Layer 1; lines 78–85 name what each of Layers 1–4 delivers and uses.

## Verified sound

The diff changes no statement. Rows cover the statements the rewritten paragraph (README:78–85) cites and the Layer 1 Examples left after the deletion.

| Statement | Instances tried | Left/construction values | Right/criterion values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §1.1 Checks (now the only copy of the deleted examples) | `(1,1,0)`, `(0,1,0)`, `(0,0,0)` | Scales `1,1,0`; bounds `1·exp 0=1`, `1`, — | `1≤1`; `1≤0` false; `0<0` false | In, out, out; nothing lost by deleting README examples | — |
| Layer 1 Examples, density witness (kept) | `(2+δ,δ,-1)` at `δ=1`, `δ=1/10` | `exp(-1)≈0.368`; `0.1·exp(-10)≈4.5e-6` | `≤3`; `≤2.1` | In `positive`; limit `(2,0,-1)` has `0≤2`, `-1≤0` | — |
| `halfspace_iff` on Layer 1 Examples (kept) | `(1,0,1)`, `a=log 2`; midpoint `(3/2,1/2,-1/2)` | `2·(1+0)=2`; `(1/2)·exp(-1)≈0.184` | `2≤1` false; `0.184≤3/2` | Excluded; member | — |
| “Layer 3 aggregates the Layer 2 exponential section”: `weighted_exponential_iff` | `d=(2,0),s=(log 3,0)`, `L=6` and `L=5`; `n=0,L=-1` | `2·3+0=6≤6`; `6≤5` false; `0≤-1` false | `u=(3,1)`: sum `6`, sections `3≤3`, `1≤1`; `u₁≥3` forces `6≤5`; `0≤-1` false | Sides agree; uses only §2.1 at scale 1 | — |
| “Layer 4 uses Layers 1 and 3 for … process rows”: §4.1 scalar identity, `weighted_process_iff` | `t=2,x=2 log 2,u=1`; `n=1,d=3,L=3` | Height `2·2=4`, bound `2·exp(log 2)=4`; `3·(2-1)=3≤3` | `2-1≤1`; `u=1`: `3≤3`, `4≤4` | Agree; inputs are §1.2 at `v>0` and the §3.1 sum step | — |
| “Layer 2 for exponential coefficients”: `random_exponential_cone_iff` | `a=2,s=log 3`, `R=6` and `R=0` | `2·3=6≤6`; `6≤0` false | `v=3`: `6≤6`, `3≤3`; `v≥3` and `2v≤0` incompatible | Agree; input is §2.1 only | — |

The rows for statements this change leaves untouched stand as in the previous review, of `58022ac`.

- README:78–85 against the layers' own `*Needs:*` and `### Dependencies` lines (README:106, 127, 194, 232, 294, 321, 334, 351, 382–384): 9 lines read, 0 contradictions; no layer is said to use a later one.
- Layer 1 `### Examples` after the deletion: 2 bullets remain (README:171–175); the 3 deleted bullets are word-for-word covered by the §1.1 Checks at README:102–104.
- Source locators: the change adds, alters and removes none; the seeded sample has no locator inside the changed passages.
- Elaboration of `Suggested.lean` (unchanged since `58022ac`): exit 0, exactly nine `sorry` warnings (lines 39, 45, 51, 62, 67, 72, 79, 88, 96), no other diagnostic.
- Gate at this head: every check passes (`depcheck=0`, `stray-files=0`, `outside-folder=0`, worker's `build=0`); 0 files changed outside the folder.
- Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines; 0 roadmap suppliers.
- Pull request text against this head: head hash `a3dce72`, “changes README dependency guidance and removes duplicated examples only”, 9 targets, three definitions, one abbreviation and “no supplier roadmap” all agree with the diff; 23 headings and 13 declarations as computed, none removed or renumbered.
- Cross-roadmap citations: the change adds none; `scratch/overlaps.md` lists no dropped id, no other pull request changing this folder and no second copy.

Overlap check: read BoundedConicHulls, ConvexLifting, FiniteAffineBoundTightening, ExactPenalties (open; scopes as read in the previous review, lists unchanged), main-vocabulary list empty; nothing shared.

Source independence: changed passages only; 1 passage (README:78–85) compared with 1 source (MOSEK Cookbook 3.4.0, chapter opening and §5.1 opening, headings §5.1–§5.4), none shared; largest share `bernal-thesis`, 11 of 35 locators as counted earlier, its original text and contents unreadable; the change adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- `bernal-thesis`, original May 2021 Chapter 8, pp. 282, 286, 300, 316, 318, 320: that edition was not located by the earlier reviews; not re-attempted, since no changed passage alters a locator into it.
- `bernal-grossmann`, published Table 1, (9), (10), (12), Appendix (A9), (A16)–(A17): publisher text is paywalled; arXiv v3 cannot certify the published pagination.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean:62,67` match names, binders and statements of `complete-retained-library`, commit `59c355e`, `lean-modern/Chapter08ExponentialRows.lean` (as compared in an earlier review). Apache-2.0 adaptation is acknowledged at `Suggested.lean:13–16`; assess the attribution.
- Not tested: original `bernal-thesis` has the largest locator share; its wording and contents were unavailable. The accessible corrected edition is dated November 2026 and carries an all-rights-reserved notice.
