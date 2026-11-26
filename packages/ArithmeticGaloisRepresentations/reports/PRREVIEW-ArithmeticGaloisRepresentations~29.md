# Review of ArithmeticGaloisRepresentations (pull request #3178 at 6c07fb0)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 116 changed lines since `0a7b524`. The new target *Absolute-value places* of §2.1, the sentence added to the Conventions and the sentence added to *The local embedding* were checked statement by statement (each claim computed on examples, every Mathlib and Tau Ceti name opened), and no statement is false or unsupported: accepted. There are two small corrections (four Tau Ceti declarations the target cites are newer than the roadmap's pin; the new supplier SubspaceTheorem is missing from the supplier contracts) and one format note, none blocking. One point is left for a human: the only printed source the change cites, Neukirch Ch. II, could not be read.

## C01 — Four declarations cited as Tau Ceti's are not in the Tau Ceti this roadmap pins

A reader who looks up `NumberField.nonempty_setOf_liesOver_infinitePlace`, `NumberField.exists_smul_eq_of_liesOver_infinitePlace` (in the extension paragraph, lines 1203–1204, and so in "Over an infinite place both statements are Tau Ceti's"), `AbsoluteValue.isNonarchimedean_iff_of_liesOver` and `NumberField.isInfinitePlace_iff_of_liesOver` (in the *Needs:* line, line 1235) at the pinned Tau Ceti finds nothing: none of the four names occurs in the pinned sources (commit `2fd255d`), whose `NumberTheory/NumberField/PlacesOver/` has only `Extension`, `FinitePlace`, `Galois` (finite places only), `Height`, `LocalExtension`, `Ramification`, `Relative`. All four exist on the current Tau Ceti main with the statements the README gives them (`PlacesOver/InfinitePlace.lean`, `PlacesOver/Galois.lean`, `Analysis/AbsoluteValue/Nonarchimedean.lean`; the two infinite-place theorems hold for any algebraic, respectively Galois, field extension, as the paragraph needs).

The mathematics is unaffected. Either say of these four that they are in Tau Ceti after the pin, or move the pin when the roadmap is next built; the other Tau Ceti names of the target (`Rat.AbsoluteValue.IsStandard`, `AbsoluteValue.IsEquiv.eq_of_isStandard`, `NumberField.existsUnique_finitePlace_rpow_inv_eq_of_liesOver`, `NumberField.FinitePlace.relativeAbsValue`) are at the pin.

## C02 — The new supplier SubspaceTheorem appears in no supplier contract

The *Needs:* line of the new target (line 1228) consumes SubspaceTheorem §§0.1 and 0.2, and this is the only mention of that roadmap in the README: `## Exact supplier contracts` has no subsection for it, so a reader of the contracts does not learn that §2.1 now depends on the action of a group on `AbsoluteValue F ℝ` (§0.2) and on the classification of the absolute values above a place (§0.1). A short `### From TauCetiRoadmap.SubspaceTheorem` naming the two sections and what is assumed of each (the single `MulSemiringAction` instance with `(g • w) x = w (g⁻¹ • x)` and `(g • w).under R = w.under R`; `isInfinitePlace_of_liesOver` and the finite-place classification) would close it.

## N01 — The References entry for Neukirch lists only Ch. VII

The new target cites Neukirch, Ch. II, §§3, 8 and 9 (line 1226), while the entry under `## References` gives "Ch. VII, §§7–8" only; adding Ch. II there would let the citation be found.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Places = `{w // (w.under ℚ).IsStandard}`; equivalent places equal; every nontrivial absolute value of an algebraic `L` equivalent to exactly one | `w' = w^t` and both standard on `ℚ` force `t = 1` (`p^{-t} = p^{-1}`). Trivial absolute value: restriction trivial, not standard. `ℚ(t)`, `t`-adic: trivial on `ℚ`, no place. | Holds |
| `A_w` valuation subring; `A_{σ•w} = σ•A_w`; `w ↦ A_w` injective on finite places | `(σ•w)x ≤ 1 ⇔ w(σ⁻¹x) ≤ 1 ⇔ x ∈ σA_w`. Same ring ⇒ `w' = w^t`, `t = 1` on `ℚ`. Non-normalised control: `t^r ↦ t^{2r}` keeps the ring, gives `w(σx) = w(x)²`. | Holds |
| Decomposition group `= MulAction.stabilizer`, inertia; comparison with Mathlib | Mathlib: `decompositionSubgroup := MulAction.stabilizer (L ≃ₐ[K] L) A`; `inertiaSubgroup : Subgroup (A.decompositionSubgroup K)`. `ℚ(i)/ℚ`: above 5 stabiliser trivial; above ∞ order 2, inertia order 2. | Holds |
| Frobenius hypotheses: `q = 1`, conjugation, products | `q = 1`: the inertia condition. `(g•w)(gσg⁻¹x − x^q) = w(σy − y^q)`, `y = g⁻¹x`. `στx − x^{qq′} = σ(τx − x^{q′}) + (σy − y^q)`, `y = x^{q′}`; `w∘σ = w`. `q = 25` fails for Frobenius at 5: `x^5 ≢ x^25` on `F̄₅`. | Holds |
| Closedness for a continuous action on discrete `L` | Stabiliser `= ⋂_x {σ : w(σ⁻¹x) = w x}`, each set clopen; inertia likewise. | Holds |
| Extension and transitivity for `K ⊆ L` algebraic over `ℚ`; `IsGaloisGroup` not enough | Mathlib `IsGaloisGroup`: faithful, commuting, invariants `= K` only. Countable dense `G ≤ G_ℚ`: fixed field `ℚ`, orbits countable; fibre `G_ℚ/D` infinite homogeneous profinite, uncountable. | Holds |
| Number field: `w ↦ Q_w` equivariant bijection; Frobenius predicate matches | `Q_{σw} = {x ∈ O : w(σ⁻¹x) < 1} = σQ_w`. From `O` to `A_w = O_Q`: `x = a/s`, numerator `σa·s^q − a^q·σs ≡ 0 mod Q`, denominators units. | Holds |
| Restriction to `F` is the `[F_v : ℚ_p]`-th root of `FinitePlace.mk v` | `FinitePlace` at `p`: `N(v)^{-v(p)} = p^{-ef}`; root gives `p^{-1}`. `ℚ(√5)`: `1/5` vs `5^{-1/2}`. `ℚ(i)`, `(1+i)`: `1/4` at 2 vs `1/2`. Tau Ceti `relativeAbsValue_apply`: exponent `(localDegree)⁻¹`. | Holds |
| Infinite place of `F̄`: decomposition group trivial over complex `v`, `{1, c}` over real `v`; Conventions sentence | `ι∘σ = conj∘ι` forces `ι|_F` real. `ℚ(∛2)`: real place order 2, complex place trivial. | Holds |
| Check: weighted product formula for `1 + 2i` | `|1+2i| = √5`; at `(1+2i)`: `1/5`; elsewhere 1; `(√5)²·(1/5) = 1`. | Holds |
| *The local embedding*: image is the decomposition group of the normalised pulled-back place | Pulled-back place has `Q_w = Q(ι)`, so stabiliser `= D_{Q(ι)}` by the bijection above. | Holds |

