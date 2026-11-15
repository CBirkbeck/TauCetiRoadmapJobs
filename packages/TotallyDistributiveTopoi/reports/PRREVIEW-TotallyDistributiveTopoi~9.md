# Review of TotallyDistributiveTopoi (pull request #1927 at 888b789)

**Verdict:** needs changes

The folder is unchanged since 4907f68. All three findings are about the pull request's description, which was written for an earlier head.

## R01 (P3) — the description names the wrong category for the Check of 2.4

**Location:** The description, **Scope.**, Layer 2: "and on a subcanonical site iff covers are closed under intersections (a Check on `SingleObj ℕ` shows the hypothesis is needed)".

**Claim:** In Mathlib, `SingleObj ℕ` is the one-object category of the monoid `(ℕ, ·)`. There every nonempty sieve contains `0`, so covering sieves with empty intersection do not exist and the Check cannot run. The head's Check is on `(ℕ, +)`.

**Witness:** README 363 and 393 use `SingleObj (Multiplicative ℕ)`, "endomorphism monoid `(ℕ, +)`". Mathlib `SingleObj.comp_as_mul` (`CategoryTheory/SingleObj.lean:75`) gives `f ≫ g = g * f`, so `0 ≫ f = 0`. A scratch probe elaborates this.

**Repair:** "(a Check on `SingleObj (Multiplicative ℕ)`, the monoid `(ℕ, +)`, shows the hypothesis is needed)".

## R02 (P3) — the description lists four of the eight supplier sections

**Location:** The description, after **Scope.**: "It builds on GrothendieckTopoi (5.2, 5.6, 6.5, 7.1), which states the presheaf instances of (A) and (B) and Roos's theorem". Layer 3: "the localic forms (they need GrothendieckTopoi 7.1)".

**Claim:**
- The head consumes eight sections of GrothendieckTopoi, not four.
- It uses 7.1 for 3.1, 3.3, 3.5 and 4.2 as well as for 3.4.
- The four-section list is the first commit's contract.

**Witness:** README 127–138 has contract entries for 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5 and 7.1, the last "for targets 3.1, 3.3–3.5 and 4.2". The *Needs:* line of 2.2 (320) cites 1.1, 1.2, 1.4 and 2.3. All eight sections resolve at GrothendieckTopoi head c47d58e.

**Repair:** Replace the sentence with: "It builds on GrothendieckTopoi 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5 and 7.1: the structure of a topos, Giraud's theorem, the global sections morphism, locally connected and essential morphisms, the presheaf instances of (A) and (B) with Roos's theorem, and sheaves on a frame. Nothing of it is restated here." In Layer 3, write "the localic forms" without the parenthesis.

## R03 (P3) — the description omits the general theorem of 4.2 and that it has no literature source

**Location:** The description, Layer 4: "…and has enough projectives (through Roos's theorem); the Cantor space shows (B) is needed". **AI assistance.**: "the site-level equivalences of 2.3–2.4 and … the localic forms of 3.4, which are given with proofs here".

**Claim:** Target 4.2 is a general theorem with no literature source, and the Cantor statement is one instance of it. The description names neither the theorem nor that it is the roadmap's own argument.

**Witness:** README 595–597: `Sh X` has enough projectives when `X` has a basis whose members' open covers have pairwise disjoint open refinements with the same union, marked "(own argument)". Lines 607–609 derive `enoughProjectives_sh_cantor` from it.

**Repair:**
- Layer 4 becomes: "…(through Roos's theorem); on a space with a basis whose members' open covers have disjoint open refinements with the same union, the sheaf topos has enough projectives, and the Cantor space, its clopen instance, shows (B) is needed."
- AI assistance becomes: "…of the localic forms of 3.4 and of the enough-projectives criterion of 4.2, which are given with proofs here…".

## Previous findings

