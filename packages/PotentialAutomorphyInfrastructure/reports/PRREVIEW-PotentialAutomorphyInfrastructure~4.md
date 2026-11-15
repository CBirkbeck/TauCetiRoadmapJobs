# Review of PotentialAutomorphyInfrastructure (pull request #1081 at 0f3131e)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since 8ee2f17 (3 insertions, 3 deletions, all in `TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md`), and the first check of the pull request's title and description against the head. The folder's change is correct and repairs the previous finding; both findings below are in the pull request's description, not in the folder.

## R01 (P3) — the description says the Lean file states definitions and theorems; at this head it declares nothing

**Location:** pull request description, third paragraph: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim:** `Suggested.lean` contains definitions and theorems.

**Witness:** `TauCetiRoadmap/PotentialAutomorphyInfrastructure/Suggested.lean` is `import Mathlib`, the module docstring and an empty namespace (0 declarations); README line 9: "`Suggested.lean` contains no headline theorem signatures at the library pins."

**Repair:** replace the clause by: "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names the missing carriers layer by layer; every target is in the README."

## R02 (P3) — the description announces red-team passes as still to come

**Location:** pull request description, Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** no red-team pass has been made on this branch.

**Witness:** the branch carries `f2e4f4a4` "red-team repairs (reuse Frobenius recognition with inversion normalization)" and three review-repair commits (`1b9b2a00`, `8ee2f17b`, `0f3131e6`).

**Repair:** replace the sentence by: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team repairs and the repairs of the AI reviews are included in this head."

## Previous findings

- R01 — repaired: §1.1 (line 557) now reads "`w` carries every `B`-dominant weight to a Levi-dominant one iff `w⁻¹α > 0` for every positive root `α` of the Levi (ShimuraData §3.11, `kostantConeCriterion`)"; the *Needs:* line (559) and the supplier row (230, now `§§3.10–3.11`) cite §3.11. No new problem introduced.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 cone criterion (changed sentence) | `n=2`, `w=(0 1)`, `λ=ρ=(3,2,1,0)` and `α=e₀−e₁` | left: `wλ=(2,3,1,0)`, pairing `−1 < 0`, fails; right: `w⁻¹α = e₁−e₀ < 0`, fails | both sides false; holds |
| §1.1 cone criterion | `n=2`, block exchange `w=[2,3,0,1]`, `λ=(a≥b≥c≥d)` | `wλ=(c,d,a,b)`: `c≥d`, `a≥b` for every dominant `λ`; `w⁻¹` increasing on both blocks | both sides true; holds |
| §1.1 cone criterion | `n=2`, `w⁻¹=[2,0,1,3]` (not in the Levi), `λ=ρ` | `wλ` begins `(1,3)`, pairing `−2`; `w⁻¹(e₀−e₁)=e₂−e₀ < 0` | both sides false; holds |
| Previous witness `λ=0` | `w=(0 1)` | pairings `(0,0)`, but the left side is now quantified over all dominant weights and fails at `ρ` | old counterexample excluded |
| Supplier row 230 against ShimuraData §3.11 | statement at the open head | supplier: `w(X*(T)⁺) ⊆ X*(T)^{+,M}` iff `w⁻¹Φ_M⁺ ⊂ Φ⁺` iff `w ∈ ^MW`; row: the first equivalence, same direction | agrees |

Rows for the statements the diff leaves untouched stand as in the previous review, of `8ee2f17`.

- Source locators checked: 1 (`acc` lines 380–386, printed p. 906: `W^P` is the set of `w` with `w(X*(T)⁺) ⊂ X*(T)^{+,P}`, an inclusion of cones, as the changed sentence now says).
- Cross-roadmap citations resolved: ShimuraData at its open head, `### 3.10 Kostant representatives` (`kostantRepresentatives`, `kostantPositive`, `kostantIndexComparison`) and `### 3.11 Kostant cone criterion` (`kostantConeCriterion`); `roadmaps grep` finds `kostantConeCriterion` in ShimuraData and this roadmap only.
- Library declarations opened: none (the diff cites no library declaration; `Suggested.lean` is unchanged and declares nothing, so the padding probe and the `#check` comparison have nothing to run on).
- Gate at 0f3131e: every check 0, `build=0`, `OK`. `lake env lean` on `TauCetiRoadmap/PotentialAutomorphyInfrastructure/Suggested.lean`: exit 0, no output.
- Dependency check, verbatim: `depcheck: 246 roadmaps, 2267 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line); merge order: ShimuraData line 121, this roadmap line 199. No file changed outside the folder.
- Pull request text otherwise agrees with the head: the summary block's three consumers are those of `## Downstream consumers`; the owned inputs it and the prose list are §§0.4–0.7, 1.9, 2.10, 2.18, 3.2 and 5.3; the two lifting theorems are §§5.22–5.23; it presents the roadmap as new, and the folder is not on main.
- Overlap check: read CrystallineLocalGlobalCompatibilityCM, PotentialAutomorphyInfrastructurePartII (scope sections) and ShimuraData §§3.10–3.11; the Kostant cone criterion is ShimuraData's, cited here; nothing else shared by the changed passages. Remark: CrystallineLocalGlobalCompatibilityCM line 275 still cites this roadmap's Layer 1 as "kostant shuffles"; the Layer 1 section survives as §1.1, so the citation resolves.
- Source independence: 1 passage compared with 1 source (changed passages only), none shared (longest common run with `acc` lines 380–386 under 5 words, forced vocabulary); largest share `acc`, unchanged by the diff; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Nothing new. Carried from the previous report, untouched by the diff: Khare–Thorne's repository copy, Jantzen II 5.5–5.6, Platonov–Rapinchuk, Harris–Taylor VII.2.6, Arthur–Clozel Ch. 3 and the works cited as ACC cites them; Boxer–Pilloni (ShimuraData's source for §§3.10–3.11).

## Source issues

- none

## For the human reviewers

- Licence: README line 2347 links Larsen's "Maximality of Galois actions for compatible systems" through a web.archive.org snapshot of the author's former page; the host is an archive copy, not the author's live page or the publisher.
