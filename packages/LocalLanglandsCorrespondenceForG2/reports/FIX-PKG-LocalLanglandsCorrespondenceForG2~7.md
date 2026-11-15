# FIX-PKG-LocalLanglandsCorrespondenceForG2~7

Findings of REV-PKG-LocalLanglandsCorrespondenceForG2~6 (four findings: two P2, two P3).

Edited files:
- `packages/LocalLanglandsCorrespondenceForG2/README.md`
- `packages/LocalLanglandsCorrespondenceForG2/sources.toml`: CG locator changed; new entry SpV.
- `packages/LocalLanglandsCorrespondenceForG2/design/plan.json`: two entries appended to the top-level `gaps` list, nothing else.

Unchanged: `Suggested.lean` and `metadata.toml`. The review's "For the human reviewers" section (two licence notes) asks for no change, and none was made.

## F01 (P2) — applied

I confirmed the finding against ExceptionalThetaCorrespondencesForG2 at its open head:
- §10.5 is "In the setting of the preceding period theorem", with k totally real and O totally definite.
- §10.6 gives cuspidality only "if one finite component is supercuspidal and its local H lift is supercuspidal".
- Neither covers a split G₂ with a Steinberg place and no supercuspidal place. GS line 538 asserts cuspidality without an argument.

Old → new:
- New contract `gap:split-steinberg-theta-cuspidality` (ExceptionalThetaCorrespondencesForG2), with its `plan.json` entry.
- **§3.15 Route.** "the global generic lift … cuspidal because of the Steinberg place" → Σ is nonzero and generic (§10.6), cuspidal by the contract, regular algebraic (§10.7). Its transfer (ModularityAndLanglandsExtensions §5.1, §§3.15, 3.17) has one summand because its component at u is Sym⁶.
- **Needs and Dependencies.** Updated to match.

The contract asks for more than the review proposed, in one respect. I stated it over any number field, not only a totally real one: §10.6 is stated over a number field, and the Steinberg mechanism does not use total reality. §3.15 uses the totally real case.

Other places changed:
- §3.15 *Needs* now also lists §10.3, §10.7, Layers 5–8 (Howe duality, and θ(St_G₂) = St_PGSp₆) and ModularityAndLanglandsExtensions §§3.15, 3.17, 5.1.
- Two Checks added to §3.15: the review's witness, and the transfer of regularity.
- Layer 3 Dependencies: §5.1 and the contract.
- The Scope paragraph of consumed contracts.

I re-read the other uses of a cuspidal global exceptional lift; none needs the new contract:
- §3.1 and the nongeneric case of §6.4 globalize on the totally definite form with a Steinberg place, so §10.5 applies.
- §1.5, §5.3 and the generic case of §6.4 carry a generic supercuspidal place with supercuspidal PGSp₆ lift, so §10.6 applies.

## F02 (P2) — applied differently

Confirmed: main's `TauCetiRoadmap/GlobalQuadraticForms/README.md` has 0 matches for "octonion" or "quaternion". Its §§6.2, 6.3 and 7.2 are quadratic-form theorems.

Old → new: three sectionless citations → "§1.1 …; GlobalQuadraticForms §6.3". §1.1 gains targets:
- (i) octonion algebras are classified by norm forms (characteristic ≠ 2);
- (ii) over a number field each is split at finite places, and the double of ℍ[k] is the unique totally definite one;
- (iii) quaternion subalgebras D ⊂ O exist with prescribed localizations.

Why this differs from the review's repair:
1. **Existence of D.** The suggested route for the second fact assumed it: "there is a quaternion algebra D over k … with D ⊗ k_u ≅ D_u". That needs a ramification-realization theorem, which §§6.2, 6.3 and 7.2 do not give. GL2AutomorphicRepresentationsAndTransfer R17.1.5 ("Ramification realization") owns it, so I cite that. It is earlier in the merge order (line 101; this roadmap is at line 316).
2. **The embedding D ⊂ O.** I avoid the unproved step "a quaternion algebra whose norm form is a subform of n_O embeds in O". Instead: the Cayley–Dickson double of D, with the product of `TauCeti.CayleyDickson`, has norm n_D ⊥ n_D. That norm is definite at every real place, so by (ii) the double is O, and D ⊕ 0 lies in it.
3. **Sections cited.** The route uses only GlobalQuadraticForms §6.3, so §§6.2 and 7.2 are not cited.
4. **The classification by norm forms.** Both routes need it. No roadmap states it, so it is target (i) here, stated for characteristic ≠ 2:
   - The route's Witt input, `QuadraticMap.IsometryEquiv.exists_extension`, carries `[Invertible (2 : K)]`.
   - The roadmap only needs characteristic 0.
