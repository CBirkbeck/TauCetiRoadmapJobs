# FIX-PKG-CountableStructureSpacesPartII~2

Repair of the five findings of `REV-PKG-CountableStructureSpacesPartII` (all P3). All five were
checked and applied. Files changed: `packages/CountableStructureSpacesPartII/README.md`,
`packages/CountableStructureSpacesPartII/Suggested.lean`,
`packages/CountableStructureSpacesPartII/sources.toml`. `design/plan.json` is unchanged (no
supplier gap is needed).

## REV-PKG-CountableStructureSpacesPartII/F01 (P3) — applied

Changed: deleted `not_isSmooth_of_borelComplete` from `Suggested.lean`. Its Layer 6 docstring
bullet "… has continuum many classes and is not smooth" → "… and has continuum many classes". The
name was removed from the README Summary list. 6.3 "Prove `not_isSmooth_of_borelComplete`: …" →
"Prove that `classIso K` is not smooth (`not_isSmooth_of_borelReducible_eZero` applied to the
reduction of `eZero`)".

Evidence: in a scratch copy at the pins,
`not_isSmooth_of_borelReducible_eZero (borelReducible_eZero_of_borelComplete hK)` elaborates as a
term proof, even without countability of `L`. Tau Ceti `TauCeti/SetTheory/Descriptive/EZero.lean`
line 219 states the lemma for any measurable space.

## REV-PKG-CountableStructureSpacesPartII/F02 (P3) — applied

Changed: dropped `[∀ n, Countable (L.Relations n)]` from the four `borelComplete_iff_…` theorems,
`not_measurableSet_classIso_of_borelComplete` and `borelReducible_eZero_of_borelComplete`. Three
statements keep "countable relational `L`": the Scott-height and analyticity consequences of 6.2,
and the cardinality theorem. Convention 1, the Layer 5 head, 6.2, 6.3 and 6.5 now say where
countability is not used.

Evidence:
- Layer 5 only composes and restricts reductions. It needs countability only of the source
  languages `L'`: `graphClass`, the logic action of countable `L'`, and `universalLanguage`.
- 6.2 pulls back along `f × f` from `linearOrderClass`, whose language is fixed.
- 6.3 composes with a fixed countable language.
- Tau Ceti's `MeasurableSpace (RelationalConfiguration L V)` (`…/RelationalConfiguration/Basic.lean`
  line 182) exists for every `L`.
- Three theorems keep the binder:
  - Scott height: `measurableSet_setOf_bfEquivSetoid` (`BackAndForth.lean` line 144) needs it.
  - Cardinality: needs `mk_le_continuum`.
  - Obstruction: needs `MeasurableSet.analyticSet_image` with a second-countable range.

## REV-PKG-CountableStructureSpacesPartII/F03 (P3) — applied

Changed: "*Needs:* Layers 0.1, 1.2, 1.3, 2.3, 4.1, 4.2." → "*Needs:* for (1) ⇔ (3) ⇔ (4), Layers
0.1 and 1.2; for (1) ⇔ (2), also Layer 2.3; for (1) ⇔ (5), also Layers 4.1 and 4.2; for the form
of (3) with function symbols, Layer 1.3."

Evidence: in the proof in Layer 5, (1)⇒(3)⇒(4)⇒(1) uses only the Layer 0.1 restriction and 1.2.
(1)⇔(2) adds `graphClass` and `borelComplete_graphClass` (2.3). (5)⇒(3) uses 4.1, (3)⇒(5) uses
4.2, and 1.3 serves only the closing remark.

## REV-PKG-CountableStructureSpacesPartII/F04 (P3) — applied

Changed: (a) the docstring of `exists_lt_scottHeight_of_borelComplete`, "below every countable
ordinal some code of the class has a larger Scott height" → "for every countable ordinal `β` some
code of the class has Scott height greater than `β`". (b) The section comment "Layer 0: Isomorphism
relations of classes" → "… of classes and two reducibilities".

Evidence: (a) matches `β < ω₁ → ∃ c ∈ K, β < scottHeight …`. (b) is the README title of Layer 0 (README line 342). The other six
section comments already match the README titles.

## REV-PKG-CountableStructureSpacesPartII/F05 (P3) — applied

Changed: the reference "Ann. of Math. 199 (2024); arXiv:2102.12371." → "arXiv:2102.12371v6, whose
numbering is cited; published in Ann. of Math. 199 (2024)." The same pattern was fixed for
becker-kechris-bams: "arXiv:math/9304208v1, whose numbering is cited; published in Bull. AMS 28
(1993)." The `sources.toml` version notes of both entries now say which numbering the README cites.

Evidence: the cached texts are arXiv v6 (`paolini-shelah-tfab line 5`) and arXiv v1
(`becker-kechris-bams line 5`).

## Checks run

- **Elaboration.** `lake env lean packages/CountableStructureSpacesPartII/Suggested.lean`, run from
  the content checkout, gives 15 warnings, all "declaration uses `sorry`", and no error. The file
  has 22 declarations: 7 definitions and 15 theorems. No `TauCeti.*` import needed a build.
