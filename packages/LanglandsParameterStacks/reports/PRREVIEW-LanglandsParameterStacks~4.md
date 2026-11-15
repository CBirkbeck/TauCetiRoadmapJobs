# Review of LanglandsParameterStacks (pull request #1202 at 032037c)

**Verdict:** needs changes

## R01 (P3) — Group headings hide 29 targets and give `k.n` two meanings

**Location:** `TauCetiRoadmap/LanglandsParameterStacks/README.md:329` `**1.2 Clopen finite-wild pieces.**`, one of 29 parts demoted under twelve group headings such as line 378 `### 1.7 Derived parameter stacks and their classicality`.

**Claim:** When a README has any `### k.n` heading, the board's target reader ignores bold names. The 29 demoted parts therefore drop out of the target list, the review sample and progress reports. Each group heading also takes the place of its first part's title, so `k.n` now names both a group and a part. Nineteen *Needs:* edges cite the heading of their own group (1.8 → 1.7, 4.10 → 4.6), which reads as circular. ModularityAndLanglandsExtensions README:3342 still cites the old title "§1.16, Singularities of parameter stacks".

**Witness:** The roadmap tool's `readme_targets` returns 83 targets at `1e9f8e8` and 54 at `032037c`. Missing: 1.2, 1.4–1.5, 1.8–1.9, 1.14–1.15, 1.17–1.18, 2.3–2.5, 2.10–2.11, 2.13–2.14, 4.3, 4.7–4.10, 4.13–4.18, 4.20–4.21.

**Repair:** Turn each `**k.n Title.**` line back into a `### k.n Title` heading. Restore the twelve first parts' own titles:

- `### 1.1 ℓ-adic representability of finite-wild parameters`
- `### 1.3 Weil cohomology: amplitude and Euler characteristic`
- `### 1.7 Faithfully flat descent for enhanced modules`
- `### 1.13 Weil–Deligne parameters`
- `### 1.16 Singularities of parameter stacks`
- `### 2.2 Reductive quotients over fields and DVRs`
- `### 2.9 Excursion algebras of a discrete group over a finite quotient`
- `### 2.12 Categorical Hecke data`
- `### 4.2 Good-filtration t-structures`
- `### 4.6 The induced-perfect bar criterion`
- `### 4.12 Prime-to-ℓ components of fixed groups`
- `### 4.19 Sifted parameter mapping approximations`

Move each group paragraph into its layer's opening paragraph, and start it with its range instead of "These parts" ("1.3–1.5 compute the amplitude …"). Tested on a scratch copy: the reader returns the same 83 targets as at `1e9f8e8`, and the `target-ids` and `layer-ids` scanners report nothing.

## R02 (P3) — PrismaticCohomology is named as a consumer of singular support

**Location:** `README.md:505`: "Singular support is the Layer 1 input of PrismaticCohomology and the coherent-sheaf programme listed under downstream consumers."

**Claim:** No PrismaticCohomology roadmap uses singular support or the parameter stack. The roadmap that consumes 1.16–1.18 is ModularityAndLanglandsExtensions.

**Witness:** PrismaticCohomology Parts I–IV, at the heads of #1057, #1065, #1070 and #1080, never mention "singular support", "parameter stack" or "LanglandsParameterStacks". ModularityAndLanglandsExtensions README:3342 (#1180) consumes §§1.11 and 1.16–1.18.

**Repair:** Replace the sentence with: "ModularityAndLanglandsExtensions consumes 1.11 and 1.16–1.18 for nilpotent singular support on the parameter stack."

## R03 (P3) — The 4.6 group paragraph drops the component-group hypothesis

**Location:** `README.md:999`: "generation by `Perf(BG)` for adjoint quotients, twisted free-group quotients and derived unit fibres when `ℓ ∤ |π₁(G°)_tors|`."

**Claim:** The paragraph writes `G°`, so it allows disconnected `G`, but states generation under the `π₁` condition alone. The parts it summarises, 4.8–4.10, also assume `G°` reductive and `|π₀G|` prime to `ℓ`.

**Witness:** `README.md:1019`, `:1028` and `:1037` assume `|π₀G|` prime to `ℓ`. So do Fargues–Scholze Propositions VIII.5.11–VIII.5.13, pp.297–299 (FS line 11530, line 11591, line 11619).