5. **Generality.** (ii) and (iii) are stated over any number field: every input is (the Tau Ceti isotropy theorem, §6.3, R17.1.5).

Other places changed:
- **Scope.** "Owns" names §1.1; the imports gain GlobalQuadraticForms §6.3 and R17.1.5.
- **Supplier contracts.**
  - New section "From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer".
  - GlobalQuadraticForms §6.3 bullet under "From Tau Ceti roadmaps on main".
  - From Tau Ceti: `TauCeti.CayleyDickson` (`normSq`, `normSq_def`, `DivisionOctonionReal`), `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`, `QuadraticMap.IsometryEquiv.exists_extension`, `TauCeti.BrauerGroup.natCard_twoTorsion`.
  - From Mathlib: `Quaternion`.
- **Conventions.** The totally definite O exists, is unique and is split at the finite places.
- **§1.4.**
  - The Route cites §1.1(iii).
  - It also cites ExceptionalThetaCorrespondencesForG2 §9.1 (conjugacy of embeddings), so that G_D(k_u) is conjugate to the chosen local stabilizer.
  - *Needs:* §1.1 replaces the GlobalQuadraticForms citation.
- **Layer 1.** Dependencies and Examples, and *How to read the build*.
- **References.** [SpV] added.

Every pinned name was opened at the pin:
- `TauCeti/Algebra/CayleyDickson/Basic.lean:70`
- `TauCeti/Algebra/CayleyDickson/Quaternion.lean:116, :124, :312`
- `TauCeti/NumberTheory/QuadraticForm/Global/AnisotropicPlaces.lean:121`
- `TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean:50`
- `TauCeti/NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Invariant.lean:65`
- `TauCeti/Algebra/Octonion/Basic.lean:537` (`norm_mul`)
- Mathlib `Algebra/Quaternion.lean:684`

## F03 (P3) — applied differently

**Part (a).** Confirmed. MetaplecticAutomorphicForms §3.41 at its open head has the hypothesis "generic σ", and the trivial representation of PGSp₆(F) is unramified with Whittaker space 0. Neither suggested repair closes the step:
- **The genericity clause** needs Kato's irreducibility criterion for unramified principal series. No supplier states it: it is absent from SmoothRepresentationsOfLocalGroups SR.2–SR.4, and `roadmaps grep` finds it nowhere. The clause would itself cite less than it uses. (The Jacquet–Shalika bound it would also need is AutomorphicLFunctionsAndLocalFactors AL.3.3.8.)
- **The Borel-Levi case of the pgsp6-similitude-theta-tables contract** covers only irreducible induced representations, so it needs the same irreducibility.

So I declared the input GS actually uses (GS line 1581: unramified representations have nonzero lifts to PGSO₈) as a contract on its natural owner.

**Part (b).** Applied as asked.

Old → new:
- New contract `gap:pgsp6-pgso8-unramified-theta` (MetaplecticAutomorphicForms §§3.34, 3.41), with its `plan.json` entry.
- §8.1 Route, "generic or unramified up to a quadratic twist (§3.41)" → St at v₁ via §3.41; χ_v ∘ sim ⊗ σ_v⁰ elsewhere via the contract and the twist rule.
- One Check added; §10.9 *Needs* adds §6.2.

Other places changed: §8.1 *Needs*, Layer 8 Dependencies, and the Scope paragraph of consumed contracts. §2.3 also cites §3.41, but there Σ is globally generic, so every Σ_v is generic and §3.41 applies. No other route cites §3.41 for a non-generic representation.

For (b): §6.6 already needs §6.2, so the new edge adds no cycle.

## F04 (P3) — applied

Confirmed:
- The README cites CG Corollary 4.6 (§0.8 Route and References; CG line 478) and formula (16) (§0.8 local Route; CG line 1207).
- It never cites Proposition 4.7 (CG line 486).

