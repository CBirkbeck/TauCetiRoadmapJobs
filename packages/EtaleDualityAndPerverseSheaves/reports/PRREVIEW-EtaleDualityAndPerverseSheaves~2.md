# Review of EtaleDualityAndPerverseSheaves (pull request #1040 at d1318fe)

**Verdict:** needs changes

Incremental re-review of the 102 lines changed since `d1fab8f`, and of the pull request's title and description. Two P3 findings, none blocking; the gate passes.

## R01 (P3) — API bullets and Checks still carry backticked Lean names that are declared nowhere

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` throughout, e.g. line 1674 "`TauCeti.EtaleDuality.Recollement.intermediateExtension`: `j_!*` : heart…" and the Check at line 6996 "`TauCeti.EtaleDuality.identity_not_contracting`: The identity correspondence of `𝔸¹` is not contracting near `{0}`…".

**Claim:** a backticked name of the roadmap's own in an API bullet says `Suggested.lean` declares it; a Check names no Lean counterpart.

**Witness:** at this head 428 bullets open with a `TauCeti.EtaleDuality.*` or `TauCeti.GradedFrobeniusDuality.*` name, 155 of them under `**Checks.**`; `grep -c 'TauCeti.EtaleDuality' Suggested.lean` is 0. The diff since `d1fab8f` touches none of them.

**Repair:** delete the leading "`TauCeti.….name`: " from each such bullet and keep its prose (line 6996 becomes "- The identity correspondence of `𝔸¹` is not contracting near `{0}`: `I²` does not contain `I`."); keep backticks on the eleven names `Suggested.lean` declares and on pinned library declarations.

## R02 (P3) — two sentences of the description are contradicted by the head

**Location:** pull request description, Validation paragraph: "README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero" and "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** no Check is labelled; the red-team passes have not happened yet.

**Witness:** 155 Checks are labelled with a Lean name (R01; line 6996). `git log origin/main..HEAD` has ten commits titled "red-team repairs", which among other things made AutomorphicLFunctionsAndLocalFactors AL.3.10.10 a supplier of §§2.8, 5.2 and 5.3.

**Repair:** after R01 the first sentence is true as written; until then drop "Check labels" from it. Replace the second by "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team passes followed, and §§5.2–5.3 now consume the affine weight criterion, the subquotient weight bounds and normalized intersection-complex purity from AutomorphicLFunctionsAndLocalFactors AL.3.10.10 instead of proving them."

## Previous findings

- R01 — not repaired: line 6996 still reads "`TauCeti.EtaleDuality.identity_not_contracting`: The identity correspondence of `𝔸¹` is not contracting near `{0}`"; 428 such bullets remain (R01 above).
- R02 — repaired: the supplier table, §§2.8, 5.2, 5.3, the Layer 5 dependencies and the reference entry cite "AutomorphicLFunctionsAndLocalFactors AL.3.10.10 (Normalized scheme intersection-complex purity)"; slug and anchor link are gone.
- R03 — repaired: line 3200 "2.2.16, p.72", line 5391 "6.2.4 … p. 162", line 1697 "with truncation indices `−1, −2, 0` (parameters `0, −1, 1`)".

## Verified sound

| Statement (changed passage) | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §6.1 correspondences, compactification, `Fix(c)` (reworded) | `c=id` of `𝔸¹`; `c=(Fr,id)` on `𝔸¹` over `𝔽̄_q` | `X̄=ℙ¹`, `C̄=` closure of the diagonal `=ℙ¹`, `[j]` dominant open; `Fix=V(x^q−x)`, `q` reduced points | same content as Varshavsky 1.1.1–1.1.3, 8b4cb7ee lines 222–246 |
| §6.5 stabilising, contracting, `ram`, twist (reworded) | `(Frⁿ,id)` on `𝔸¹`, `Z={0}`; `id` on `𝔸¹`; `id` on `Spec k[ε]/ε²`; `c₂:y↦y³`, `c₁=id` | `(x^{qⁿ})⊂(x)²`, contracting with `n=1`; `(x)ⁿ⊄(x)^{n+1}`; `I²=0⊂I³`; `ram(c₂,0)=3`, twist stabilises iff `qⁿ≥3`, contracts iff `d(qⁿ−3)≥3` solvable iff `qⁿ>3` | holds; bound `qⁿ>ram` sharp; agrees with Def. 2.1.1, 2.2.1–2.2.2 (lines 629–636, 692–704) |
| §6.5 local terms on the contracted subscheme (reworded) | `(Fr,id)` on `𝔸¹`, `Z={0}`, `F=Λ`; `β={0}`; `β={1}` | `β={0}⊂c′^{−1}(Z)`, `LT=1=` trace on `Λ|_Z`; `β={1}`: `c′(β)∩Z=∅`, and `β⊄Z`, so the meeting hypothesis is needed | holds; equals Thm 2.1.3 (lines 646–651) |
| §6.5 Fujiwara–Varshavsky formula (reworded) | `c=id`, `X=U=𝔸¹`, `F=Λ`; `X=𝔸¹`, `U=𝔾_m`, `F=j_!Λ` | `ram=1`, `d=1`, every `n≥1`: `Tr(Frⁿ|H²_c)=qⁿ=#𝔸¹(𝔽_{qⁿ})`; `−1+qⁿ=#𝔾_m(𝔽_{qⁿ})`; `d` is quantified before `F,n,u` | holds; equals Thm 2.3.2 (b),(c), Rem. 2.3.3 (c) (lines 749–772) |
| §2.3 (b) proof line (R03) | BBD 1.4.14: extension is `τ^F_{≤p−1}j_*` | `j_!*`: index `−1`, `p=0`; `pj_!`: `−2`, `p=−1`; `pj_*`: `0`, `p=1`; matches (c) "1.4.14 for `p=0`" | consistent (b1e10440 lines 1977–1981, 2117–2120) |
| §3.2, §5.5 locators (R03) | BBD scan, printed = PDF − 1 | 2.2.16 at line 2810, PDF page 73; 6.2.4 at line 6103, PDF page 163 | p.72 and p.162 correct |
| §§2.8, 5.2, 5.3 supplier citation (R02) | AutomorphicLFunctionsAndLocalFactors at its open head | "#### AL.3.10.10 Normalized scheme intersection-complex purity"; its Needs paragraph exports the affine criterion, subquotient bounds and exact external product over `𝔽_q`, rational `ℚ̄_ℓ`; weight `w+d` perverse, `w` normalized | resolves; contract as stated |
| Checks of §6.5 (R01) | line 6996, line 7003 | `I=(x)⊄I²`; `k[ε]/ε²`: `n=2` | Checks true; only the labels are at fault |

