# Review of ClassifyingTopoi (pull request #1997 at 675f027)

**Verdict:** needs changes

Incremental re-review of the 45 lines added since 8b842c8: README 1.5 and `exists_morleyization`.

## R01 (P2) — the sequents of `T'` leave `R_(φ ⟹ ψ)` free, so uniqueness fails for the `T'` described

**Location:** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 474–481: "`R_φ ⊣⊢ φ` for atomic `φ`, `R_(φ ⊓ ψ) ⊣⊢ R_φ ∧ R_ψ`, `R_(φ ⊔ ψ) ⊣⊢ R_φ ∨ R_ψ`, `R_(∃ φ) ⊣⊢ ∃ x R_φ`, … it is the only one, since the same induction determines every `R_φ`".

**Claim:** The cases listed (atomic, `⊓`, `⊔`, `∃`, `∼`, `∀`) are not the constructors of `L.Formula (Fin n)`, so the induction does not reach every formula and `T'` as described has models with two expansions.

**Witness:** Mathlib `ModelTheory/Syntax.lean:309`: constructors `falsum`, `equal`, `rel`, `imp`, `all`; `⊓` is `(f.imp g.not).not`, `⊔` is `f.not.imp g`. `P x ⟹ Q x` has none of the listed forms: on `PUnit`, `T = ∅`, both values of `R_(P x ⟹ Q x)` satisfy every sequent.

**Repair:** State the sequents on Mathlib's constructors: "`R_⊥ ⊢ ⊥`; `R_φ ⊣⊢ φ` for `φ` an equality or a relation; `R_(φ ⟹ ψ) ∧ R_φ ⊢ R_ψ`, `R_ψ ⊢ R_(φ ⟹ ψ)` and `⊤ ⊢ R_(φ ⟹ ψ) ∨ R_φ`; `R_(∀ φ) ⊢ R_φ` (in the extended context) and `⊤ ⊢ R_(∀ φ) ∨ ∃ x R_(φ ⟹ ⊥)`; `⊤ ⊢ R_ψ` for each axiom `ψ` of `T`." On the witness: `P` false forces `R` true (third), `Q` true forces true (second), `P` true and `Q` false forces false (first). The sequents for `⊓`, `⊔`, `∃`, `∼` then follow and are dropped.

## R02 (P2) — the first Check of 1.5 is false

**Location:** `README.md` lines 485–488: "interpreting `R_(∼P x)` by `∅` on a two-element set with `P = ∅` would give a set-model of `T'` whose reduct satisfies `T`".

**Claim:** That structure is not a set-model of `T'`, with or without `⊤ ⊢ R_φ ∨ R_(∼φ)`.

**Witness:** `T = {∀ x, ∼P x}` puts `⊤ ⊢ R_(∀ x, ∼P x)` in `T'`, and `R_(∀ φ) ⊢ R_φ` at `φ = ∼P x` then gives `R_(∼P x) = M ≠ ∅`. With `T = ∅` too: `R_(∼P x) = ∅` forces `R_(∀ x, P x)`, hence `R_(P x) = M ≠ P`.

**Repair:** Use a sentence, which no `∀`-sequent reaches (wording for the sequents of R01): "The third sequent of implication is needed. Over one 0-ary relation symbol `P` and `T = ∅`, take `PUnit` with `P` false. Without `⊤ ⊢ R_(P ⟹ ⊥) ∨ R_P`, interpreting `R_(P ⟹ ⊥)` by `False` and every other `R_χ` by recursion from these values satisfies the remaining sequents, so `PUnit` would have two expansions." Computed: `R_(P ⟹ ⊥) ∧ R_P ⊢ R_⊥` and `R_⊥ ⊢ R_(P ⟹ ⊥)` hold with all three false; the `∀`-sequents only mention `R_(φ ⟹ ⊥)` for `φ` in a context of length ≥ 1.

## R03 (P2) — "only finite disjunctions" is in the README and the docstring, not in the Lean statement

**Location:** `README.md` line 469, "a geometric theory `T'` over `L'` with only finite disjunctions", and line 493, "so the statement holds with `GeometricTheory.{0}`"; `Suggested.lean` line 245, `(T' : GeometricTheory.{0} L')`, docstring "a coherent geometric theory".

**Claim:** `GeometricTheory.{0}` bounds the index types by `Type 0`, not by finiteness, so the theorem does not say `T'` is coherent.

**Witness:** `Suggested.lean` line 71, `iSup {ι : Type w}`: at `w = 0`, `ι = ℕ` is admitted, so `⊤ ⊢ ⋁ (k : ℕ), φ k` is a sequent of a `GeometricTheory.{0}`.

**Repair:** Add, beside `GeometricFormula.IsHorn`, the predicate `GeometricFormula.IsCoherent` (as `IsHorn`, with `.iSup (ι := ι) φ => Finite ι ∧ ∀ i, (φ i).IsCoherent` and `.ex φ => φ.IsCoherent`), define it in README 1.1, and add the conjunct `∀ σ ∈ T', σ.lhs.IsCoherent ∧ σ.rhs.IsCoherent`, as in R04. This elaborates at the pins.