Old → new: the CG locator "Lemma 3.10; Proposition 3.12; Example 1; Proposition 4.7; Corollary 4.8; …; Proposition 8.4" → "Lemma 3.10; Proposition 3.12; Corollary 4.6; Example 1; Corollary 4.8; Lemma 5.9; Proposition 5.10; formula (16); Lemma 8.2; Proposition 8.3; Proposition 8.4". Same key, nothing else changed.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| gap split-steinberg-theta-cuspidality | Split G₂; Π_u = St, unramified elsewhere; and the two cases the supplier already covers | §10.5 needs definite O: not met. §10.6 needs a supercuspidal place: none here. Lower lift to PGL₃ at u: v ∘ L(St) = Sym⁶ is irreducible of dimension 7, while the PGL₃ image has the form 1 ⊕ φ_τ ⊕ φ_τ∨ (1 + 3 + 3), so St_G₂ ∉ Irr♣ and that lift vanishes, the mechanism the supplier would use. | Contract needed and plausible; witness kept as a §3.15 Check |
| §3.15 one summand | Isobaric ⊞ of r summands at u | Its parameter at u is a sum of r nonzero pieces. Sym⁶ is irreducible with SL₂-invariants of dimension 0, so r = 1. | Holds |
| §3.15 regularity (§10.7) | Infinitesimal characters ρ and ω̂₁ (short fundamental weight of the dual G₂) | v-weights are 0 and the short roots of the dual group; differences are roots or twice a short root. At ρ: 3, 2, 1, 0, −1, −2, −3 (distinct). At ω̂₁: 2, 1, 1, 0, −1, −1, −2 (two pairs equal; ω̂₁ is orthogonal to a long root). | Regularity passes; Check added |
| gap pgsp6-pgso8-unramified-theta | Trivial representation of PGSp₆(F); quadratic twist; consistency with the dichotomy (§3.42) | Trivial rep: unramified, Whittaker space 0, so outside §3.41. For the restriction to Sp₆: first occurrence in the split tower at dimension 0, hence nonzero at dimension 8 by persistence. Conservation 0 + 16 = 16 means no lift to the 6-dimensional quaternionic space, consistent with exactly one tower. Twist by χ ∘ sim: sim is trivial on the unipotent radical, so Whittaker spaces and, by the twist rule, lifts correspond. | Statement consistent; Check added in §8.1 |
| §1.1(i), classification | ℝ: `DivisionOctonionReal` against `TauCeti.Octonion ℝ`; conjugation on ℍ | Signatures (8,0) and (4,4), so not isomorphic. conj(ij) = −k but conj(i)conj(j) = k, so an isometry is not an isomorphism. | Iff, read as existence of an isomorphism; Check added |
| §1.1(i), isotropic implies split | v of trace 0 with n(v) = −1 | v² = t(v)v − n(v) = 1. Idempotents (1 ± v)/2 give K[v] ≅ K × K. A quaternion algebra with zero divisors is M₂(K); norm n_M₂ ⊥ −c n_M₂ = H⁴. | Holds in characteristic ≠ 2 |
| §1.1(ii) | ℚ at 2, at odd p, at ∞; ℚ(√2) with c = −(1+√2); totally complex k | ℚ₂: −7 = 1 − 8 is a square, and 7·1² + (√−7)² = 0. Odd p: x² + y² + 1 ≡ 0 is solvable, so isotropic. ∞: anisotropic. So ℚ has 2 classes. ℚ(√2): c ↦ −2.414 or +0.414, so definite at one place and indefinite at the other, not O. Totally complex k: every octonion algebra is split, so "totally definite" is vacuous and O = `TauCeti.Octonion k`, still unique. | Holds; "every real place" is needed (Check) |
| §1.1(iii) | ℚ with S = ∅, {p}, {p, p′}, {2} split; real u prescribed M₂(ℝ); complex u | S = ∅: D = ℍ[k] ⊕ 0. {p}: nonsplit set {p, ∞}, even. {p, p′}: {p, p′, ∞} is odd, so add one prime. {2}: (−1,−3)_ℚ has symbols +1 at 2 (ε(−1)ε(−3) = 1·0), −1 at 3 ((−1/3) = −1), −1 at ∞, product 1. M₂(ℝ) has norm det of signature (2,2), not a subform of (8,0). Complex u: only M₂(ℂ). | Holds; review's repair test kept as a Check |
| §1.4 with §1.1(iii) | D_u division at a Steinberg u; D_u split at a supercuspidal u | Embeddings of D_u in O_u are conjugate (ExceptionalThetaCorrespondencesForG2 §9.1), so G_D(k_u) is conjugate to the chosen stabilizer and L²(G_D(k_u) \ G₂(k_u)) is unchanged. | Holds |
| §8.1 Route | v₁ (St); unramified v; real v | St is generic (§3.41). Unramified v uses the new contract plus the twist rule. Real v: generic discrete series (archimedean contract). | Complete |
| §10.9 *Needs* | Edge §6.2 → §10.9 | §6.6 already needs §6.2. | No cycle |
| CG locator | Every CG item the README names | 3.10, 3.12, 4.6, Ex. 1, 4.8, 5.9, 5.10, (16), 8.2, 8.3, 8.4 are all in the locator; 4.7 is not cited. | Agrees |

