# Review of EtaleMassFormula (pull request #1818 at f2619f9)

**Verdict:** needs changes

No blocking finding. Three P3 findings, each one a part of a previous finding this head leaves
unrepaired: the gate still fails on the module warning, the README shape still lacks `### Examples`
and names consumers that do not exist, and §3.2 still attributes a gap to a text nobody here has
read. The mathematics of every stated theorem held on every instance computed (table under
*Verified sound*), and the one claim this pull request declined to change on factual grounds (the
Tau Ceti names) is confirmed on Tau Ceti main at file and line.

## The previous review's findings at this head

- R01 (P2, Theorem 1 "in Tau Ceti" under names absent at the pin): **not changed, and the
  author's reason holds.** On Tau Ceti main today `TauCeti/NumberTheory/LocalField/MassFormula/`
  exists with `Main.lean` line 72 (`TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent`,
  proved, no `sorry` in the file), `Orbit.lean` line 67 (`TauCeti.ncard_isomorphic_mul_natCard_algEquiv`),
  `Basic.lean` lines 168 and 283 (`IntermediateField.discriminantExponent`, the body
  `Suggested.lean` restates, and `…_eq_of_algEquiv`), and
  `TauCeti/FieldTheory/IntermediateField/Isomorphic.lean` line 107
  (`IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed`, hypotheses
  `[IsSepClosed Ω] [FiniteDimensional K E] [Algebra.IsSeparable K E]`, conclusion
  `ncard · Nat.card (E ≃ₐ[K] E) = finrank K E`). None of them is at the pin `358314d4` (no
  `MassFormula/` directory, no `Isomorphic.lean`), and the previous witness, the mass formula
  roadmap's `STATUS.md` on main, lags Tau Ceti main. `Suggested.lean` uses none of these names,
  so the build is unaffected. Not a finding; recorded under *Verified sound*.
