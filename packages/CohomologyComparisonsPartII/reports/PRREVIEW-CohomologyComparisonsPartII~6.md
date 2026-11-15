# Review of CohomologyComparisonsPartII (pull request #1364 at 0d00ac6)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 0d00ac6: the folder is as the previous review accepted it. This round read the pull request's title and description against the head; both findings are about the description, and neither asks for a change in the roadmap folder.

## R01 (P3) — The description says the Lean states definitions and theorems; it declares nothing

**Location:** pull request description, second prose paragraph and the validation line: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** At this head `Suggested.lean` has no declaration, so it states no definition and no theorem, and the build gives no `sorry` warning. A reader must know that no headline is stated in Lean.

**Witness:** `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` lines 40–42: the namespace is empty; line 7: "None of the following headline theorems is statable at these pins". `lake env lean` on it: exit 0, no output.

**Repair:** Replace the two sentences by: "`Suggested.lean` declares nothing: its module docstring names the eleven headline groups (§§1.6, 2.3, 3.4, 4.3–4.5, 5.2–5.3, 6.4, 6.5, 6.6, 7.3, 7.4, 7.5) as not statable at the pinned Mathlib and Tau Ceti, each with the carriers it lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning (the file has no declaration); …" (the remaining counts stand).

## R02 (P3) — "The constructions follow Besser, Ertl–Nizioł and Asakura–Miyatani" does not describe the head

**Location:** pull request description, `<!-- roadmap-summary -->`, "Approach and generality": "The constructions follow Besser, Ertl–Nizioł and Asakura–Miyatani."

**Claim:** The head's Layer 5 and its all-weight bound rest on other sources, and the layers are ordered by the roadmap's own dependencies, not by those three texts.

**Witness:** `README.md` lines 616–695 (Layer 5): 16 NN and 15 HK locators, none to BesserI, EN or AM. Lines 498–615 (Layer 4): 36 CN locators; §4.4 states CN's bound. Whole README: CN 113, second after AM 159.

**Repair:** Replace the sentence by: "The sources are Besser and Huber–Kings for the rigid syntomic fibre, Ertl–Nizioł, Colmez–Nizioł and Tsuji for the log-syntomic complexes and period maps, Nekovář–Nizioł and Hyodo–Kato for the semistable and h-descent adapters, and Asakura–Miyatani for the relative coefficients; the layers are ordered by what the final targets need."

## Previous findings

- none: the previous report (head 0d00ac6) was an acceptance with no finding.

## Verified sound

### The description against the head

| Sentence of the description | Head | Result |
|---|---|---|
| Title "CohomologyComparisonsPartII: roadmap"; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | the folder is not on `origin/main`; the diff adds exactly these three files, 1005 insertions, 0 deletions | agrees |
| "rigid syntomic cohomology in every integer weight" | §2.2 tube-filtered complex and κ_r for r∈ℤ; Check values at r≤0 and r>0 for Spec V | agrees |
| "exact in small weights, bounded in all weights" | §4.3: 0≤r≤p−2, divided complex; §4.4: r≥0, kernel and cokernel killed by p^A, A=A(e,p,r) | agrees |
| "ramified bases, infinite residue fields and every prime including 2" | Conventions line 23 ("No finiteness of k"), line 25 ("All-prime ramified classical targets in Layers 2–5 require no such F_V") | agrees |
| "Over smooth affine bases with a Frobenius lift" | Conventions line 25: only the relative AM setting assumes F_V and σ on B† | agrees |
| "horizontal-log pairs over W(k)" | §7.4 line 896: V=W(k), log structure from D alone, r≥0 | agrees |
| "Yoneda theory on an exact category … imported rather than rebuilt" | Scope lines 9–15; contracts `exact-yoneda`, `rational-descent`, `hyodo-kato-proper`, `rigid-realizations` | agrees |
| "README identifiers missing from the Lean: 0 … dependency gate 0 problem(s) … outside-folder diff 0 path(s)" | gate counters readme-ids-missing=0, depcheck=0, outside-folder=0 | agrees |
| supplier added by the last repairs (EtaleCohomologyFoundations §§G.2–G.3) | on main; covered by "Roadmaps on main are cited by name" | nothing unstated |