The rows of the review of `d1fab8f` for the untouched statements stand as written there.

- Gate rerun at d1318fe: every scanner 0, `OK`; the worker's `gate.md` adds `build=0`. `lake env lean` on `Suggested.lean`: seven `sorry` warnings, nothing else. `Suggested.lean` is unchanged since `d1fab8f`.
- Dependency check: `depcheck: 247 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Source locators checked against the text: 8 (Varshavsky-LV-2007 1.1.1–1.1.3, 2.1.1, 2.1.3, 2.2.1–2.2.2, 2.3.2, 2.3.3; BBD-1982 1.4.14, 1.4.23, 2.2.16, 6.2.4). Of the seeded sample, §2.3 and §2.8 fall in changed passages and are the rows above.
- Cross-roadmap citations resolved: 1 changed (AL.3.10.10, on fifteen lines); the reference entry's version `4ea57840` is a commit of that roadmap's branch.
- Title and description: title equals the README title; the summary block's four named statements, the consumers, the self-injective and finite-Tor ranges, the fixed-scheme and no-semisimplicity claims agree with the README; R02 lists the two sentences that do not.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, DeligneWeightsAndPurity, FourierDeligneTransform, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations as listed in the overlap facts (no pull request changes this roadmap, no cited id dropped, no closest roadmap by results); the diff adds no object, so nothing new is shared.
- Remark: the Downstream consumers paragraph names LefschetzPencilsAndVanishingCycles, which is also a supplier; that roadmap's open head does not cite this one, and the dependency check reports no cycle.
- Source independence: changed passages only; 4 passages compared with 1 source (Varshavsky-LV-2007), none shared beyond defined terms and formulas (longest common run 6 words, "is contracting near Z in a"); largest share BBD-1982, 80 bracketed citations; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- none in the changed passages.

## Source issues

- none

## For the human reviewers

- none