**Repair:** "… and derived unit fibres when `G°` is reductive and `|π₀G|` and `|π₁(G°)_tors|` are prime to `ℓ`."

## R04 (P3) — Description: the dependency paragraph cites absent ids and omits three open suppliers

**Location:** Pull-request description: "By section, the README uses: ArithmeticGaloisRepresentations §1.11: … consumed in LP2e.2–LP2e.4. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README has no `LP2e` ids; the parts that consume §1.11 are 2.2–2.4. The README also uses three more roadmaps that are not on main, so "everything else … is a consumer" is false.

**Witness:** `README.md:101` (IntegralHeckeAndGaloisDeterminants §§0.2, 0.5–0.7, 1.2, 1.7), `:360` (DeformationAndDerivedPatchingAlgebra §§3.2–3.4), `:448` (FormalConnectionsOpers F4.3). Main at `3cf7342` has none of these folders; all three are open new roadmaps.

**Repair:** "By section, the README uses these roadmaps that are not yet on main: ArithmeticGaloisRepresentations §1.11 (*Reductive quotients over fields and DVRs*; *Complete reducibility and closed tuples*), in §§2.2–2.4; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5–0.7, 1.2 and 1.7 (determinant laws, pseudocharacters, the invariant-word colimit, `GL_d` reconstruction), in §§2.7, 2.9–2.10, 3.1–3.3 and 3.7–3.8; DeformationAndDerivedPatchingAlgebra §§3.2–3.4 (regular sequences and complete intersections), in §§1.5 and 1.16–1.17; FormalConnectionsOpers F4.3 (characteristic-zero Chevalley restriction), in §1.12. Every other supplier the README names is on main; the roadmaps under Downstream consumers are consumers."

## R05 (P3) — Description: the Lean and validation sentences contradict `Suggested.lean`

**Location:** "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; "the targeted Lake build succeeds with `sorry` as the only warning"; "with author-side red-team passes to follow".

**Claim:** `Suggested.lean` declares nothing and contains no `sorry`, and its docstring says that no headline theorem is statable. The red-team and review repairs are already on the branch.

**Witness:** `Suggested.lean:10–11` says none of the headline theorems is statable, and lines 50–53 are an empty namespace. `lake env lean` exits 0 with no output. Nine commits, `2f627ca5` through `1e9f8e83`, are titled red-team or review repairs.

**Repair:** "Adds the new roadmap folder `TauCetiRoadmap/LanglandsParameterStacks` (README, `Suggested.lean`, `metadata.toml`). No headline theorem is statable at the pins, so `Suggested.lean` declares nothing; its docstring names, layer by layer, the carriers each theorem lacks. Validation: the targeted Lake build succeeds with no warnings; … AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, followed by author-side red-team and review repairs."

## R06 (P3) — The summary block describes the plan as one source's chapter

**Location:** Description, `roadmap-summary` block: "The route is Chapter VIII of Fargues–Scholze."

**Claim:** The roadmap does not follow one source. Its layers are ordered by what the end theorems consume, and whole parts come from other sources: the wild enhancements of 0.5–0.9, the descent of 1.7, and the invariant theory of 2.2–2.4. The arrangement rule forbids describing a plan as a source's chapter.

**Witness:** `README.md:25` (Kurinczuk–Skodlerack–Stevens for 0.5–0.9), `:382` (Lurie, Theorem D.6.3.1), `:588` (Böckle–Harris–Khare–Thorne, Propositions 3.2 and 3.10), `:129` (the layer order follows what each layer needs).

**Repair:** "The end theorems are Fargues–Scholze, Propositions VIII.3.2 and VIII.3.8 and Theorems VIII.4.1 and VIII.5.1; the layers are ordered by what these theorems consume."

## Previous findings