- Library declarations opened at the pin: Mathlib `AbsoluteValue.under`, `AbsoluteValue.LiesOver` (`Analysis/Normed/Ring/WithAbs.lean:285, 301`), `Rat.AbsoluteValue.padic`, `.real` (`NumberTheory/Ostrowski.lean:114, 256`), `ValuationSubring.decompositionSubgroup`, `.inertiaSubgroup` (`RingTheory/Valuation/RamificationGroup.lean:29, 49`), `MulSemiringAction.toAlgAut` (`Algebra/Algebra/Equiv.lean:883`), `LocalSubring.exists_le_valuationSubring` (`RingTheory/Valuation/LocalSubring.lean:117`), `Algebra.IsInvariant.exists_smul_of_under_eq_of_profinite` (`RingTheory/Invariant/Profinite.lean:61`), `IsGaloisGroup` (`RingTheory/IsGaloisGroup/Defs.lean:53`); Tau Ceti `Rat.AbsoluteValue.IsStandard` (`Analysis/AbsoluteValue/Equivalence.lean:68`), `NumberField.FinitePlace.relativeAbsValue` (`NumberTheory/NumberField/PlacesOver/Relative.lean:36`), `existsUnique_finitePlace_rpow_inv_eq_of_liesOver` (`PlacesOver/FinitePlace.lean:197`). Four names absent at the pin: C01.
- Cross-roadmap citations resolved: SubspaceTheorem §§0.1 and 0.2 (on main and at this head, `README.md:176, 233`; §0.2 at this head asks for the general action the target uses); ArithmeticGaloisDuality cites §2.1 *Absolute-value places* (`README.md:81–82`), which exists.
- Dependency check: `depcheck: 91 roadmaps, 1025 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. SubspaceTheorem is on main and does not cite this roadmap.
- Automatic checks: every check passed on this head. `lake env lean` on `Suggested.lean`: exit 0, 20 `declaration uses 'sorry'` warnings and nothing else; the file is unchanged, so signatures and the one-tactic probe stand as before.
- Record: no layer, heading or item of the README at the merge base is removed or retitled; one heading added.
- Previous findings: the previous review had none.
- Seeded sample: no sampled target lies in a changed or affected passage; the README flags no locator as unverified.
- Pull request text: title and each description paragraph agree with the head (subtype, stabiliser, no Frobenius predicate, closedness hypothesis, `IsGaloisGroup` check, number-field comparisons, no `Suggested.lean` change, new need of SubspaceTheorem §§0.1–0.2).

Overlap check: read ArtinRepresentations, PotentialAutomorphyInfrastructurePartII, NeronModelsAndSemistableAbelianVarieties, ArithmeticGaloisDuality, SubspaceTheorem; the action on `AbsoluteValue F ℝ` is SubspaceTheorem §0.2's (cited), places as a subtype with their decomposition and inertia groups are this roadmap's; nothing else shared.

Source independence: changed passages only; 4 passages compared with 0 sources (the one printed source the change cites, Neukirch Ch. II, is not readable here; the passages were also set beside SubspaceTheorem §§0.1–0.2 and the Tau Ceti module docstrings, none shared); arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap supplies the Galois-representation language (Frobenius polynomials, Weil–Deligne representations, conductors) in which Serre's modularity conjecture (Khare–Wintenberger 2009) and automorphy lifting (Clozel–Harris–Taylor 2008; Boxer–Calegari–Gee–Pilloni 2021) are stated; README summary and its cited sources.

## Not verifiable

- Neukirch, *Algebraic Number Theory*, Ch. II, §§3, 8 and 9 (line 1226): the book is not among the recorded texts and no legal copy was read; the section numbers were not checked against the text.

## Source issues

- none

## For the human reviewers

- **Not tested.** The only printed source the changed passages cite, Neukirch Ch. II §§3, 8, 9 (`README.md` line 1226), could not be read: wording and locator were not compared with it.