## Checks run

**Elaboration.** `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, run from the content checkout, exited 0. The only diagnostics were `declaration uses 'sorry'` at 118:8 and 137:8. The object file for `TauCeti.Algebra.Octonion.Basic` existed, so nothing was built.

**Signatures.** I elaborated a scratch copy with `#check @` for all five declarations: `octonionAut`, `octonionRep`, `griess_conjugacy`, `sumSquaresSeven`, `spin7_not_acceptable`. The types equal those in the worker's signature list:
- `octonionRep` keeps `[Group Γ]`.
- `griess_conjugacy` keeps both semisimplicity hypotheses and the intertwiner.
- `spin7_not_acceptable` keeps `Finite Γ`.

Nothing changed, and no Lean name was added, removed or renamed.

**Dependency check** (the prescribed `gate --depcheck`), output exactly:

```text
depcheck: 246 roadmaps, 2255 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The edge count rose from 2254 to 2255 with the new supplier GL2AutomorphicRepresentationsAndTransfer.

**`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere. The tool did not check names outside TauCetiRoadmap ("no pinned Lake packages on this host"). I checked those by hand at the pins (files and lines under F02).

**Gap slugs.** README and `plan.json` list the same 16 slugs.

**Style scan.** No LaTeX delimiters, process words, paths or pull-request numbers in the README.

## Sources

- **New key SpV.** Springer–Veldkamp, *Octonions, Jordan Algebras and Exceptional Groups*, doi:10.1007/978-3-662-12622-6, fetched through the sources service.
  - The DOI resolves only to a paywalled page, so the entry is recorded as `uncertified`.
  - It is cited by locator: §1.5, Theorems 1.7.1, 1.8.1. These are the standard locators for the doubling, the classification by norm forms and the uniqueness of the split algebra, and Tau Ceti's `CayleyDickson` file cites the same book at §1.5 for the double.
  - The text was not read.
- No other source was needed, and `needs-references.toml` was not written.
- GS lines 538 and 1580–1583, CG lines 478, 486 and 1207, and the supplier texts named above were read in place.

## Ownership

**Octonion algebras (§1.1(i)–(ii)).** No roadmap owns the classification of octonion algebras by their norm forms or the totally definite octonion algebra over a number field. I searched on main and at the open heads, through `roadmaps grep`, for: Cayley–Dickson, composition algebra, octonion algebras with norm form or isometric, Pfister, Springer–Veldkamp, forms of G₂, H¹(k, G₂).
- LieHighestWeight (main) owns only the split Cayley–Dickson comparison.
- ExceptionalThetaCorrespondencesForG2 owns local quaternion stabilizers (§9.1) and takes O as given (§10.1).
- QuadraticFormInvariants (open) excludes general Pfister theory.

So §1.1 owns them.

**Quaternion subalgebras (§1.1(iii)).** Quaternion ramification realization is owned by GL2AutomorphicRepresentationsAndTransfer R17.1.5, which is cited.

**Open pull requests.** Ownership against them was checked through the indexed search, not by reading each one.

**Declaration names.** No declaration of `Suggested.lean` changed, so none collides with another roadmap's.

## For the maintainer

- **New supplier requests.** The new contracts belong to roadmaps that are open pull requests earlier in the merge order. Their suppliers may want to add the targets:
  - ExceptionalThetaCorrespondencesForG2, Layer 10: `gap:split-steinberg-theta-cuspidality`.
  - MetaplecticAutomorphicForms, Layer 3, §3.41: `gap:pgsp6-pgso8-unramified-theta`.
- **New consumer edge.** This roadmap now depends on GL2AutomorphicRepresentationsAndTransfer, R17.1.5, which comes earlier in the merge order.
- **Renames and renumbering.** No section, target or Lean name of this roadmap was renamed or renumbered. Other roadmaps' citations of it are unaffected.
- **Possible future issue.** The SpV theorem numbers are cited without the text, as the source rules allow for paywalled works. A human with access may wish to confirm them.
