# Review of EtaleMassFormula (pull request #1792 at 4802879)

**Verdict:** needs changes

One blocking finding (R01) and four P3. The mathematics of every stated theorem held on every
instance computed (table under *Verified sound*); the blocking finding is a supplier claim that is
false at the pin, carried over from the previous review.

## The previous review's findings at this head

- R01 (Layer 1 two owners): **repaired on both sides.** PadicExtensionFamilies at the head of its
  open pull request no longer has §0.6; its README lines 81–82, 241, 1472, 1635, 1650 and 1757 cite
  "EtaleMassFormula §1.1", "§1.2" and "Layer 1", and its *Not owned here* list (line 1928) defers
  the étale mass formula here. This README names PadicExtensionFamilies only as a deferral (line 38)
  and never as a supplier.
- R02 (Theorem 1 "implemented in Tau Ceti"): **partly repaired.** The Lean form is now cited from
  the mass formula roadmap (README lines 79–80), but lines 87–91 still say "In Tau Ceti these are
  `TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent` (`…/MassFormula/Main.lean`) …
  Consume them by those names." See R01 below.
- R03 (import of another roadmap's module): **repaired**; the imports are `Mathlib` and five
  `TauCeti.*` modules, all of which exist at the pin.
- R04 (module-system warnings): **partly repaired**; the four transitive warnings are gone, the
  file's own remains and the gate still fails on it (R02 below).
- R05 (pull-request numbers), R06 (TeX display), R07 (`readme-ids-missing`): **repaired** (gate
  `prnum=0 tex=0 readme-ids-missing=0`).
- R08 (Bhargava locators): **not repaired**; the README now asserts a published numbering nobody
  here has read, against what the citing literature uses (R03 below).
- R09 (README shape): **mostly repaired**: the upstream headings, `*Needs:*` lines and Checks are
  in; `## Downstream consumers` and `### Examples` are still absent (R05 below).
- R10 (`etaleMass_unramified`, redundant conjunct): **repaired**; both deleted.
- R11 (module docstring): **repaired**.

## R01 (P2) — Serre's Theorem 1 is still cited as a Tau Ceti declaration that does not exist

Location: `TauCetiRoadmap/EtaleMassFormula/README.md` lines 87–91 ("In Tau Ceti these are
`TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent`
(`TauCeti/NumberTheory/LocalField/MassFormula/Main.lean`) … Consume them by those names") and line
68 ("The first is Tau Ceti's `IntermediateField.discriminantExponent`; the second goes beside it as
`IntermediateField.inertiaDegree`").

Claim: Theorem 1, the orbit count and the wrapper are implemented in Tau Ceti under those names and
files, and implementers consume them by those names.

Witness: at the pinned Tau Ceti (`358314d4`, the same pin as the content repository) there is no
directory `TauCeti/NumberTheory/LocalField/MassFormula/` at all, and no declaration whose name
contains `wildExponent` or `ncard_isomorphic` (listing of `NumberTheory/LocalField/`, grep over the
package). On main, `TauCetiRoadmap/MassFormula/STATUS.md` line 12 says "In Layer 4, everything
except Theorem 1 is either proved or reduced to it … neither mass formula is proved in general",
and line 38 lists Theorem 1 as still to do; its `PROGRESS.md` records only the orbit count
(`TauCeti.ncard_isomorphic_mul_natCard_algEquiv`, module `MassFormula.Orbit`) and the wild
exponent as landed. A name for `IntermediateField.inertiaDegree` exists nowhere.

Repair: delete the sentence at lines 87–91 and the two "is Tau Ceti's" clauses at lines 67–68.
Say instead that Theorem 1, the orbit count and the invariance are the mass formula roadmap's
Layer 4 and Layer 0 targets, consumed by the names of its `Suggested.lean`
(`MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent`,
`MassFormula.ncard_isomorphic_mul_natCard_algEquiv`,
`MassFormula.intermediateFieldDiscriminantExponent_eq_of_algEquiv`, lines 448, 467 and 248 on
main), and that the orbit count and the wrapper have Tau Ceti implementations beyond the pin
(`TauCeti.ncard_isomorphic_mul_natCard_algEquiv`, `IntermediateField.discriminantExponent`) which
replace the roadmap names when the pin moves. Nothing is said to be implemented that the
supplier's own status record lists as missing. The Lean file needs no change: it cites Theorem 1
from the README only.

## R02 (P3) — Gate `build`: the module-system warning fails the gate

Location: `TauCetiRoadmap/EtaleMassFormula/Suggested.lean` line 1; `gate.md` at 4802879:
`build=1 FAIL`, "imports `Mathlib` from package `mathlib`, which is designed for use with the
module system; consider adding `module`".

Witness: my own `lake env lean` run of a copy of the file gives exactly 16 `declaration uses sorry`
warnings and no error (exit 0), so the build itself is fine; the worker's gate counts this warning
as a build failure, and no acceptance is possible while it does. Fourteen roadmaps on main
already use the module header.

Repair: make the file a module file: first line `module`, then `public import Mathlib` and
`public import TauCeti.…` for the five Tau Ceti modules, the docstring, `@[expose] public section`,
then the namespace. The declarations need no change.

## R03 (P3) — Bhargava's numbering is asserted for a text nobody has read, against the citing literature

Location: `TauCetiRoadmap/EtaleMassFormula/README.md` lines 436–438 ("Numbering of the published
article: Thm. 1.1, Props. 2.1–2.3, eqs. (2.1)–(2.4), and §8 … (the preprint numbers them Theorem 1
and Propositions 1–3)"), the locators at lines 6, 342, 368, 377, 383, 394, 409, and lines 389–391
("⚠ … [Bhargava 2007] writes the product from `t = 1`"); `Suggested.lean` lines 185, 293, 310,
315, 336, 349, 355, 368.

Claim: the published IMRN article numbers its results Thm. 1.1, Props. 2.1–2.3 and eqs.
(2.1)–(2.4), and its proof of the partition formula omits the unramified component.

Witness: the article is not legally readable here (the sources service gets HTTP 403 from the
publisher for doi 10.1093/imrn/rnm052, twice, and finds no author or repository copy). The two
texts that cite the *published* article number it otherwise: wood2008 (Algebra & Number Theory 2,
whose bibliography entry at lines 625–626 is "Int. Math. Res. Not. 2007:17, rnm052") writes
"[Bhargava 2007, Proposition 1]" for the mass formula by type (lines 200 and 342), "Section 2"
for the symbols (line 178) and "Section 8.2" (line 128); kedlaya2007b writes "[4, Theorem 1]"
(line 42), "[4, Propositions 1–3]" (line 204) and "[4, §8]" (line 142). Nothing read here
supports "2.1–2.3", "(2.4)" or the claim about the product "from `t = 1`".

Repair: cite the numbering the published article's citers use (Theorem 1, Propositions 1–3, §2
for the symbols and `#Aut(σ)`, §8 for general local fields) and say in the References entry that
the locators are taken through Kedlaya 2007 and Wood 2008 because the text is paywalled; delete
the sentence "[Bhargava 2007] writes the product from `t = 1`" and the ⚠ marker, keeping the
mathematical remark that the `t = 0` component `S_{n_0}` is part of the count. The package has no
`sources.toml`; Bhargava 2007 should be recorded there as `uncertified` with its DOI.

## R04 (P3) — `tsum_isTransitive` carries an unused invariance hypothesis

Location: `Suggested.lean` lines 150–159 (`hg : ∀ L M, Nonempty (L ≃ₐ[K] M) → g L = g M`);
README lines 186–189 ("for every weight `g` on subextensions invariant under `K`-isomorphism").

Claim: the transitive bridge needs `g` to be an isomorphism invariant.

Witness: the fibre of `ρ ↦ fixedField (stabilizer 0)` over a subextension `L` of degree `n` is
the set of bijections `G/H ≅ Fin n` with `H ↦ 0` for `H = fixingSubgroup L`, of size `(n − 1)!`,
whatever `g` is. Instance: `K = ℚ_2`, `n = 3`, `g` the indicator of `L_0 = ℚ_2(∛2)` inside
`SeparableClosure ℚ_2` (not invariant: its conjugate `ℚ_2(ζ_3 ∛2)` is a different subextension
with `g = 0`). Left side: the transitive `ρ` with `fixedField (stabilizer 0) = L_0` number
`2! = 2`; right side: `2! · 1 = 2`. Equal without `hg`.

Repair: drop `hg` from the theorem and "invariant under `K`-isomorphism" from the sentence at
line 187; invariance is needed only later, in 2.3, where it makes the orbit weight well defined,
and is cited there already.

## R05 (P3) — README shape: no `## Downstream consumers`, no `### Examples`, supplier section mis-located

Location: whole README; line 94 ("From [LocalFieldsRamification, layer 2 unramified extensions
and Frobenius]").

Witness: the folder has no `## Downstream consumers` section although PadicExtensionFamilies
consumes §§1.1–1.3 by name (its README lines 82, 1472, 1650, 1757), and no layer ends with
`### Examples` (only `### Dependencies`, lines 225, 302, 354, 420). The LocalFieldsRamification
contract is headed "layer 2 unramified extensions and Frobenius" but lists the discriminant
exponent, its tower law and its invariance, which that roadmap builds in its Layer 3
(`Completed/LocalFieldsRamification/README.md` lines 1044–1049, "the local discriminant exponent
`δ(L/K) := v_K(𝔩_{L/K})` … invariant under a `K`-algebra isomorphism"), and the
`finiteIntermediateField*` adapters, which are Layer 0.

Repair: add `## Downstream consumers` naming PadicExtensionFamilies and the sections it takes
(§1.1 the classification, §1.2 the automorphism count, §1.3 the orbit count); end each layer with
`### Examples` (the worked values already in the Checks: the `ℚ_2` quadratic masses, the quartic
orbit count, `M_4`); split the LocalFieldsRamification contract by its layers (Layer 0 for the
adapters and `inertiaDegree`, Layer 2 for the unramified extensions and the factorization, Layer 3
for the discriminant exponent, its tower law and `discriminantExponent_eq_zero_iff`).

## Verified sound

Gate at 4802879 (`gate.md`): every scanner 0 (`set_option`, `prnum`, `tex`, `imports`,
`mathlib-subimports`, `sorry-data`, `readme-ids-missing`, `stray-files`, `outside-folder`,
`dirty`, `depcheck`, `metadata`); only `build=1`, the module warning (R02). `git diff --stat
origin/main...HEAD` outside the folder: empty. `metadata.toml`: `topic = "math.NT"`. The folder
holds `README.md`, `Suggested.lean`, `metadata.toml` only.

Elaboration: `lake env lean` on a scratch copy of `Suggested.lean`: 16 `declaration uses sorry`,
no other diagnostic, exit 0. One-tactic probe on a second copy (each `sorry` replaced by
`first | rfl | simp | infer_instance | simp [etaleMass, …] | sorry`): every one of the 16
sorried theorems either fell through to `sorry` or left `simp` with an unsolved goal; none closed,
so nothing is padding by that test. Elaborated types (the worker's `signatures.md`, 30
declarations) compared with the README: every theorem carries
`[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` as the
Conventions state; the four declarations the worker flagged as dropping binders (`GaloisSet`,
`GaloisSet.mulAction`, `GaloisSet.IsTransitive`, `homMulAction`) keep only `[Field K]` because
their types mention no local-field structure, which is correct: a Galois set is a continuous
permutation representation of `Gal(K^sep/K)` for any field `K`. No `def` lost a binder its README
statement needs. No `set_option`, no sorried data, no `lemma`, imports `Mathlib` plus five
`TauCeti.*` modules that exist at the pin. All four headline theorems (`etaleMass_eq`,
`etaleMass_splittingSymbol`, `etaleMass_ramificationPartition`, `tsum_etaleDiscriminantExponent`)
are stated; the docstring says all are statable. Every backticked name of the roadmap's own in the
README is declared (gate `readme-ids-missing=0`), and every Lean name appears in the README.

Library declarations opened at the pins (Mathlib `f6090c70`, Tau Ceti `358314d4`):
`TauCeti.unramifiedExtension` (`Unramified/Existence.lean` 85, `adjoin K` of the roots of
`X^{q^f} − X`, so `K_0 = ⊥` as the §1.3 Check says), `TauCeti.isGalois_unramifiedExtension`
(210, an instance), `TauCeti.existsUnique_isUnramified_finrank_eq` (386, `f ≠ 0`),
`TauCeti.maximalUnramifiedExtension` (`Unramified/Maximal.lean` 93, `⨆ f`),
`IntermediateField.le_maximalUnramifiedExtension_iff` (253, `[IsSepClosed Ω]`),
`TauCeti.eq_unramifiedExtension_inertiaDegree_iff`, `…isTotallyRamified…`,
`…finrank_unramifiedExtension_inertiaDegree_eq_ramificationIndex` (`Unramified/Factorization.lean`
144, 124, 106), `TauCeti.discriminantExponent_tower` (`Discriminant/Tower.lean` 42:
`δ(M/K) = [M:L] δ(L/K) + f(L/K) δ(M/L)` under `[IsScalarTower K L M] [ValuativeExtension K L]
[ValuativeExtension L M] [Algebra.IsSeparable K M]`, as the contract states),
`TauCeti.discriminantExponent` (`Discriminant/Basic.lean` 137, requires `[Algebra.IsSeparable K L]`,
supplied for subextensions of `SeparableClosure K`), `…_eq_zero_iff` (215, `↔ IsUnramified K L`),
`…_eq_of_algEquiv` (251), `TauCeti.inertiaDegree` (`InertiaDegree.lean` 71, `finrank 𝓀[K] 𝓀[L]`),
`TauCeti.ramificationIndex_mul_inertiaDegree` (101), the four `TauCeti.finiteIntermediateField*`
adapters (`FiniteExtension/IntermediateField.lean` 71, 77, 83, 99). Mathlib:
`Algebra.FormallyEtale.iff_exists_algEquiv_prod` (`RingTheory/Etale/Field.lean` 194, needs
`[EssFiniteType K A]`, which `Algebra.Etale` (`Etale/Basic.lean` 205, formally étale and finitely
presented) supplies), `Equiv.Perm.card_of_cycleType` (`GroupTheory/Perm/Centralizer.lean` 693,
`n!/((n − m.sum)! · m.prod · ∏ (count)!)`, the fixed points counted as `(n − m.sum)!`, which is why
the `t = 0` component of §3.2 is needed), `MulAction.index_stabilizer` (`GroupTheory/Index.lean`
937, `index = orbit.ncard`), `IsSepClosure.equiv` (`FieldTheory/IsSepClosed.lean` 309),
`krullTopology` (`FieldTheory/KrullTopology.lean` 133, an instance, so the `IsOpen` in `GaloisSet`
elaborates against it), `InfiniteGalois.isOpen_iff_finite` (`FieldTheory/Galois/Infinite.lean`
241, open fixing subgroup ↔ finite subextension), `Nat.Partition`
(`Combinatorics/Enumerative/Partition/Basic.lean` 52, positive parts summing to `n`),
`IntermediateField.extendScalars` (`IntermediateField/Basic.lean` 842).

Cross-roadmap citations resolved: MassFormula on main (`### Layer 4: the mass formulas`, anchor
as linked; Theorem 1 for `0 < n` in `ℝ≥0∞`, the orbit count, the Layer 0 wrapper and its
invariance: all present as targets, `Suggested.lean` lines 448, 467, 136, 248);
LocalFieldsRamification on main under `Completed/` (every cited Tau Ceti declaration found at the
pin; layer attribution in R05); PadicExtensionFamilies at its open head (a consumer, not a
supplier: no `*Needs:*` line, supplier row or "Supplied by" names it; the merge order lists it at
376 and this roadmap at 378, so the direction on this side is right, and the upward citation on
its side is that pull request's to resolve); the ArithmeticStatistics roadmaps (deferrals only).
Ownership: `roadmaps grep` over main and the 455 indexed open pull requests for "Galois set",
"Bhargava", "splitting symbol|splitting type", "étale mass|etaleMass", "unramified part" and
"mass formula": no roadmap other than this one states Bhargava's formula, the Galois-set weight,
the splitting symbol or the classification by unramified part; ArithmeticStatisticsPartI's
`finsum_stabilizerWeight` is the finite orbit–stabilizer identity, not this. Depcheck output:
`depcheck: 236 roadmaps, 2064 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for
EtaleMassFormula.

Sources (seeded sample: all thirteen subsections). kedlaya2007b (arXiv math/0511135v4): lines
44–57, Theorem 1.1 (Bhargava) `∑ 1/(w(L) q^{c(L)}) = ∑_{k=0}^{n} P(n, n−k)/q^k` with
`P(n, n − k)` the partitions of `k` into at most `n − k` parts and `P(n, 0) = 1` for `n = 0`,
`0` for `n > 0`: exactly §3.3's `∑_{k ≤ n}` with the `n = 0` value `1` (§3.3, `etaleMass_eq`);
Lemma 3.1 (lines 158–174, étale algebras ↔ continuous `G_K → S_n` up to conjugation, fields ↔
transitive), Lemma 3.2 (177–182, `Aut(L) =` centralizer), Lemma 3.4 (189–195, discriminant
exponent additive over factors, equal to the conductor of the permutation representation): §0.4
(`tsum_etaleDiscriminantExponent`, `etaleDiscriminantExponent_pi`); the totally ramified case
of Serre's formula in Galois-set form (205–214) and (4.0.1) (lines 229–242,
`(1/n!) ∑_{ρ transitive, f(ρ)=f} q^{−c(ρ)} = q^{f−n}/f`, with `c(ρ) = f c(ρ_f)` and the count
of labellings `n!/f`): §§2.1–2.3 (`tsum_inertiaDegree_eq`, `etaleMass_isTransitive_splittingSymbol`,
`q^{−f(e−1)}/f = q^{f−n}/f` for `n = fe`); Remark 4.1 (300–304): the single-splitting-type
formulas are Bhargava's. wood2008 (Algebra & Number Theory 2): equation (1-1) (lines 37–44, sum
to `n − 1`, `p(k, n−k)` partitions of `k` into at most `n − k` parts); lines 174–181: the type
`(f_1^{e_1} ⋯ f_r^{e_r})` with unordered formal symbols, `L_i` the fixed field of a point
stabilizer, `[L_i : K] = |m_i|`, `e_i` its ramification index and `f_i` its residue degree,
exactly `splittingSymbol`; line 200: Bhargava proved the mass formulas by type for all local
fields (§3.1). yasuda2025 (arXiv 2408.13481): (1.2) at lines 23–32, the same formula with
`P(n, n − j)`. Serre's Theorem 1 is consumed from the mass formula roadmap and not re-verified.

Adversarial table (`q` the residue cardinality; a symbol is a multiset of pairs `(f, e)`):

| statement | instances | values each side | result |
|---|---|---|---|
| `etaleMass K 0`, `etaleMass_eq` at `n = 0` | the single Galois set on `Fin 0`, weight `0` (empty finsum) | `(0!)⁻¹ · 1 = 1`; right side `q(0,0) · q⁰ = 1` | holds |
| `etaleMass_eq`, `n = 1` | symbol `{(1,1)}` | `1`; `q(0,1) = 1` | holds |
| `etaleMass_eq`, `n = 2`, `K = ℚ_2` | classes `K×K`, `ℚ_4`, six ramified quadratics (`d = 2,2,3,3,3,3`: discriminants `−4`, `12`, `±8`, `±40`) | `1/2 + 1/2 + (2·2⁻² + 4·2⁻³)/2 = 3/2`; `1 + 2⁻¹ = 3/2` | holds |
| `etaleMass_eq`, `n = 2`, `p` odd | two ramified quadratics, `d = 1`, `#Aut = 2` | `1 + 2·(1/2)p⁻¹ = 1 + p⁻¹`; `q(0,2) + q(1,1)p⁻¹` | holds |
| `etaleMass_eq`, `n = 3, 4` | symbols by exponent | `M_3 = 1 + q⁻¹ + q⁻²` (`q(2,1) = 1`); `M_4 = 1 + q⁻¹ + 2q⁻² + q⁻³` (`q(2,2) = 2`: symbols `{(1,2),(1,2)}`, `{(2,2)}` each `1/2`, `{(1,3),(1,1)}` mass `1`) | holds, matches the §3.3 Checks |
| `etaleMass_eq`, `k = n > 0` term | `q(n, 0)` | `0` (no partition of `n > 0` into `0` parts) | the `∑_{k ≤ n}` form equals Bhargava's `∑_{k < n}` |
| `tsum_isTransitive` | `n = 1`; `n = 2`, `ℚ_2`; `n = 3`, `g` = indicator of `ℚ_2(∛2)` | `1 = 0!·1`; `1 + 2·2⁻² + 4·2⁻³ = 2 = 1!·2`; `2 = 2!·1` | holds; the last instance shows `hg` unused (R04) |
| `tsum_inertiaDegree_eq` | `(f,e) = (2,1)`; `(1,2)` over `ℚ_2`; `(1,2)`, `p` odd; general | `1 = 1·q⁰`; `2/4 + 4/8 = 1 = 2·2⁻¹`; `2/p`; `d(L/K) = f·d(L/K_f)` (tower law with `δ(K_f/K) = 0`), `c = d(L/K_f) − e + 1`, so `∑ q^{−d} = q^{−f(e−1)} ∑ (q^f)^{−c} = e q^{−f(e−1)}` | holds |
| `tsum_inertiaDegree_eq`, finiteness | `finrank = f e > 0` | forces `Module.Finite`, so the totalized `f` and `d` are the true invariants | junk value never enters |
| `etaleMass_isTransitive_splittingSymbol` | `(2,1)`; `(1,2)` over `ℚ_2`; general | `(1/2!)·1!·1 = 1/2 = 1/(2q⁰)`; `(1/2)·1 = 1/2`; `(fe−1)!·e·q^{−f(e−1)}/(fe)! = q^{−f(e−1)}/f` | holds; equals kedlaya2007b (4.0.1) `q^{f−n}/f` |
| `splittingSymbol` | `n = 0`; trivial action; `ρ` onto `S_2` with kernel fixing `ℚ_2(i)` | `∅`; `n·{(1,1)}` (`fixedField ⊥`, `f = 1`, `1/1`); `{(1,2)}` (`[F:K] = 2`, `f = 1`) | matches the Checks; `{(f,e)}` on `Fin (fe)` forces one orbit of size `fe`, `f` and `e = fe/f` |
| `splittingSymbolAut`, `splittingSymbolExponent` | `{(2,2)}`; `{(1,3),(1,1)}`; `{(1,2),(1,2)}`; `∅` | `2·1! = 2`, exp `2`; `1`, exp `2`; `1·2! = 2`, exp `2`; `1`, exp `0` | agree with the composition count `n!/∏(f_ie_i)! · 1/∏ m_x! · ∏ (f_ie_i)! q^{−f_i(e_i−1)}/f_i` |
| `etaleMass_splittingSymbol` | `{(1,1),(1,1)}`; `{(1,2),(1,1)}`; `{(1,2),(1,2)}`; `σ = ∅`, `n = 0` | `1/2 = 1/(1·2!)`; `3·2q⁻¹/3! = q⁻¹`; `3·(2q⁻¹)²/4! = 1/(2q²)`; `1 = 1/(1·q⁰)` | holds |
| `etaleMass_splittingSymbol`, hypotheses | `σ = {(0,1)}`, `n = 0`; `σ = {(1,1)}`, `n = 2` | left `0`, right `1/(0·1) = ⊤`; left `0`, right `1` | `hσ` and `hn` each necessary |
| `ramificationPartition` | `{(2,2)}`; `{(1,3),(1,1)}`; `{(1,1),(2,1)}`; bound | `(1,1)`; `(2)`; `∅`; `#parts = ∑_{e_i>1} f_i ≤ ∑ f_i = n − k` | matches "each `e_i − 1` repeated `f_i` times, zeros dropped" |
| `etaleMass_ramificationPartition` | `n = 4`, `π = (1,1)`; `n = 5`, `π = (1,1)` (`n_0 = 1`); `π = (2)`, `n = 4`; `k = 0` | `1/2 + 1/2 = 1`; `{(1,2),(1,2),(1,1)}`: `1/2`, `{(2,2),(1,1)}`: `1/2`, sum `1`; `{(1,3),(1,1)}`: `1`; unramified mass `∑_{λ ⊢ n} 1/z_λ = 1` | holds, each `→ q^{−k}` |
| `etaleMass_ramificationPartition`, hypotheses | `n = 3`, `k = 2`, `π = (1,1)`; `k > n` or `k = n > 0` | left `0 ≠ q⁻²` (`n_0 = −1`); `n − k = 0` admits no partition of `k > 0` | `hπ` necessary; the truncated subtraction only makes the statement vacuous, never false |
| `∑_{π(σ)=π} 1/#Aut(σ) = 1` | components `S_{n_0} × ⋯ × S_{n_k}`, `n_t = #{parts = t}`, `n_0 = n − k − #parts` | `#Aut(σ) = ∏_t ∏ i^{m_i} m_i! =` centralizer orders; `∑_{classes} #class/|G| = 1` | the §3.2 route is correct, including `t = 0` (`card_of_cycleType` counts fixed points as `(n − m.sum)!`) |
| `tsum_etaleDiscriminantExponent` | `n = 0` (the zero ring: étale, `#Aut = 1`, no maps to a field, weight `0`); `n = 2`, `ℚ_2` | `1/(1·1) = 1 = M_0`; `3/2 = M_2` | holds; `n!/#Aut(A)` Galois sets per class |
| `etaleDiscriminantExponent_pi` | `ι = ∅`; `(ℚ_2(i), ℚ_2)` | `0 = 0`; orbits of sizes `2, 1` (all embeddings of a separable `L_i` are conjugate), fixed fields `ℚ_2(i)`, `ℚ_2`: `2 + 0 = 2` | holds |
| `GaloisSet.finrank_fixedField_stabilizer` | trivial `ρ`, `n = 2`; `ρ` onto `S_2`, kernel fixing `ℚ_2(i)` | `finrank ⊥ = 1 = #orbit`; `2 = 2` | holds: stabilizer ⊇ kernel is open, hence closed, hence `fixingSubgroup (fixedField H) = H`, degree `= index = orbit.ncard` |
| `…_fixedField_stabilizer_smul` | `σ H σ⁻¹`, `H` open; `H` not open | `fixedField = σ(fixedField H)`, `K`-isomorphic, equal `d`; both infinite, `0 = 0` | holds with no hypothesis on `X` |
| `inf_maximalUnramifiedExtension` | `L = ⊥`; `ℚ_2(i)`; `ℚ_4`; `K^ur` (infinite) | `⊥ ⊓ K^ur = ⊥ = K_1` (the roots of `X^q − X` lie in `K`); `⊥ = K_1`; `ℚ_4 = K_2`; `K^ur ≠ K_0 = ⊥` | holds; `[FiniteDimensional K L]` necessary |
| `natCard_algEquiv_eq_mul` | `ℚ_2(ζ_12)`; `ℚ_2(∜−3)`; `ℚ_4`; `⊥` | `4 = 2·2` (abelian, `V_4`); `2 = 2·1` (`√−3` is not a square in `ℚ_2(ζ_12)`: `(x+y√3)² = ±(3+2√3)` needs `x² = (±3 ± √−3)/2 ∉ ℚ_2(√3)`, so `i ∉ ℚ_2(∜−3)`, and `−1 ∉ ℚ_4^{×2}` moves the class); `2 = 1·2`; `1 = 1·1` | holds |
| `ncard_isomorphic_mul_natCard_algEquiv_eq_finrank` | `ℚ_4`; `ℚ_2(∜−3)`; `⊥` | `1·2 = 2`; `2·2 = 4` (images `ℚ_2(θ)`, `ℚ_2(iθ)`); `1·1 = 1` | holds: embeddings with a given image form an `Aut_K(L)`-torsor |
| §1.1 Checks | quadratic `ℚ_2`; cubic `ℚ_3`; quartic `ℚ_2`, `f = 2` | `6 + 1 = 7`; `9 + 1 = 10`; `#ℚ_4^×/squares = 2^{2+2} = 16`, `14` ramified; Frobenius-fixed classes `8` (= the `7` Galois quartic fields over `ℚ_2` containing `ℚ_4`: `3` of type `V_4`, `4` cyclic, plus the trivial class), so `6` fixed ramified `+ 4` pairs `= 10` orbits, `6·1 + 4·2 = 14` | holds |
| `intermediateFieldInertiaDegree_eq_of_algEquiv` | finite; infinite | invariance of `finrank 𝓀[K] 𝓀[L]`; `0 = 0` | holds |
| weight convention | `ℚ_2(i)`: `d = v_2(−4) = 2`, weight `1/4`; `c = d − e + 1 = 1` | agrees with the mass formula roadmap's `ℚ_2` example (`2·2⁻¹ + 4·2⁻² = 2`) | consistent |
| generality | README "every non-archimedean local field" incl. `𝔽_p((t))`, `n = p` | Lean `[IsNonarchimedeanLocalField K]`, sums in `ℝ≥0∞` | equal; infinitely many Galois sets, finite value |

Other checks: `GaloisSet` (open kernel) is exactly continuity for the discrete target;
`homMulAction` is a left action (`(στ)∘g = σ∘(τ∘g)`); the stabilizer of `g : A → K^sep` is the
fixing subgroup of `g(A)`, whose fixed field is `g(A)`, so `etaleDiscriminantExponent` is the sum
of the factors' exponents; `intermediateFieldDiscriminantExponent` is the mass formula roadmap's
wrapper body (its `Suggested.lean` line 136); the Layer 2 transport is sound (`SeparableClosure K`
is a separable closure of `K_f`, and degree, total ramification and `δ(·/K_f)` are isomorphism
invariants); the hypotheses `hn`, `hf`, `he`, `hσ`, `hπ` are each used (table); the §1.1
inseparable remark is harmless since §1.1 is README only and every Lean carrier is a subextension
of `SeparableClosure K`.

## Not verifiable

- Bhargava 2007 (IMRN rnm052): no legal full text (publisher HTTP 403 to the sources service on
  two attempts, no arXiv, author or repository copy found). Its statements as the README gives
  them are confirmed through kedlaya2007b, wood2008 and yasuda2025 (above); its internal numbering
  and the claim about the product "from `t = 1`" are not (R03).
- Ownership against open pull requests beyond those whose files the brief lists was checked only
  through `roadmaps grep` over the 455 indexed pull requests.
- The dependency checker prints only its summary line, so the supplier edges it recorded for this
  roadmap could not be listed; it reports no UPWARD, CYCLE or moved line.

## Source issues

- none
