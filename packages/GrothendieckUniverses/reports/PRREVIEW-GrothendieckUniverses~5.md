# Review of GrothendieckUniverses (pull request #1783 at b6c8e9a)

**Verdict:** needs changes

The pull request description marks the roadmap as a draft. It was reviewed in full anyway: the gate passes, every headline is true at the pins, and the one blocking finding is a gap in the proof route of 1.2, not in any statement.

## R01 (P2) — The route of 1.2 runs on inputs no target provides, and one of them is circular

Location: `TauCetiRoadmap/GrothendieckUniverses/README.md` lines 174–180 ("Route: with `α = card U`, prove `V_ α.ord ⊆ U` by induction on ranks below `α.ord` (UA2, UA1, UA4), and `U ⊆ V_ α.ord` by regularity … of cardinality `< α`, hence of rank `< α.ord`").

Claim: the sketch is Williams's proof of Theorem 1, but with `α = card U` in place of Williams's `α(U)`, and with only one direction of Kruse's criterion quoted. Two inputs the route uses exist nowhere in the roadmap:

1. The step "a subset of `V_ α.ord` of cardinality `< α` has rank `< α.ord`" needs `α` regular. Witness: `α = ℶ_ω` is a strong limit with `cof = ω`; the set `{V_ (ℶ_n).ord : n ∈ ω}` is a subset of `V_ α.ord` of cardinality `ℵ₀ < α` and of rank `α.ord`. With `α = card U`, regularity of `card U` is exactly 1.3 (`isInaccessible_card`), whose *Needs:* line is "1.1, 1.2": the plan is circular.
2. The successor step of the induction ("`V_ β ∈ U`") needs the converse direction of Kruse's criterion, `x ⊆ U ∧ card x < α ⇒ x ∈ U` (williams1969 line 76, Williams's step (ii) on p. 2, which cites it as an iff at line 65–66). The README quotes only `x ∈ U ⇒ x ⊆ U ∧ card x < α` (line 176), which is trivial from UA1 and the 0.2 bound and does not drive the induction. No target states the converse, and 0.2's "`ZFSet.omega ∈ U` iff `U` has an infinite element" needs the same lemma in its ⇐ direction.

Repair, as Kruse proves it (kruse1965 lines 113–119, Theorem 1 (a)⇒(b), p. 98): add to 0.2 a target "for a universe `U` let `α(U)` be the least cardinal `α` with `card x < α` for every `x ∈ U` (it exists by the 0.2 bound `card x < card U`); prove from UA1, UA2, UA4 and closure under subsets that `α(U)` is regular and a strong limit, and that `x ∈ U ↔ x ⊆ U ∧ card x < α(U)`". Then state 1.2's route with `α(U)`: `V_ α(U).ord ⊆ U` by induction (the successor step uses the criterion, the limit step UA4 with the index set `β.toZFSet ∈ U`), `U ⊆ V_ α(U).ord` by regularity of `ZFSet` and the regularity of `α(U)`; and in 1.3 derive `card U = α(U)` (Williams, Theorem 2, p. 3: `card (V_ κ.ord) = κ`). Update 1.2's *Needs:* line to list the new target. Nothing in `Suggested.lean` changes.

## R02 (P3) — `eq_vonNeumann_card` is narrowed below Williams's Theorem 1

Location: `TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` lines 91–92 (`(hω : omega ∈ U) : U = V_ (card U).ord`); README line 192.