- none: the review of 4907f68 raised no finding.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Check of 2.4 on `SingleObj (Multiplicative ℕ)` (README 363–365, 393–397) | the ideals `{m ≥ n}`; `T = (· + 1)` on `ℕ` | `⋂ₙ {m ≥ n} = ∅`, not covering; sheaf for `{m ≥ n}` iff `Tⁿ` bijective; `0 ∉ range T`, so the representable is not a sheaf | true | none |
| The same Check on the description's `SingleObj ℕ` | `2 ≫ 3`; a sieve containing some `f` | `2 ≫ 3 = 6` by `rfl`; `0 ≫ f = f * 0 = 0` lies in every nonempty sieve, so their intersections are nonempty | the Check fails there | R01 |
| Contract with GrothendieckTopoi (127–138) against the description's "(5.2, 5.6, 6.5, 7.1)" | each section at head c47d58e | 1.1 at 287, 1.2 at 309, 1.4 at 357, 2.3 at 459, 5.2 at 816, 5.6 at 900, 6.5 at 1053, 7.1 at 1192; description names 4 of 8 | description incomplete | R02 |
| 4.2, the general target (595–605) | `PEmpty`; `U = ∅`; Sierpiński space; Cantor clopens; `ℝ` | `Sh PEmpty`: its one object is projective; the empty family refines a cover of `∅`; Sierpiński covers contain `X`; Cantor: finite clopen partitions; `ℝ` excluded (628–631) | true, no literature locator | R03 |
| The description's Layer 1–3 clauses | each clause against its target | Layer 1 matches 1.2–1.4; Layer 2 matches 2.2–2.5 (Theorem 1.5.5 at 409); Layer 3 matches 3.1–3.6 | agree, apart from R01 and R02 | none |
| The description's **Checks run.** | count, gate, elaboration | 30 declarations in `Suggested.lean`; gate 0 on every check; `lake env lean`: 20 `sorry` warnings, nothing else | true | none |
| The description's **Motivation.** and **Sources.** | Research context (653–670); References (674–690) | The answer is 3.5 (658); attributions at 663–666; its Lucyshyn-Wright and Raney locators are among those the References list | agree | none |

Rows for statements this round does not touch stand as in the review of 4907f68.

- **What changed:** the folder changed by 0 lines since 4907f68 and `Suggested.lean` is byte-identical; outside the folder, `git diff --stat origin/main...HEAD` is empty (the head merges main at 8ad4192, the merge base).
- **Gate and elaboration:** the gate on this head (`--base origin/main`) reports 0 on every check, OK, exit 0, and the worker's gate reports `build=0`; `lake env lean` on `Suggested.lean` exits 0 with 20 `sorry` warnings and nothing else; the earlier `#check @name` comparison and one-tactic probe stand.
- **Dependency check:** `depcheck: 247 roadmaps, 2235 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line; the roadmap is at line 412 of the merge order, and its supplier GrothendieckTopoi is an open new-roadmap pull request named in the depends-on block.
- **Library declarations opened at the pin (3):** `CategoryTheory.SingleObj` (`Mathlib/CategoryTheory/SingleObj.lean:52`), `SingleObj.comp_as_mul` (:75), and `Nat.instMonoid` (`Mathlib/Algebra/Group/Nat/Defs.lean:73`, multiplicative); a scratch probe also elaborates `ofAdd 2 ≫ ofAdd 3 = ofAdd 5` in `SingleObj (Multiplicative ℕ)`.
- **Supplier citations resolved at GrothendieckTopoi c47d58e (8 sections, 6 declarations):** `isGrothendieckTopos_iff_giraudAxioms` (Suggested 168), `GeometricMorphism.isEssential_iff_preservesProducts` (438), `exists_equiv_presheaf_iff_essential_points` (470), `epi_piMap_presheaf` (482), `isIso_sigma_pi_presheaf` (488), `Frame.grothendieckTopology` (554); its Scope (74–78) and Downstream consumers (1625–1629) name this roadmap as the owner of (A) and (B).
- **Overlap check:** read GrothendieckTopoi, ClassifyingTopoi and ToposTheoreticBridges, and searched every open head and main, InfinityTopoi and HypercompletenessAndCoherence included, for `IsPresheafTopos`, (A), (B), total distributivity, completely join-prime elements and connected sheaves; nothing is shared (GrothendieckTopoi 6.6 owns irreducible objects, not connected sheaves), and `overlaps.md` lists no dropped id and no other pull request changing this roadmap.
- **Source independence:** changed passages only; the folder changed by 0 lines, so no passage was compared and no layer was added, removed or reordered; the comparison made for 4907f68 stands, and the seeded sample falls in no changed passage.
- **Remark on untouched text:** README 396 writes "presheaves on `SingleObj ℤ`" for sets with an automorphism; in Mathlib that is the monoid `(ℤ, ·)`, and `SingleObj (Multiplicative ℤ)` is the category meant.

## Not verifiable

- **Published Lucyshyn-Wright.** JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018, resolves only to a paywalled page. Earlier rounds checked its locators against arXiv:1108.4032v3.
- **SGA 4 IV, Exercice 7.6.** It is reached only through GrothendieckTopoi's citations and was not opened.
- **Statements without a literature locator.** These are 2.3, the first statement of 2.4, 3.4 and the general statement of 4.2. They were checked only through their routes and the instances in the tables.

## Source issues

- none

## For the human reviewers

- Four targets have no literature locator and rest on the roadmap's own proofs: 2.3 (README 344), the first statement of 2.4 (369), 3.4 (494) and the general statement of 4.2 (595–597, "own argument"). Research context 666–669 says this of the first three.
- The question the roadmap answers is cited to a 1973 lecture recording on YouTube (README 653–658, 688–690). No target rests on it, and its licence status was not checked.