- R01 — not repaired: no `sources.toml` in the folder (README.md, Suggested.lean, metadata.toml). Not carried: a manifest there fails the gate's stray-files rule ("sources are the README's references"); `README.md:1324–1338` gives links, versions, printed pagination.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 1.1 group paragraph | *Needs:* of 1.5, 2.1, 1.8, 4.4, 4.9; tame `G_m`, `q=3`, fibre at 2 | 1.5 and 2.1 list {1.1, 1.2}; the other three list 1.1. Mod 2, `(t−1)²=t²−1=0` but `t−1≠0` | Holds; 1.4, 1.6 and 1.14 also cite 1.1, unlisted |
| 1.3 group paragraph; sampled 1.3 | *Needs:* of 1.9, 1.10, 1.6, 1.16, 5.2; tame `G_m`; `ℚ_ℓ` | Every listed edge is present. Relative dimension 1 = `dim Ĥ`, absolute 2. `(h⁰,h¹,h²)=(1,1,0)`, χ=0. FS VIII.1.3 p.279: flat relative complete intersection | Holds |
| 1.7 group paragraph; sampled 1.7 | *Needs:* of 4.5, 4.19, 6.1, 2.8, 1.11; tame `G_m`, `q=3` | 4.5, 4.19 and 6.1 list 1.8; 2.8 lists 1.9; 1.11 lists both. `b²−1` is a nonzerodivisor, so `H⁻¹=0` and the stack is classical | Holds |
| 1.13 group paragraph | 1.15 *Needs:*; `N=E₁₂`, `φ₀(σ)=diag(1/3,1)` | 1.15 lists {1.13, 1.14}; nothing outside 1.13–1.15 cites them. `Ad` gives `N/3=q⁻¹N`; `diag(3,1)` gives `3N` | Holds |
| 1.16 group paragraph | PrismaticCohomology Parts I–IV; ModularityAndLanglandsExtensions | 0 hits for singular support, parameter stack or this roadmap; ModularityAndLanglandsExtensions:3342 consumes 1.11 and 1.16–1.18 | Fails: R02 |
| 2.2 group paragraph; sampled 2.2 | *Needs:* of 2.6, 3.3, 3.5, 4.23–4.25; weights `(1,−1)` on `𝔸²`; trivial action on `k[ε]/ε²` | 2.6 and 3.3 list {2.2, 2.4, 2.5}, the rest as stated. Invariants `k[xy]`, one closed orbit `{0}` over 0; quotient has length 2 | Holds |
| 2.9 group paragraph | *Needs:* of 2.13–2.15, 3.2, 3.6, 5.1, 5.3; trivial tame `G_m`, `q=3` | 2.15 and 3.2 list 2.10, the others 2.9. `ℤ_ℓ[t±,b]/(b²−1)` is torsion-free, so the torsion-free quotient is unchanged | Holds |
| 2.12 group paragraph | 2.15 *Needs:*; 6.1 at line 1277; `I=∅` | 2.15 lists {2.12, 2.14}. 6.1 sends the trivial representation to `O_X`, acting as the identity, which is 2.12's unit Check | Holds |
| 4.2 group paragraph; sampled 4.2 | *Needs:* of 4.4, 4.7, 4.10, 4.12, 4.14–4.16; torus `V` | Every edge is present. `H¹(V)=0` (connective); `V[−1]` has `H¹=V` (not connective). `H⁰(G_m,k_λ⊗k_{−λ})=k≠0`. FS VIII.5.4 p.294, VIII.5.5 p.295 | Holds |
| 4.6 group paragraph | `PGL_ℓ`, `SL_n` with `ℓ∣n`, `G_m`; 4.11 and 4.20 *Needs:* | `π₁`: `ℤ/ℓ` (fails), `0` (holds), `ℤ` with torsion `0` (holds); edges present. The `|π₀G|` hypothesis of 4.8–4.10 is missing | Fails: R03 |
| 4.12 group paragraph | 4.21 *Needs:*; 4.17 in characteristics 2 and 3 | 4.21 lists {4.13, 4.16, 4.18}. Char 2: `|P|=2=ℓ`; char 3: `2·2≡1`. `μ₂` in char 2: `L[u]/(u−1)²`, length 2. FS VIII.5.18 p.308 | Holds |
| 4.19 group paragraph | 4.22 *Needs:*; downstream line 1318; wild `P` | 4.22 lists {4.20, 4.21}; line 1318 names 4.19–4.21. `gcd(p^k,ℓ)=1` for `ℓ≠p`, and `p`-groups are solvable | Holds |
| Target headings (R01) | the board's reader on `1e9f8e8`, `032037c` and the repaired scratch copy | 83, 54 and 83 targets; 19 *Needs:* edges cite their own group heading | Fails: R01 |
| Summary block, three theorems (R06) | FS VIII.3.2, VIII.4.1, VIII.5.1 | p.286; §VIII.4; p.293, which assumes `ℓ ∤ |π₁(Ĝ)_tor|` (FS line 11358), matching "Third, when ℓ ∤ |π₁(Ĥ)_tors|" | Theorems hold; the route sentence fails: R06 |