## R04 (P2) — the Morleyized language, its inclusion and the canonical expansion are Tau Ceti's and are not cited

**Location:** `README.md` lines 472–473, "Here `L'` adds to `L` an `n`-ary relation symbol `R_φ` for every `φ : L.Formula (Fin n)`", and the *Needs:* line 482; `Suggested.lean` line 245, `∃ (L' : FirstOrder.Language.{u₁, max u₁ u₂}) (ϕ : L →ᴸ L')`.

**Claim:** The existential hides objects the pin defines; the roadmap restates them without a supplier citation.

**Witness:** Tau Ceti `ModelTheory/ModelExistence/Morleyization.lean`: `morleyize` (line 80, `Language.{u, max u v}`), `lhomMorleyize` (117), `morleyExpansion` (142), `eq_morleyExpansion_of_model_definingTheory` (240); `Infinitary/Syntax.lean:226`, `BoundedFormula.toInf`. InfinitaryModelExistence Layer 5 (main) owns them.

**Repair:** Add `public import TauCeti.ModelTheory.ModelExistence.Morleyization`, cite these four declarations under **From Tau Ceti** and on the *Needs:* line, and state (elaborated at the pins, with `open FirstOrder.Language`):

```lean
variable (L) in
/-- **1.5.** The first-order formulas of `L`, tagged by their number of variables, in `L_{ω₁ω}`. -/
def firstOrderFamily : Set (Σ n, L.BoundedFormulaω Empty n) :=
  Set.range fun p : Σ n, L.BoundedFormula Empty n => ⟨p.1, p.2.toInf⟩

theorem exists_morleyization (T : L.Theory) :
    ∃ T' : GeometricTheory.{0} (morleyize L (firstOrderFamily L)),
      (∀ σ ∈ T', σ.lhs.IsCoherent ∧ σ.rhs.IsCoherent) ∧
      ∀ (M : Type v) [L.Structure M] (S : (morleyize L (firstOrderFamily L)).Structure M),
        @LHom.IsExpansionOn L _ (lhomMorleyize (firstOrderFamily L)) M _ S →
          (@GeometricTheory.IsSetModel _ T' M S ↔
            T.Model M ∧ S = morleyExpansion (firstOrderFamily L) M) :=
  sorry
```

The README statement becomes: an expansion `S` along `lhomMorleyize` is a set-model of `T'` exactly when `M` satisfies `T` and `S` is the canonical expansion. The route's uniqueness half is then the induction of R01 alone.

## R05 (P3) — Scope, "How to read the build" and the Dependencies of Layer 1 do not account for 1.5

**Location:** `README.md` lines 45–47 ("Geometric logic over a single-sorted first-order language (formulas, sequents, theories, their set-theoretic and categorical semantics, …, Layer 1)"), 262–265, and 506–507 ("Tau Ceti for 1.2 … Within the layer, each target uses the previous ones").

**Claim:** The new target is owned nowhere in Scope, absent from the layer's description and from the Summary's end theorems, and the Dependencies sentence is wrong for it.

**Witness:** `grep -n "Morley" README.md` gives lines 466–477 only; 1.5's own *Needs:* line is "1.1, 1.2", not 1.3 or 1.4. Scope line 119 excludes "the completeness theorems … for coherent theories, in sets", the use the cited section D1.5 makes of it.

**Repair:** Add to **Owned here**, Layer 1: "and the Morleyization of a first-order theory into a coherent theory with the same set-models (1.5)", with one clause that it is stated for set-models and that completeness stays out of scope; add the same clause to the Summary's Layer 1 end theorems and to "How to read the build"; in Dependencies write "Tau Ceti for 1.2 and 1.5 … Within the layer, 1.2–1.4 each use the previous ones and 1.5 uses 1.1 and 1.2".

## R06 (P3) — the pull request's description predates 1.5

**Location:** the description: "It states 27 headline theorems with `sorry`"; "`Suggested.lean` has not changed over the last four heads"; "gives 27 `sorry` warnings"; "The last three commits change only the README"; Elephant "D1.1, D1.2, D1.3.10 (through Caramello), D1.4 and D3.1".

**Claim:** The head contradicts each sentence, and the description does not state the new target.

**Witness:** `675f027` adds 14 lines to `Suggested.lean` (`exists_morleyization`); `lake env lean` on it gives 28 `sorry` warnings; README line 477 cites Elephant D1.5.

**Repair:** "It states 28 headline theorems"; "gives 28 `sorry` warnings"; drop "has not changed over the last four heads" and say the last commit adds 1.5 and `exists_morleyization` to both files; add to the Layer 1 bullet "Morleyization of a first-order theory into a coherent theory (1.5)"; add D1.5 to the Elephant list; after R04, name the second Tau Ceti import and the Tau Ceti declarations consumed.

## Previous findings