- **Binder check.** A scratch file (`Suggested.lean` plus `#check @name` for all 22 declarations
  and the F01 probe) elaborated in one run. I compared each elaborated type with its README
  statement:
  - The six F02 theorems now elaborate with only `[L.IsRelational]`, matching README Layer 5, 6.2
    and 6.3.
  - `exists_lt_scottHeight_of_borelComplete`, `mk_quotient_classIso_of_borelComplete` and
    `not_borelComplete_of_rank_bounded` keep `[∀ n, Countable (L.Relations n)]`, matching
    "countable relational `L`" in 6.2, 6.3 and Convention 1 for 6.4.
  - No other binder changed.
- **Dependency check.** Output: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`, with no UPWARD
  or CYCLE line.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean
  name found nowhere. `not_isSmooth_of_borelComplete` occurs in no roadmap on main or open
  (`roadmaps grep`), and in no other board package.
- **Line width.** Every line I edited is at most 100 characters. Five long lines remain (1, 189,
  786, 980, 983), none of them touched here.
- **Ownership.** This round adds no construction and changes no ownership.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `borelComplete_iff_graphClass` without countable `L` | `L` empty; `K = ∅`; `L` with `Relations 2 = ℝ`, `K` = codes with a simple graph on symbol 0 and every other symbol empty | empty `L`: one code, one class, while graphs have `𝔠` classes, so both sides are false. `K = ∅`: no map into `∅`, both false. ℝ-symbols: the map putting the graph on symbol 0 has coordinates that are constants or input coordinates, so it is measurable for the product σ-algebra; (2) holds, and (1) follows by composition | iff holds in all three | binder dropped |
| `…_forall_structureSpace` / `…_forall_measurableSet` | `K' = Set.univ`; `B` non-invariant | `classIso univ` ≅ `isoSetoid` via `Equiv.Set.univ` (measurable both ways); `B ⊆ RC L' ℕ` with `L'` countable, restricted from (3) | independent of `L` | binder dropped |
| `…_forall_permSpace` | trivial action on `ℕ → Bool`; logic action of countable `L'` lifted by `ULift` | (5)⇒(3) uses `X = ULift (RC L' ℕ)`; (3)⇒(5) uses the injective equivariant `Φ`: `Φ x = g • Φ y = Φ (g • y)` gives `x = g • y` | independent of `L` | binder dropped |
| `not_measurableSet_classIso_of_borelComplete` | ℝ-symbol `L` and `K` as above; `K = ∅` | a measurable graph in `K × K` pulls back under `f × f` (`f : linearOrderClass → K`) to a measurable graph on `linearOrderClass`, which contradicts uniform separation (fixed `Language.order`). `K = ∅`: hypothesis false | holds | binder dropped |
| `borelReducible_eZero_of_borelComplete` | `L₀` = `{S, Z, P}` (countable, in `Language.{0,0}`) | `eZero ≤ isoSetoid L₀ ℕ ≤ classIso K` by (3); `0^ω` against `1 0^ω` related, `0^ω` against `1^ω` not | holds for any `L` | binder dropped |
| `exists_lt_scottHeight_of_borelComplete` (kept binder) | `β = 0`; uncountable `L` | the route needs `measurableSet_setOf_bfEquivSetoid` `[∀ n, Countable (L.Relations n)]` (pin line 144) | binder needed by the route | docstring only |
| `mk_quotient_classIso_of_borelComplete` (kept binder) | `L` with `2^𝔠` unary symbols, `K` = codes with at most one non-empty symbol, which is `ℕ` | `2^𝔠` pairwise non-isomorphic codes, so `#quotient > 𝔠` | binder needed | none |
| `not_borelComplete_of_rank_bounded` (kept binder) | uncountable `L` | `MeasurableSet.analyticSet_image` needs `SecondCountableTopology (range f)` (Mathlib `MeasureTheory/Constructions/Polish/Basic.lean` line 353), which fails for an uncountable product | binder needed | none |
| non-smoothness (README 6.3, 6.5) | `K = graphClass`; one unary predicate | `eZero ≤ classIso graphClass`, so not smooth. One predicate: countably many classes, smooth, and `eZero` does not reduce to it (`𝔠 > ℵ₀`) | consistent with 6.5 Checks | moved to prose |
| Layer 5 `*Needs:*` split | (1)⇒(3)⇒(4)⇒(1); (1)⇔(2); (5)⇔(3) | items used: 0.1 and 1.2; plus 2.3; plus 4.1 and 4.2 (NoncompactQuantumSymmetry via 4.2) | three statements no longer wait on an external supplier | line split |
| References numbering | cached headers | `paolini-shelah-tfab line 5`: arXiv v6; `becker-kechris-bams line 5`: arXiv v1 | version stated | reference lines and version notes |

## For the maintainer

- The deleted Lean name `not_isSmooth_of_borelComplete` is cited by no other roadmap, on main or
  open. The statement stays a README target (6.3, 6.5).
- `design/plan.json` (target 6.7) and `design/README.md` still name
  `not_isSmooth_of_borelComplete`. This job may edit only the plan's top-level `gaps`, so they are
  left as the design record.
- No cited id changed, and no new supplier or gap was added. Every name I removed from statements
  is a binder, not an id.
- No text read during the job asked for anything outside the job.