The 83 rows of the review of `1e9f8e8` for statements this diff does not change stand as recorded there.

- Gate (my run at `032037c`): `gate LanglandsParameterStacks: set_option=0 … statement-hygiene=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`. Dependency check: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/LanglandsParameterStacks/Suggested.lean` exits 0 with no output. The file has 0 declarations and is unchanged since `1e9f8e8`, so neither the `#check @name` audit nor the one-tactic probe has anything to check. No file outside the folder changed.
- The 12 group paragraphs assert 55 *Needs:* edges, and every one is present in the cited *Needs:* lines.
- Source locators re-read against Fargues–Scholze (author-hosted, FS line 10782 through line 11990), 9 in all: VIII.1.3 p.279; VIII.1.4 pp.280–281; VIII.2.1 and VIII.2.2 p.281; VIII.3.2 p.286; VIII.5.1 p.293; VIII.5.4 p.294; VIII.5.5 p.295; VIII.5.18 p.308. The changed passages add no locator.
- Citations resolved at their heads: ArithmeticGaloisRepresentations §1.11 (both named parts), DeformationAndDerivedPatchingAlgebra §§3.2–3.4, FormalConnectionsOpers §4.3 (F4.3), IntegralHeckeAndGaloisDeterminants §§0.2, 0.5–0.7, 1.2, 1.7. Incoming numbered citations from GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands, HeckeStacksAndLocalShtukas and ModularityAndLanglandsExtensions all still find their numbers.
- Overlap check: read IntegralHeckeAndGaloisDeterminants, HeckeStacksAndLocalShtukas, ModularityAndLanglandsExtensions, GlobalShtukasAndFunctionFieldLanglands and AnalyticStacks (open), and SmoothRepresentationsOfLocalGroups, EnhancedDerivedSheaves and ReductiveGroups (main); the results list is empty. Shared objects and their owners:
  - the parameter stack and its generation: this roadmap (HeckeStacksAndLocalShtukas README:32 cites §§1.7–1.8 and 6.2–6.3);
  - singular support: this roadmap;
  - the finite-wild cocycle scheme and excursion algebra: SmoothRepresentationsOfLocalGroups SR.6;
  - pseudocharacters: IntegralHeckeAndGaloisDeterminants;
  - AnalyticStacks: nothing shared.
- Source independence: changed passages only. The 12 group paragraphs were compared with 7 FS subsection openings (FS line 10911 through line 12117); the longest shared run is 5 words, "of order prime to ℓ", which the mathematics forces. The largest share is Fargues–Scholze, 89 of 174 author mentions. No layer was added, removed or reordered. Layer 4's new groups were set against FS §§VIII.5.1–5.4: only 4.12–4.18 matches a subsection (§VIII.5.3), and its order is forced by 4.14 ← 4.12–4.13, 4.15 ← 4.14 and 4.16 ← 4.15. Result: independent.
- Remark (untouched text): the Downstream consumers bullet at `README.md:1320` also names PrismaticCohomology.

## Not verifiable

- Nothing in the changed passages. The limitations recorded in earlier reviews (Jantzen 2nd edition pages; Lusztig 1976, Haboush 1975, Kempf, Donkin, Richardson 1988, Koppinen 1984) concern untouched text and were not requested again.

## Source issues

- none

## For the human reviewers

- Licence: Fargues–Scholze was read from the author-hosted copy at people.mpim-bonn.mpg.de. The sources service knew no licence class for that host; this review classified it `author-page`.
- Not tested: no review of this folder has recorded a comparison of its full wording or of its layers against the contents of Fargues–Scholze Chapter VIII, the source with the largest share (89 of 174 mentions). This round compared only the changed passages and Layer 4's new groups.