### Adversarial rows for statements the description cites

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| small-weight range 0≤r≤p−2 (§4.3) | p=2, 3, 5 | p=2: r=0 only; p=3: r∈{0,1}; p=5: r∈{0,…,3}. Range is never empty, so "exact in small weights" is non-vacuous at p=2 | consistent with "every prime including 2" |
| L_EN(r)=(p^a a!)⁻¹ℤ_p(r), a=⌊r/(p−1)⌋ (Conventions, §4.4 target) | p=2, r=2; p=3, r=1; p=3, r=2 | p=2,r=2: a=2, p^a a!=8, L_EN=⅛ℤ_2(2), CN coordinate lattice ¼ℤ_2(2), quotient of generators 2. p=3,r=1: a=0, L=ℤ_3(1). p=3,r=2: a=1, L=⅓ℤ_3(2) | README's "differs by 2" holds; at r≤p−2 the lattice is ℤ_p(r), matching §4.3 |
| Frobenius lift only in the relative setting (Conventions line 25) | π²=p, p=2 and p=3 | F_V(π)²=p forces v_π(F_V(π))=1; v_π(π^p)=p; v_π(F_V(π)−π^p)=1<2=v_π(p). No F_V≡x^p mod p | the description rightly attaches the lift to the relative layers only |
| fibre sign convention d(a,b)=(da,f(a)−db) | [ℚ —2→ ℚ] | Fib⁰=ℚ, Fib¹=ℚ, d(a)=(0,2a); H⁰=ker 2=0, H¹=ℚ/2ℚ=0; connecting image of b is (0,b) | as the Conventions state |

The rows for every statement of the folder stand as in the previous review, of `0d00ac6`: the diff changes no statement.

- Gate rerun at 0d00ac6 against `origin/main`: every counter 0, `OK`, exit 0; the worker's gate record: every counter 0 including build=0.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean`, exit 0, no output, 4.1 s. No declaration, so no signature to `#check` and no statement for the one-tactic probe.
- `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. Folder change since the previous review: 0 lines.
- Source locators: none re-read; no sampled target lies in a changed passage (there is none). Locator counts by source taken from the README for R02: AM 159, CN 113, EN 81, BesserI 61, NN 59, HK 39, HuberKings 25, TsujiNearby 23.
- Cross-roadmap citations resolved this round: RigidAnalyticGeometry §§6.1–6.2, 7.3–7.4, 8.1, 8.4 on main (`TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 464, 479, 617, 640, 690, 762). Overlap lead "§8.4 dropped by the open revision of RigidAnalyticGeometry": that head carries an old → new list (its README lines 66–82) sending §8.4 to AdicSpacesPartIII R3.7 and the coherence and proper-mapping parts of §§7.3–7.4 to R3.2–R3.4 and R3.6; AdicSpacesPartIII is on main with R3.7 *proper-gaga* (its README line 609). The citation stays valid; remark only.
- Citation lead "HuberKings §2.2" is a source locator, not a roadmap citation: false positive, as before.
Overlap check: read PadicHodgeRegulators, CohomologyComparisons, CstConjectureForDaggerVarieties; nothing shared (PadicHodgeRegulators imports §§2.1–2.3, 3.1–3.4, 4.1–4.4, 5.1–5.3 by section, its README lines 86–95; the other two name no rigid syntomic fibre or filtered Frobenius connection category).
Source independence: changed passages only: 0 passages compared (the folder did not change); largest share AM, 159 of 572 counted locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "AI assistance" sentence (three review rounds and two red-team rounds on the job board): the board's history is not among the files of this review.
- As in the previous reviews, the cited sections of AInfCohomology, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and PrismaticCohomologyPartIII are not on main; nothing changed in how they are cited. BesserII remains settled as uncertified.

## Source issues

- none

## For the human reviewers

- none