Claim: the hypothesis `ZFSet.omega ∈ U` is unused. Witness: for `U = V_ ω`, `card U = preBeth ω = ℵ₀` (`ZFSet.card_vonNeumann`, `preBeth` of a limit is the supremum of the finite `preBeth n`) and `ℵ₀.ord = ω`, so `U = V_ (card U).ord` holds; the other universes are the `V_ κ.ord` with `card = κ` by `Cardinal.IsInaccessible.preBeth_ord`. Williams's Theorem 1 (williams1969 line 69–70, p. 2) is for every universe. Repair: drop `hω` from `eq_vonNeumann_card` and say in README 1.3 that `U = V_ (card U).ord` holds for every universe, while `card U` is inaccessible in Mathlib's sense exactly when `ZFSet.omega ∈ U` (the README's first Check of 1.3 is then the negative control for `isInaccessible_card` only).

## R03 (P3) — Locator slips

1. `Suggested.lean` line 66: "after Shepherdson 1951". Williams's (b) and (c) cite Shepherdson [5] = *Inner models for set theory. II*, 1952 (williams1969 lines 117–119); the README's reference is the 1952 paper. Write 1952.
2. README line 151–152: 1.1 cites "Williams 1969, (b) and (c), p. 2" for "`V_ κ.ord` is a universe". Williams's (b) and (c) (p. 2) are the facts `β < α ⇒ card Ψ(β) < α` and `x ∈ Ψ(α) ↔ x ⊆ Ψ(α) ∧ card x < α`; that `Ψ(α)` is a universe follows from (c) with Kruse 1965, Theorem 1 (b)⇒(a), p. 98 (kruse1965 lines 106–111, 120–121). Cite both.
3. README line 175: "using Kruse 1965" has no locator; it is Theorem 1, p. 98.
4. README lines 86–87: `Cardinal.IsStrongLimit` is declared in `Mathlib/SetTheory/Cardinal/Order.lean` (line 439 at the pin), not in `Regular.lean` or `Aleph.lean`.

## R04 (P3) — The narrow-sense inaccessibility clause attributed to Williams is Kruse's

Location: README lines 52–55 ("Williams 1969 and Tarski 1938 call inaccessible « in the narrower sense » the cardinals `α` such that … `2^ξ < α` for `ξ < α`; these are `0`, `ℵ₀` and Mathlib's inaccessible cardinals (`1` and `2` fail, since `2^0 = 1` and `2^1 = 2`)").

Claim: Williams's IA2 (williams1969 lines 44–45, p. 1, read on the page image) is `ξ^η < α` whenever `ξ < α` and `η < α`, not `2^ξ < α`; the `2^β < α` form is Kruse's (kruse1965 lines 39–42, p. 96). Witness: under Williams's IA2 the cardinal `2` passes: `0^0 = 1`, `0^1 = 0`, `1^0 = 1`, `1^1 = 1` are all `< 2`, and IA1 holds since a family of at most one set of size at most one has union of size at most `1`; so the list "`0`, `ℵ₀`, Mathlib's inaccessibles" and the reason "`2^1 = 2`" describe Kruse's definition, not Williams's. Repair: attribute the `2^ξ` clause to Kruse 1965, p. 96, and say that Williams's IA2 reads `ξ^η < α` (which also admits `2`, where his (c) fails; see Source issues). The roadmap's own convention (Mathlib's `IsInaccessible`) is unaffected.

## Verified sound

**Gate and build.** The worker's gate at b6c8e9a passes every check (set_option 0, build 0, depcheck 0, stray-files 0). `lake env lean TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` from the worktree: 8 `declaration uses sorry` warnings and nothing else. Depcheck output: `depcheck: 205 roadmaps, 1660 edges, 0 problem(s)`; no UPWARD or CYCLE line; the roadmap is listed in the merge order and consumes no roadmap.

**Signatures.** `#check @name` for all 9 declarations on a probe copy (namespace renamed): each elaborated type agrees with its README statement; no section binder is dropped (the file uses no `variable`). `IsGrothendieckUniverse : ZFSet.{u} → Prop` with the five fields UA1–UA5 of Williams p. 1 (williams1969 lines 32–37), UA4 over `f : I → ZFSet.{u}` with `I ∈ U` and `ZFSet.small_coe` supplying the `Small` instance.

**One-tactic probe.** Each of the 8 sorried theorems was tried with `simp`, `rfl`, `infer_instance`, `exact?` and `constructor <;> simp` on the probe copy; none closed. No padding; nothing restates a definition or a Check.

**Library declarations opened at the pin** (Mathlib f6090c70): `ZFSet.vonNeumann`, `V_` notation, `isTransitive_vonNeumann`, `vonNeumann_mem_of_lt`, `vonNeumann_subset_of_le`, `subset_vonNeumann`, `mem_vonNeumann`, `rank_vonNeumann`, `vonNeumann_mem_vonNeumann_iff`, `vonNeumann_zero`, `vonNeumann_add_one`, `vonNeumann_of_isSuccPrelimit`, `card_vonNeumann` (`Mathlib/SetTheory/ZFC/VonNeumann.lean` 38–141); `ZFSet.IsTransitive` (`ZFC/Ordinal.lean` 42, body `∀ y ∈ x, y ⊆ x`), `IsTransitive.iUnion`, `IsTransitive.powerset`; `ZFSet.rank`, `rank_lt_of_mem`, `rank_le_iff`, `rank_singleton`, `rank_powerset`, `rank_iUnion` (`ZFC/Rank.lean` 138–210); `ZFSet.card` (`#(Shrink x)`), `card_mono`, `card_empty`, `card_singleton`, `card_powerset`, `iSup_card_le_card_iUnion` (`ZFC/Cardinal.lean` 30–86); `ZFSet.small_coe` (194), `omega` (358), `powerset`/`mem_powerset` (408, 422), `sUnion`, `regularity` (595), `range` (636), `iUnion`/`mem_iUnion` (656, 662), `pair` (677), `prod` (710) in `ZFC/Basic.lean`; `Cardinal.IsInaccessible` (fields `aleph0_lt`, `le_cof_ord`, `isStrongPrelimit`), `IsInaccessible.isRegular`, `.isStrongLimit`, `.univ`, `.preBeth_ord` (`Cardinal/Regular.lean` 370–404), `IsRegular` (Regular.lean 40), `isRegular_aleph0` (72); `IsStrongLimit` (`Cardinal/Order.lean` 439), `isStrongLimit_aleph0` (`Cardinal/Basic.lean` 400); `preBeth`, `preBeth_strictMono`, `le_preBeth_ord` (`Cardinal/Aleph.lean` 574–656); `Cardinal.univ`, `aleph0_lt_univ` (`Ordinal/Univ.lean` 145). Tau Ceti 358314d4 has no `ZFSet` file (only `SetTheory/Cardinal/Finite.lean`): the contract "nothing from Tau Ceti" is right.

**Ownership and duplication.** No Grothendieck-universe predicate on `ZFSet` exists in Mathlib or Tau Ceti at the pins (grep of `Mathlib/SetTheory` for "Grothendieck", "universe axiom"). `roadmaps grep` over main and the 440 open pull requests: the only other user of `ZFSet.vonNeumann` is HanfNumbers (its supplier table, lines 126 and 715), which defines no universe notion; HabiroCohomologyFoundationsPartII and AnalyticToricGeometryPartII fix a universe in prose only. This roadmap is the owner.

**Sources read** (cache ids): williams1969 = Numdam CM_1969__21_1_1_0 (text 9f66c8d5, pages 1–3 also read from the page images: UA1–UA5 p. 1; IA1–IA2 p. 1; (a)–(c) p. 2; Kruse's criterion as an iff p. 2; Theorem 1 p. 2; Theorem 2 and (A)⇔(B) p. 3); kruse1965 = Numdam CM_1965-1966__17__96_0 (text 41876499: definition with "nonvoid" lines 74–76; Theorem 1 lines 106–111; Theorem 2 lines 133–138; Corollary 2 lines 159–163; Theorem 4 lines 179–188); gabriel1962 = Numdam BSMF 10.24033/bsmf.1583 (text abf954b8, p. 328 at lines 216–243: U1–U5, the universe axiom and the least universe, the five corollaries); zermelo1930 via matwbn fm16/fm1615 (OCR, text 6b99e3ed, printed pp. 28–47: introduction lines 44–47 on the unbounded sequence of models; condition I "Kernzahl", regular initial number, line 146–148; condition II "Eigenwert" line 261–263; Erster Isomorphiesatz line 430–431, same characteristic and equivalent bases give isomorphic Normalbereiche).

**Locators confirmed.** Conventions: Williams p. 1 UA1–UA5 ✓; Gabriel p. 328 U1–U5 with the ordered-pair axiom and no nonemptiness ✓ (and Kruse adds "nonvoid", line 75–76, consistent with 0.2's "conversely for nonempty `U`"). 0.1 ✓. 0.2: Gabriel's corollaries p. 328 (subsets, `X ∪ Y`, `X × Y`, `{x, y}`, products of families, `card X < card U`) ✓. 1.2: Williams Theorem 1 p. 2 ✓. 1.3: Theorem 2 p. 3 ✓; Zermelo's characterisation up to the basis of urelements ✓ (the README's "determined by `κ`" is the pure case). 2.2: Gabriel p. 328 ✓ (Kruse Theorem 2 p. 98 is the proof). 2.3: Williams p. 3 (A)⇔(B) ✓ (also Kruse Corollary 2 p. 99). Scope: Kruse Theorem 4 p. 99 for "universes containing an infinite set are the super-complete models" ✓.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `IsGrothendieckUniverse` | `∅`; `{∅}`; `V_ (ω+1)`; `V_ (ω+ω)`; `V_ ω` | `∅`: UA5 fails. `{∅}`: `powerset ∅ = {∅} ∉ {∅}`. `V_ (ω+1)`: `V_ ω ∈`, `powerset (V_ ω) = V_ (ω+1) ∉` itself. `V_ (ω+ω)`: UA1–UA3 hold (`rank` of powerset and singleton is `+1`, `ω+ω` limit); UA4 with `I = ω` (rank `ω`), `f n = V_ (ω+n)`: `⋃ = V_ (ω+ω) ∉` itself. `V_ ω`: index sets hereditarily finite, suprema of finitely many finite ranks finite | each wrong model excluded by one named field | none |
| 1.1 `V_ κ.ord` universe | `κ` inaccessible; negative controls `ℵ₁`, `ℶ_ω` | `rank (powerset x) = rank x + 1 < κ.ord` (`κ.ord` limit); `card I ≤ preBeth (rank I + 1) < preBeth κ.ord = κ`; sup of `< κ` ordinals below `κ.ord` is `< κ.ord` (`κ` regular). `ℵ₁`: `card (V_ (ω+1)) = 2^ℵ₀ ≥ ℵ₁`, a cofinal family exists, union of rank `ω₁ ∉ V_ ω₁`. `ℶ_ω`: `ω`-indexed family `V_ (ℶ_n).ord`, union `V_ (ℶ_ω).ord ∉` itself | true; both hypotheses used | none |
| 1.1 `V_ ω` universe | UA1–UA5 | elements have finite rank; `I ∈ V_ ω` is finite; sup of finitely many finite ordinals finite; `∅ ∈ V_ ω` | true | none |
| 1.2 iff | `U = V_ ω`; `U = V_ κ.ord`; `U = V_ n`; `U = V_ (ω+ω)` | ⇐ from 1.1. ⇒: Williams Thm 1 with `α(U)`; `α(U) > n` for all `n` since `V_ n ∈ U` has `card ≥ n`, so `α(U) ∈ {ℵ₀} ∪` inaccessibles; `V_ n` fails UA2 at `V_ (n−1)` (`n ≥ 1`), `V_ 0` fails UA5; `V_ (ω+ω)` fails UA4 | statement true; route incomplete | R01 |
| 1.3 `isInaccessible_card` | `V_ ω`; `V_ κ.ord` | `rank omega = ω ≮ ω`, so `V_ ω` is excluded by `hω`; `card (V_ κ.ord) = preBeth κ.ord = κ` | true | none |
| 1.3 `eq_vonNeumann_card` | `V_ ω` without `hω`; `V_ κ.ord` | `card (V_ ω) = preBeth ω = ℵ₀`, `ℵ₀.ord = ω`, `V_ ω = V_ ω`; `V_ (preBeth κ.ord).ord = V_ κ.ord` | holds for every universe | R02 |
| 2.1 trichotomy | `(V_ a, V_ b)` with `a, b ∈ {ω} ∪ {κ.ord}`; `U = V` | `V_ a ∈ V_ b ↔ a < b` (`vonNeumann_mem_vonNeumann_iff`); ordinals are trichotomous; `U ∈ U` excluded by `rank_lt_of_mem` | true, exclusive | none |
| 2.2 least universe | `x = ∅`; `x = omega`; no inaccessible in `Cardinal.{u}` | ranks `o ∈ {ω} ∪ {κ.ord}` with `rank x < o` form a nonempty well-ordered set; `V_ o₀ ⊆ V_ o` for `o₀ ≤ o`; `∅ ↦ V_ ω`; `omega ↦ V_ κ₀.ord`; with no inaccessible the hypothesis fails for `x = omega` | true | none |
| 2.2 intersection of a nonempty set of universes | `{V_ ω, V_ κ.ord}` | the set of ranks has a least element `o₀`; `⋂ = V_ o₀` | true | none |
| 2.3 iff | ⇒ with `x = V_ (c.ord + ω)`; ⇐ with `c = preBeth (rank x + 1)` | `x` infinite ⇒ `omega ∈ U` (0.2) ⇒ `card U` inaccessible (1.3); `c ≤ preBeth c.ord ≤ card x < card U`. ⇐: `preBeth (rank x + 1) < κ = preBeth κ.ord` ⇒ `rank x + 1 < κ.ord` ⇒ `x ∈ V_ κ.ord` | true | none |
| 0.2 closure | `∅ ∈ U`; `{x, y}`; `card x < card U`; `omega ∈ U ⇐` infinite element | `u ∈ U`, `∅ ⊆ u`, `∅ ∈ powerset u ∈ U`; `{x, y} = ⋃_{i ∈ V_ 2}` of `{x}`, `{y}` with `V_ 2 = powerset {∅} ∈ U`; `powerset x ⊆ U` gives `2^card x ≤ card U`, Cantor; ⇐ needs a countable `y ⊆ x` in `U` and `omega = ⋃_{i ∈ y} {g i}`, the Kruse criterion | true | input named in R01 |
| Conventions | `ℵ₀`; narrow-sense list | `isRegular_aleph0`, `isStrongLimit_aleph0`, `¬ ℵ₀ < ℵ₀`; Williams's IA2 admits `2` | `ℵ₀` witness right; attribution wrong | R04 |
| Research context | `Cardinal.univ.{u, u+1}` | `IsInaccessible.univ` at Regular.lean 401 | right | none |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–2 each with Examples and Dependencies, Downstream consumers, Research context, References: present. Both definitions (0.1, 0.2) have three discriminating Checks. No LaTeX, no process words, no pull-request numbers, no `set_option`, single `public import Mathlib` in module form, `theorem` throughout, one docstring per declaration.

## Not verifiable

- tarski1938: the DOI lands on an impan.pl page in no licence class; the matwbn file numbers fm30/fm3005–fm3030 were tried and none is pp. 68–89. The Conventions' description of Tarski's "narrower sense" is unverified (R04 is based on Williams's and Kruse's own clauses).
- shepherdson1952: Cambridge/JSTOR landing page only (paywalled); cited through Williams [5].
- sabbagh1969: Springer DOI, paywalled, recorded uncertified.
- Ewald 1996 (OUP), Kanamori 2003, SGA 4 (Springer LNM 269), Bourbaki *Théorie des ensembles*, Krömer 2006, Kashiwara–Schapira 2006, the Bourbaki archive rédactions: not read; they support context and bibliography only, no statement of the roadmap depends on them.

## Source issues

- **Error** in williams1969 at p. 1–2, IA1–IA2 and (c): the definition of inaccessible in the narrower sense (unions of fewer than `α` sets of size `< α` are of size `< α`; `ξ^η < α` for `ξ, η < α`) admits `α = 2`, but (c) fails for `α = 2`: `{{∅}}` is a subset of `Ψ(2) = {∅, {∅}}` of cardinality `1 < 2` and is not an element; it should exclude finite `α` (or require `α` infinite); affects nothing here (Mathlib's inaccessibles are uncountable).
- **Misprint** in williams1969 at p. 1, abstract and the sentence after (3): "the collection of all sets of rank `α`" and "of rank `≤ β`"; with `Ψ(0) = ∅`, `Ψ(β+1) = P(Ψ(β))` it should be "of rank `< β`" (the standard rank with `rank ∅ = 0`); affects nothing.