- none to account for: the previous report, of 8b842c8, had no finding.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.5 `exists_morleyization`, uniqueness for the `T'` of the README | `PUnit`, unary `P`, `Q`, `T = ∅`, `φ = (rel P).imp (rel Q)` | not of the form `f.imp ⊥`, `f.not.imp g`, `(f.imp g.not).not`, `all`; `R_φ` true or false, every listed sequent holds: 2 expansions | fails | R01 |
| 1.5, sequents of R01 for `imp` | `(R_φ, R_ψ)` over the four truth values | (F,F) → T by third; (F,T) → T; (T,T) → T by second; (T,F) → F by first | determined | R01 |
| 1.5, `∀` sequents, empty and one-point `M` | `M = ∅`, `M = PUnit`, `φ` in context 1 | `∅`: `∃ x R_(∼φ)` false, so `R_(∀ φ)` true, as `∀` on `∅`. `PUnit`: `R_(∀ φ)` iff `R_φ` at the point | holds | — |
| 1.5 Check 1 (negation) | two-element `M`, `P = ∅`, `R_(∼P x) = ∅`, `T = {∀ x, ∼P x}` and `T = ∅` | `⊤ ⊢ R_(∀ x, ∼P x)` and `R_(∀ φ) ⊢ R_φ` give `R_(∼P x) = M`; with `T = ∅`, `R_(∀ x, P x)` forced, so `R_(P x) = M ≠ ∅` | Check false | R02 |
| 1.5 Check 2 (`∀` needs its second sequent) | `PUnit`, `P` true, `T = ∅`, `R_(∀ x, P x) = False`, the rest by recursion | `R_(∀ φ) ⊢ R_φ`: `False ⊢ True`; `R_(∼∀ x, P x) = True`, both negation sequents hold; standard expansion has `True`: 2 expansions | holds for `T = ∅` | — |
| 1.5 Check 3 and the Lean carrier | `GeometricFormula.{0}`, `ι = PEmpty`, `Bool`, `ℕ` | `bot` is `iSup` over `PEmpty.{1}`, binary over a 2-element type, both in `Type 0`; `ι = ℕ` also admitted | coherence not stated | R03 |
| `exists_morleyization`, universes | `L : Language.{u₁, u₂}`, `L.BoundedFormula Empty n : Type (max u₁ u₂)` | relations `L.Relations n ⊕ _ : Type (max u₁ u₂)`, functions `Type u₁`: `Language.{u₁, max u₁ u₂}`, equal to Tau Ceti's `morleyize` | holds | R04 |
| `exists_morleyization`, both halves against the repaired iff | `S` an expansion along `ϕ` | set-model ⇒ `T` and `S` canonical (first half and uniqueness); `T` and canonical ⇒ set-model (existence) | equivalent | R04 |
| `exists_morleyization`, one-tactic probe | `simp`, `rfl`, `infer_instance`, `trivial`, `aesop` | all five leave the goal `∃ L' ϕ T', …` | not padding | — |

The rows for the untouched statements stand as in the previous review, of `8b842c8`.

- Source locators checked against the text: 0. The one locator the change adds (Elephant, D1.5) is under `## Not verifiable`.
- Library declarations opened at the pins: Mathlib `ModelTheory/Syntax.lean:309` (`BoundedFormula`), 378 (`not`), 383 (`ex`), 389–393 (`⊓`, `⊔`); Tau Ceti `ModelTheory/ModelExistence/Morleyization.lean:80, 117, 142, 189, 240` and `ModelTheory/Infinitary/Syntax.lean:94, 226`.
- Cross-roadmap citations: the change adds none. InfinitaryModelExistence (main), Layer 5, read for ownership of Morleyization; HanfNumbers (open) consumes it from there.
- Gate rerun at 675f027: every check 0, OK. Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 28 `sorry` warnings and nothing else. `#check @exists_morleyization` shows `{L}` and `(T)` and no lost binder; the universe `v` of `M` is a parameter of the theorem. The statements of R03 and R04 were elaborated in a scratch copy with the added Tau Ceti import: no error.
- Three Checks are present in 1.5; the second and third stand, the first is R02.
- Overlap check: read InfinitaryModelExistence, InfinitaryLogic (main), GrothendieckTopoi, ToposTheoreticBridges (open); Morleyization (`morleyize`, `lhomMorleyize`, `morleyExpansion`) is owned by InfinitaryModelExistence Layer 5 and is in Tau Ceti at the pin (R04); the coherent axiomatisation of 1.5 is in none of them and stays here.
- Source independence: changed passages only; 6 passages (the statement, the route, three Checks, the docstring) could be compared with 0 sources, since the one source cited, Elephant D1.5, was not readable; beside Tau Ceti's `Morleyization.lean` docstring none shared; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Johnstone, Elephant, D1.5 (README line 477, the locator of 1.5, a seeded target): paywalled (OUP), no open copy. Neither the item number inside D1.5 nor the form of the source's axioms was confirmed; the locator names a section only.
- As in the previous review: Elephant D1.1, D1.2, D1.3.10; Mac Lane–Moerdijk X.1–X.3; Makkai–Reyes pp. 272–297.

## Source issues

- none

## For the human reviewers

- **Not tested.** README 1.5 (lines 466–495) rests on Elephant D1.5 alone, which could not be read: its wording was not compared with the source, and the README's axioms for `T'` are checked only by computation.