- R02 (P3, module warning fails the gate): **not repaired** (R01 below).
- R03 (P3, Bhargava numbering and the "from `t = 1`" sentence): **partly repaired.** `§8` is now
  "the Appendix" (lines 418, 459; `Suggested.lean` 367). The published numbering Thm. 1.1 now has
  a witness from a citer of the published article (arXiv 2006.12991v2, line 103: "Theorem 1.1 of
  [Bha07]", whose bibliography entry at lines 398–399 is the IMRN article), so that part is
  settled; the sentence attributing the omission of the `t = 0` component to the text is still
  there (R03 below).
- R04 (P3, unused `hg`): **repaired**; `tsum_isTransitive` (`Suggested.lean` 150–158) takes only
  `n`, `hn`, `g`, and the README (lines 199–203) no longer asks for invariance.
- R05 (P3, README shape): **partly repaired.** `## Downstream consumers` exists (lines 438–443) and
  the LocalFieldsRamification contract is split by its layers (lines 95–123, correctly: Layer 2
  unramified, Layer 3 discriminant, Layer 0 residue degree and adapters). No layer ends with
  `### Examples`, and the consumers section names roadmaps that cite nothing here (R02 below).

## R01 (P3) — Gate `build`: the module-system warning still fails the gate

Location: `TauCetiRoadmap/EtaleMassFormula/Suggested.lean` line 1 (`import Mathlib`); `gate.md`
at f2619f9: `build=1 FAIL`, "imports `Mathlib` from package `mathlib`, which is designed for use
with the module system; consider adding `module`".

Re-raised: R02 of the previous review. The pull request keeps the plain import because "the
module note is a warning". It is a warning, and my own `lake env lean` on a copy of the file gives
exactly 16 `declaration uses sorry` and nothing else (exit 0); but the worker's gate counts every
diagnostic that is not the sorry warning as a build problem, and no acceptance is possible while
the gate fails. Twenty-six roadmaps on main already use the module header
(`TauCetiRoadmap/FlagVarieties/Suggested.lean`, `…/DiagrammaticCoherence/Suggested.lean` among them).

Repair: first line `module`, blank line, `public import Mathlib`, then `public import` for the
five `TauCeti.*` modules, the docstring, `@[expose] public section`, then the namespace. The
declarations need no change.

## R02 (P3) — README shape: no `### Examples`, and consumers that cite nothing here

Location: `TauCetiRoadmap/EtaleMassFormula/README.md`: the layer ends at lines 228, 316, 368, 434
(`### Dependencies` only); lines 441–443 ("The arithmetic statistics roadmaps use the masses of
Layer 3 as the local factors of Bhargava's density constants").

Re-raised: R05 of the previous review (its `### Examples` and consumers parts). The README shape
ends every layer with `### Examples` and `### Dependencies`; the worked values already in the
Checks (the `ℚ_2` quadratic masses, the quartic orbit count `6 · 1 + 4 · 2 = 14`, `M_4`) are the
examples. The consumers claim: no ArithmeticStatistics roadmap on main (`ArithmeticStatistics`,
Parts I–VIII, under `TauCetiRoadmap/` and `Completed/`) contains the string `EtaleMassFormula` or
`Bhargava`; `roadmaps grep --readme-only EtaleMassFormula` over main and the 457 open pull
requests finds only PadicExtensionFamilies (nine lines at the head of its pull request), this
folder, and the two sibling pull requests by the same author. A downstream consumer is a roadmap
that cites a section of this one.

Repair: add `### Examples` before each `### Dependencies` with the layer's computed instances;
in `## Downstream consumers` keep PadicExtensionFamilies (§§1.1–1.3, as it cites them) and either
name the ArithmeticStatistics section that takes the Layer 3 masses or drop the sentence.

## R03 (P3) — §3.2 attributes a gap to a text nobody here has read

Location: `README.md` lines 400–402: "⚠ The unramified factors form the component `t = 0`.
[Bhargava 2007] writes the product from `t = 1`; the statement needs `S_{n_0}`, and the case
`π = ∅` is exactly the count of its conjugacy classes."

Re-raised: the second part of R03 of the previous review. The claim about what the source writes
cannot be checked here (the article is paywalled: the sources service gets HTTP 403 from the
publisher, and no arXiv, author or repository copy exists; the copies a web search turns up are on
hosts in no licence class). Nothing read (kedlaya2007b, wood2008, yasuda2025, arXiv 2006.12991)
says anything about Bhargava's proof of the partition formula. A roadmap states its own
mathematics with locators; it does not report, under a warning sign, a defect in a text it did not
open, and the ⚠ marker reads as a process note. The mathematical content stands on its own: the
`t = 0` component is needed, and `Equiv.Perm.card_of_cycleType` at the pin
(`Mathlib/GroupTheory/Perm/Centralizer.lean` 693) counts the fixed points as `(card α − m.sum)!`,
which is exactly `n_0!`.

Repair: replace the three sentences by "The unramified factors form the component `t = 0`: the
statement needs `S_{n_0}`, and for `π = ∅` it is the count of its conjugacy classes." If the
author has read the published proof and it does omit `t = 0`, that is a *Source issues* entry
(a Gap, with the printed page), not a README sentence.

## Verified sound

**Gate and folder.** `gate.md` at f2619f9: every scanner 0 (`set_option`, `prnum`, `tex`,
`latex`, `imports`, `mathlib-subimports`, `sorry-data`, `sorry-examples`, `readme-ids-missing`,
`empty-sections`, `round-labels`, `stray-files`, `outside-folder`, `dirty`, `depcheck`,
`metadata`); only `build=1` (R01). `git diff --stat origin/main...HEAD` touches only
`README.md` (+42/−23 lines in all) and `Suggested.lean` in this folder; nothing outside it. The
pins of the pull request's manifest equal main's (Tau Ceti `358314d4`, Mathlib `f6090c70`).

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`: 16 `declaration uses
sorry`, no other diagnostic, exit 0 (7 s). One-tactic probe on a second copy, each `sorry`
replaced by `first | rfl | simp | infer_instance | simp [every definition of the file] | sorry`:
8 declarations fell through to `sorry` and 8 left `simp` with unsolved goals; none closed, so
nothing is padding by that test. Elaborated types (the worker's `signatures.md`, 30
declarations) compared with the README: every theorem carries
`[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` as the
Conventions state; the four declarations flagged as dropping binders (`GaloisSet`,
`GaloisSet.mulAction`, `GaloisSet.discriminantExponent`'s abbreviation chain, `homMulAction`)
keep only `[Field K]` because their types mention no local-field structure, which is right: a
Galois set is a continuous permutation representation of `Gal(K^sep/K)` for any field. No
`set_option`, no sorried data, no `lemma`, imports `Mathlib` plus five `TauCeti.*` modules that
exist at the pin. All four headline theorems (`etaleMass_eq`, `etaleMass_splittingSymbol`,
`etaleMass_ramificationPartition`, `tsum_etaleDiscriminantExponent`) are stated; the docstring
says all are statable. `readme-ids-missing=0`: every backticked name of the roadmap's own in the
README is declared, and every Lean name appears in the README.

**Library declarations at the pins** (Tau Ceti `358314d4`, Mathlib `f6090c70`), each opened:
`TauCeti.unramifiedExtension` (`Unramified/Existence.lean` 85), `isGalois_unramifiedExtension`,
`existsUnique_isUnramified_finrank_eq` (same file), `maximalUnramifiedExtension`
(`Unramified/Maximal.lean` 93), `IntermediateField.le_maximalUnramifiedExtension_iff` (same file),
the three `Unramified/Factorization.lean` theorems, `discriminantExponent_tower`
(`Discriminant/Tower.lean` 42, under `[IsScalarTower K L M] [ValuativeExtension K L]
[ValuativeExtension L M] [Algebra.IsSeparable K M]`, as the contract states),
`TauCeti.discriminantExponent` (`Discriminant/Basic.lean` 137), `…_eq_zero_iff`,
`…_eq_of_algEquiv` (same file), `inertiaDegree` (`InertiaDegree.lean` 71, `finrank 𝓀[K] 𝓀[L]`),
`ramificationIndex_mul_inertiaDegree`, the four `finiteIntermediateField*` adapters
(`FiniteExtension/IntermediateField.lean`); Mathlib `Algebra.FormallyEtale.iff_exists_algEquiv_prod`
(`RingTheory/Etale/Field.lean`), `Equiv.Perm.card_of_cycleType` (`GroupTheory/Perm/Centralizer.lean`
693, `n!/((n − m.sum)! · m.prod · ∏ (count)!)`), `MulAction.index_stabilizer` (`GroupTheory/Index.lean`
937), `IsSepClosure.equiv` (`FieldTheory/IsSepClosed.lean`), `krullTopology`
(`FieldTheory/KrullTopology.lean` 133, an instance), `isOpen_iff_finite`
(`FieldTheory/Galois/Infinite.lean`), `Nat.Partition` (`Combinatorics/Enumerative/Partition/Basic.lean`
52), `IntermediateField.extendScalars` (`IntermediateField/Basic.lean` 796).

**Beyond the pin, on Tau Ceti main** (the names README lines 87–95 and the Lean docstring cite):
`MassFormula/Main.lean` 72, `MassFormula/Orbit.lean` 67, `MassFormula/Basic.lean` 168 and 283,
`FieldTheory/IntermediateField/Isomorphic.lean` 107, all present with the statements the README
gives them, and `Isomorphic.lean` 107 carries `[Algebra.IsSeparable K E]`, which every
subextension of `SeparableClosure K` satisfies. `IntermediateField.inertiaDegree` exists nowhere;
the README (line 68) proposes it as the home of this roadmap's `intermediateFieldInertiaDegree`,
which is a target, not a citation.

**Cross-roadmap citations.** MassFormula on main: `### Layer 4: the mass formulas` (README line
350, the anchor as linked), `Suggested.lean` lines 448 (Theorem 1), 467 (orbit count), 136 and
248 (the wrapper and its invariance): all present. LocalFieldsRamification on main under
`Completed/`: every cited declaration at the pin (above). PadicExtensionFamilies at the head of
its pull request is a consumer only (its README lines 82, 241, 291, 480, 1472, 1635, 1650, 1757
cite "EtaleMassFormula §1.1", "§1.2", "§§1.1–1.2", Layer 1); nothing here names it as a supplier.
Depcheck: `depcheck: 241 roadmaps, 2310 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line;
this roadmap is on main and so no longer in the merge order. Ownership: `roadmaps grep` over
main and the 457 indexed open pull requests for "Galois set", "étale mass|etaleMass", "splitting
symbol|splittingSymbol" and "Bhargava … mass": the only other roadmap stating any of these is the
same author's draft pull request #1820 on this same folder (a Layer 4 extension, opened after
this one), which is this folder's own successor and not a second owner; ArithmeticStatisticsPartV
(#1175) uses "splitting symbol" for its own global counts and cites nothing here.

**Sources (seeded sample, all thirteen subsections).** kedlaya2007b (arXiv math/0511135v4, cache
`ba2577e5…`): lines 44–57, Theorem 1.1 (Bhargava), `∑ 1/(w(L) q^{c(L)}) = ∑_{k=0}^{n} P(n,n−k)/q^k`
with `P(n, 0) = 1` for `n = 0`, `0` for `n > 0`: exactly §3.3 and the introduction's `∑_{k=0}^{n}`
(repaired in this pull request); Lemma 3.1 (158–174: étale algebras ↔ continuous `G_K → S_n` up
to conjugation, fields ↔ transitive), Lemma 3.2 (177–182, `Aut(L) = ` centralizer), Lemma 3.4
(189–195, the discriminant exponent is additive and equals the conductor): §0.4; (4.0.1) at
229–242, `(1/n!) ∑_{f(ρ)=f} q^{−c(ρ)} = q^{f−n}/f` from Serre over `K_f` with `n!/f` labellings:
§§2.1–2.3; Remark 4.1 (300–304): the single-type formulas are Bhargava's. Kedlaya's bibliography
entry [4] (978–979) is "preprint", so his "Theorem 1", "Propositions 1–3" and "§8" (lines 42, 204,
142) are the preprint's numbering, as the README's References entry says. wood2008 (Algebra &
Number Theory 2, cache `e9ccbf95…`): (1-1) at 37–44 (sum to `n − 1`, `p(k, n−k)` partitions of `k`
into at most `n − k` parts); 174–181: the type `(f_1^{e_1} ⋯ f_r^{e_r})`, `L_i` the fixed field
of a point stabilizer, `[L_i:K] = |m_i|`, `e_i` its ramification index, `f_i` its residue degree:
`splittingSymbol`; 342: the mass by type is Bhargava's. yasuda2025 (arXiv 2408.13481, cache
`c6e14438…`): (1.2) at 22–32, the same formula with `P(n, n−j)`. arXiv 2006.12991v2 (cache
`d30c7454…`, fetched this round): line 103 cites "Theorem 1.1 of [Bha07]" for the IMRN article
(398–399), and line 102 gives the quintic total mass `1 + p⁻¹ + 2p⁻² + 2p⁻³ + p⁻⁴`, which is the
`n = 5` value of §3.3 (`q(k, 5−k) = 1, 1, 2, 2, 1`). Serre's Theorem 1 is consumed from the mass
formula roadmap and not re-verified.

**Adversarial table** (`q` the residue cardinality; a symbol is a multiset of pairs `(f, e)`):

| statement | instances | values each side | result |
|---|---|---|---|
| `etaleMass K 0`, `etaleMass_eq` at `n = 0` | the one Galois set on `Fin 0`, weight `0` | `(0!)⁻¹ · 1 = 1`; `q(0,0) q⁰ = 1` | holds |
| `etaleMass_eq`, `n = 1` | symbol `{(1,1)}` | `1`; `q(0,1) = 1` | holds |
| `etaleMass_eq`, `n = 2`, `K = ℚ_2` | `K×K`, `ℚ_4`, six ramified quadratics (`d = 2,2,3,3,3,3`) | `1/2 + 1/2 + (2·2⁻² + 4·2⁻³)/2 = 3/2`; `1 + 2⁻¹` | holds |
| `etaleMass_eq`, `n = 2`, `p` odd | two ramified quadratics, `d = 1`, `#Aut = 2` | `1 + p⁻¹`; `q(0,2) + q(1,1) p⁻¹` | holds |
| `etaleMass_eq`, `n = 3, 4, 5` | `q(k, n−k)` | `1 + q⁻¹ + q⁻²`; `1 + q⁻¹ + 2q⁻² + q⁻³`; `1 + q⁻¹ + 2q⁻² + 2q⁻³ + q⁻⁴` | match §3.3 and the published quintic value (arXiv 2006.12991 line 102) |
| `etaleMass_eq`, term `k = n > 0` | `q(n, 0)` | `0` | `∑_{k ≤ n}` equals Bhargava's `∑_{k < n}`; the Lean `Finset.range (n+1)` with `parts.card ≤ n − k` gives the same |
| `tsum_isTransitive` (no `hg`) | `n = 1`; `n = 2`, `ℚ_2`; `n = 3`, `g` = indicator of `ℚ_2(∛2)` | `g ⊥ = 0! · g ⊥`; `1 + 2·2⁻² + 4·2⁻³ = 2 = 1! · 2`; `2 = 2! · 1` | holds without invariance |
| `tsum_isTransitive`, `n ≥ 1` | infinite `L` | `finrank = 0 ≠ n` | junk value never enters |
| `tsum_inertiaDegree_eq` | `(2,1)`; `(1,2)` over `ℚ_2`; `(1,2)`, `p` odd; `𝔽_p((t))`, `(1,p)` | `1 = 1·q⁰`; `2/4 + 4/8 = 1 = 2·2⁻¹`; `2/p`; infinitely many `L`, `d = c + p − 1`, sum `= p q^{−(p−1)}` finite | holds |
| `etaleMass_isTransitive_splittingSymbol` | `(2,1)`; `(1,2)` over `ℚ_2`; general | `1/2 = 1/(2q⁰)`; `1/2`; `(fe−1)! e q^{−f(e−1)}/(fe)! = q^{−f(e−1)}/f` | holds; `{(f,e)}` on `Fin (fe)` forces one orbit, so the subtype is exactly the transitive sets of residue degree `f` |
| `splittingSymbol` | `n = 0`; trivial action; `ρ` onto `S_2` with kernel fixing `ℚ_2(i)` | `∅`; `n·{(1,1)}`; `{(1,2)}` | matches the Checks; `finrank / f` exact since `f ∣ [F:K]` |
| `splittingSymbolAut`, `splittingSymbolExponent` | `{(2,2)}`; `{(1,3),(1,1)}`; `{(1,2),(1,2)}`; `{(1,2),(1,1)}` | `2`, `2`; `1`, `2`; `2`, `2`; `1`, `1` | agree with the block count `n!/∏(f_ie_i)! · 1/∏ m! · ∏ (f_ie_i)! q^{−f_i(e_i−1)}/f_i` |
| `etaleMass_splittingSymbol` | `{(1,1),(1,1)}`; `{(1,2),(1,1)}`; `{(1,2),(1,2)}`; `∅`, `n = 0` | `1/2`; `(1/3!)·3·2q⁻¹ = q⁻¹`; `3·(2q⁻¹)²/4! = 1/(2q²)`; `1` | holds |
| `etaleMass_splittingSymbol`, hypotheses | `σ = {(0,1)}`, `n = 0`; `σ = {(1,1)}`, `n = 2` | left `0`, right `⊤`; left `0`, right `1` | `hσ`, `hn` each necessary |
| `ramificationPartition` | `{(2,2)}`; `{(1,3),(1,1)}`; `{(1,1),(2,1)}` | `(1,1)`; `(2)`; `∅` | matches "each `e_i − 1` repeated `f_i` times, zeros dropped" |
| `etaleMass_ramificationPartition` | `n = 4`, `π = (1,1)`; `n = 5`, `π = (1,1)`; `π = (2)`, `n = 4`; `π = ∅` | `1/2 + 1/2`; `1/2 + 1/2`; `1`; `∑_{λ⊢n} 1/z_λ = 1` | each `→ q^{−k}`; holds |
| `etaleMass_ramificationPartition`, hypotheses | `n = 3`, `k = 2`, `π = (1,1)` | left `0 ≠ q⁻²` | `hπ` necessary; `k > n` makes `n − k = 0` and the statement vacuous, never false |
| `∑_{π(σ)=π} 1/#Aut(σ) = 1` | `S_{n_0} × ⋯ × S_{n_k}`, `n_0 = n − k − #parts` | `#Aut(σ) = ∏_t ∏ i^{m_i} m_i!` = centralizer orders; `∑ #class/|G| = 1` | the §3.2 route is right including `t = 0` (`card_of_cycleType` counts fixed points as `(n − m.sum)!`) |
| `tsum_etaleDiscriminantExponent` | `n = 0` (the zero ring: étale, `#Aut = 1`, no maps to a field, weight `0`); `n = 2`, `ℚ_2` | `1 = M_0`; `3/2 = M_2` | holds; `n!/#Aut(A)` Galois sets per class |
| `etaleDiscriminantExponent_pi` | `ι = ∅`; `(ℚ_2(i), ℚ_2)` | `0`; orbits of sizes `2, 1`, `2 + 0 = 2` | holds |
| `orbitDiscriminantExponent`, new §0.1 Check | countably many copies of `G/H`, `H` fixing `ℚ_2(i)`; plus `Y = G/H` | `∑ᶠ` over infinite support `= 0`; `d(X ⊔ Y) = 0`, `d(Y) = 2` | the Check's values are right; additivity needs finitely many orbits |
| `GaloisSet.finrank_fixedField_stabilizer` | trivial `ρ`, `n = 2`; `ρ` onto `S_2`, kernel fixing `ℚ_2(i)` | `finrank ⊥ = 1 = #orbit`; `2 = 2` | holds (stabilizer ⊇ kernel open, hence closed, Galois correspondence, `index_stabilizer`) |
| `…_fixedField_stabilizer_smul` | `σHσ⁻¹`, `H` open; `H` not open | `K`-isomorphic fields, equal `d`; both infinite, `0 = 0` | holds |
| `inf_maximalUnramifiedExtension` | `⊥`; `ℚ_2(i)`; `ℚ_4`; `K^ur` | `⊥ = K_1`; `⊥ = K_1`; `ℚ_4 = K_2`; `K^ur ≠ K_0 = ⊥` | holds; finiteness necessary |
| `natCard_algEquiv_eq_mul` | `ℚ_2(ζ_12)`; `ℚ_2(∜−3)`; `ℚ_4`; `⊥` | `4 = 2·2`; `2 = 2·1` (every `ℚ_2`-automorphism sends `θ` to `±θ`, so fixes `θ² = √−3`: image trivial); `2 = 1·2`; `1 = 1·1` | holds |
| `ncard_isomorphic_mul_natCard_algEquiv_eq_finrank` | `ℚ_4`; `ℚ_2(∜−3)`; `⊥` | `1·2 = 2`; `2·2 = 4`; `1·1 = 1` | holds; equals `Isomorphic.lean` 107 with `Ω = SeparableClosure K` |
| §1.1 Checks | quadratic `ℚ_2`; cubic `ℚ_3`; quartic `ℚ_2`, `f = 2` | `7`; `10`; `#ℚ_4^×/squares = 2^{2+2} = 16`, `14` ramified; Frobenius-fixed ramified classes `6` (the `7` Galois quartics over `ℚ_2` containing `ℚ_4`: `3` of type `V_4`, `4` cyclic by counting order-`4` characters with square the unramified quadratic character, minus `ℚ_16`), `4` swapped pairs, `10` orbits, `6·1 + 4·2 = 14` | holds |
| `intermediateFieldInertiaDegree_eq_of_algEquiv` | finite; infinite | invariance of `finrank 𝓀[K] 𝓀[L]`; `0 = 0` | holds |
| weight convention | `ℚ_2(i)`: `d = v_2(−4) = 2`, `c = d − e + 1 = 1` | agrees with the mass formula roadmap's `ℚ_2` example | consistent |
| generality | README "every non-archimedean local field"; Lean `[IsNonarchimedeanLocalField K]`, sums in `ℝ≥0∞` | equal; equal characteristic included | consistent |

Other checks: `GaloisSet` (open kernel) is continuity for the discrete target; `homMulAction` is a
left action; the Layer 2 transport is sound (`SeparableClosure K` is a separable closure of `K_f`;
degree, total ramification and `δ(·/K_f)` are isomorphism invariants); the hypotheses `hn`, `hf`,
`he`, `hσ`, `hπ` are each used (table); the §1.1 inseparable remark is harmless since §1.1 is
README only and every Lean carrier is a subextension of `SeparableClosure K`.

## Not verifiable

- Bhargava 2007 (IMRN rnm052): no legal full text (publisher HTTP 403 to the sources service, no
  arXiv, author or repository copy; the copies a web search returns are on hosts in no licence
  class). Its statements as the README gives them are confirmed through kedlaya2007b, wood2008,
  yasuda2025 and arXiv 2006.12991 (above); "Thm. 1.1" is confirmed by a citer of the published
  article; "Props. 2.1–2.3", "eqs. (2.1)–(2.4)", "the Appendix" and the claim about the product
  "from `t = 1`" are not (wood2008 cites the published article as "Proposition 1" and "Section
  8.2" at lines 342 and 128). The scratch `needs-references.toml` records the failed fetch; the
  board package has no `sources.toml`, so the work is recorded nowhere as `uncertified`.
- Ownership against open pull requests beyond those whose files the brief lists was checked only
  through `roadmaps grep` over the 457 indexed pull requests.
- The dependency checker prints only its summary line; it reports no UPWARD, CYCLE or `moved:` line.

## Source issues

- none
