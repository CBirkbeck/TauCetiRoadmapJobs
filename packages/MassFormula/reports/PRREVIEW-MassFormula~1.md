# Review of MassFormula (pull request #1819 at 834b8f0)

**Verdict:** needs changes

The pull request changes one paragraph of `TauCetiRoadmap/MassFormula/README.md` (the *Long
horizon* section, lines 409–416) and nothing else; `git diff --stat origin/main...HEAD` outside
the folder is empty, and `Suggested.lean` is byte-identical to main. The paragraph's new pointer is
correct: Bhargava's étale mass formula is the summit of the EtaleMassFormula roadmap on main
(its summary states Bhargava's Theorem 1.1, and its *Scope and ownership* section lists Serre's
formula, `σ_K(n)` and the orbit count as owned by this roadmap), and the relative link
`../EtaleMassFormula/README.md` resolves. Two of the three findings below predate the pull
request (they are identical on main at e01afcf and come from the archive move of
LocalFieldsRamification into `Completed/`); they are reported because the worker's gate fails on
them at this head and the brief admits no acceptance while the gate fails. A human may decide
that they belong in a separate pull request; the tested repair below is a mechanical rewrite of
the import header and six qualified names and leaves every statement unchanged. The third
finding is in the paragraph the pull request edits.

## R01 (P1) — the gate's build counter fails on the module-system advisory

**Location.** `TauCetiRoadmap/MassFormula/Suggested.lean` line 1 (`import Mathlib`); the worker's
gate at 834b8f0 reports `build=4 FAIL`.

**Claim.** The targeted build `lake build TauCetiRoadmap.MassFormula.Suggested` emits four lines
"imports `Mathlib` from package `mathlib`, which is designed for use with the module system;
consider adding `module` to the start of this file": one for this folder's `Suggested.lean` and
three for the files it imports through `Completed.LocalFieldsRamification.Suggested`
(`Completed/LocalFieldsRamification/Suggested.lean`, `Completed/ProfiniteProPGroups/Suggested.lean`,
`TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`). Elaboration itself is clean: `lake env lean`
on the file at 834b8f0 exits 0 with exactly 22 `declaration uses 'sorry'` warnings and nothing
else. The gate's counter is nevertheless authoritative for acceptance, so this is a finding by the
brief's failed-build rule; the three advisories outside the folder cannot be repaired from this
folder, but they disappear together with R02's repair, which stops importing that chain.

**Witness.** `scratch/gate.md` of this review's job, section `## build (4)`; the rerun of the gate
on an up-to-date build prints no build field (the advisory only appears on a fresh compile).

**Repair (tested, jointly with R02).** Prepend the line `module` to `Suggested.lean` and make the
imports `public import` lines (the form OperatorAlgebraDynamics and TypeAHeckeAlgebras use on
main). On a scratch copy with the header

```lean
module
public import Mathlib
public import TauCeti.NumberTheory.LocalField.RamificationIndex
public import TauCeti.NumberTheory.LocalField.Discriminant.Basic
public import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
```

and the six name substitutions of R02, `lake env lean` exits 0 with the same 22 `sorry` warnings
and no advisory (the three Tau Ceti modules are themselves in module form at the pin: the header
of `TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean` is `module` followed by
`public import` lines).

## R02 (P3) — `Suggested.lean` imports another roadmap's module

**Location.** `TauCetiRoadmap/MassFormula/Suggested.lean` line 2:
`import Completed.LocalFieldsRamification.Suggested`; the gate's `imports` rule (`imports=1`).

**Claim.** The import header may contain only `import Mathlib` and individual `TauCeti.*` modules;
another roadmap's `Suggested.lean` is refused by the gate. The file uses the imported namespace
for exactly six names: `LocalFieldsRamification.IsTotallyRamified`,
`LocalFieldsRamification.discriminantExponent`,
`LocalFieldsRamification.finiteIntermediateFieldValuativeRel`,
`LocalFieldsRamification.finiteIntermediateFieldTopology`,
`LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField` and
`LocalFieldsRamification.finiteIntermediateField_valuativeExtension`. Each is, in the Completed
module, a reducible alias of (or a definition equal to) a Tau Ceti declaration that exists at the
pin 358314d4: `TauCeti.IsTotallyRamified`
(`TauCeti/NumberTheory/LocalField/RamificationIndex.lean` line 188, `e(L/K) = [L : K]`, the body
the Completed module repeats at its line 404), `TauCeti.discriminantExponent`
(`TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean` line 137, aliased at Completed line
1295), and the four adapters `TauCeti.finiteIntermediateFieldValuativeRel`,
`TauCeti.finiteIntermediateFieldTopology`, `TauCeti.finiteIntermediateField_valuativeExtension`,
`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`
(`TauCeti/NumberTheory/LocalField/FiniteExtension/IntermediateField.lean` lines 71, 77, 83, 99;
aliased at Completed lines 335–380). This finding is identical on main (the import is not changed
by the pull request).

**Witness.** `Completed/LocalFieldsRamification/Suggested.lean` lines 343–347: the adapter
`finiteIntermediateFieldValuativeRel` is a `noncomputable abbrev` whose body is
`TauCeti.finiteIntermediateFieldValuativeRel K Ω M`.

**Repair (tested).** Replace line 2 by the three `TauCeti.*` imports of R01 and replace the prefix
`LocalFieldsRamification.` by `TauCeti.` on the six names (32 occurrences; `sed` on a scratch copy);
the scratch copy elaborates with 22 `sorry` warnings only. Then adjust the prose that names the
Completed module: the module docstring (lines 24–37, "imported above and used by exact name") and
the README's sentence "`Suggested.lean` imports these and consumes them by name" (line 160) should
name the Tau Ceti declarations, which the supplier's own README records as the exports behind its
aliases. The supplier table (README lines 147–158) can keep the LocalFieldsRamification names,
since that is how the supplier's consumer contract lists them.

## R03 (P3) — Krasner's count is no longer unowned

**Location.** `TauCetiRoadmap/MassFormula/README.md` lines 408–412, the heading "Long horizon (a
roadmap for a future roadmap; do not attempt it here)" and the sentence "Serre's formula was
refined by Krasner into a count … It is a natural continuation, not specified here".

**Claim.** Krasner's count of the totally ramified extensions of given degree and discriminant is
specified: the PadicExtensionFamilies roadmap (an open new-roadmap pull request this brief lists,
merge order line 378) owns it as its Layer 5, "Krasner's count by degree and discriminant", §5.3,
stated on this roadmap's `totallyRamifiedOfDegree K n` and wild exponent; and EtaleMassFormula on
main already records that ownership in its *Scope and ownership* section ("Krasner's count of
totally ramified extensions by discriminant … the `p`-adic extension families roadmap
(PadicExtensionFamilies)"). After this pull request the paragraph points Bhargava's formula to its
owner but still presents Krasner's count as unspecified future work, which contradicts the
sibling roadmap on main and the house rule that nothing is deferred to an unnamed roadmap.

**Witness.** `TauCetiRoadmap/PadicExtensionFamilies/README.md` at the head of its pull request,
lines 62–65 (scope: "Krasner's count … the consistency with Serre's Theorem 1 (Layer 5)") and line
1255 (`## Layer 5: Krasner's count by degree and discriminant`);
`TauCetiRoadmap/EtaleMassFormula/README.md` on main, lines 37–39.

**Repair.** Point Krasner's count to PadicExtensionFamilies, Layer 5 (by roadmap name and section,
as the paragraph now does for Bhargava), and retitle the section as a note on continuations, for
example "## Continuations in other roadmaps", dropping "a roadmap for a future roadmap; do not
attempt it here" and "not specified here". Both pointers run in the consumer direction (both
roadmaps consume this one's Layer 4), so no supplier citation and no `*Needs:*` line is added; the
dependency check below is unchanged by it.

## Verified sound

**The pull request's own change.** The new sentence attributes to EtaleMassFormula exactly what
that roadmap claims for itself: its summary states Bhargava's Theorem 1.1,
`∑_{[A]} 1/(#Aut_K(A) · q^{v(Disc A)}) = ∑_{k=0}^{n−1} q(k, n − k) q^{−k}` over étale `K`-algebras
of degree `n`, with `q(k, m)` the number of partitions of `k` into at most `m` parts, and names
it "the local input to Bhargava's heuristics for the density of number-field discriminants". That
is the formula restated, with the same partition count, at Wood 2008 (arXiv 0804.4679v1, cache
870f88a2, lines 28–36 and 41–42, which also says the proof goes through Serre's formula). The
supply direction is EtaleMassFormula → MassFormula as consumer: its *Exact supplier contracts*
section cites "MassFormula, layer 4 the mass formulas", the Lean names
`MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent` and
`MassFormula.ncard_isomorphic_mul_natCard_algEquiv` (both declared in this file, lines 448 and
467) and MassFormula Layer 0 for the invariance of the discriminant exponent. This roadmap cites
nothing from EtaleMassFormula; the link is a pointer, not a `*Needs:*` line.

**Gate and dependency check.** Gate rerun at 834b8f0 with the board's merge order:
`imports=1`, every other counter 0, `FAIL` (R02; the build field is absent on an up-to-date
build, R01 is from the worker's fresh compile). Dependency check:

```
depcheck: 241 roadmaps, 2310 edges, 0 problem(s)
```

MassFormula and EtaleMassFormula are both on main and neither is listed in `ORDER.txt` (379
lines); no UPWARD or CYCLE line. Link-form check by hand: EtaleMassFormula cites MassFormula
Layers 0 and 4; MassFormula's only mention of EtaleMassFormula is the Long-horizon pointer; no
cycle. All fourteen supplier declarations in the README's table resolve in
`Completed/LocalFieldsRamification/Suggested.lean` (lines 69, 335–380, 404, 427, 440, 1238, 1247,
1261, 1286–1352), and the README item "Layer 3: totally ramified is equivalent to Eisenstein" is
line 726 of that roadmap's README on main. The supplier's consumer contract (its README lines
1096–1151) requires exactly the two wrappers this file defines, each "with a comparison theorem
with the canonical invariant", so `intermediateFieldIsTotallyRamified_iff` and
`intermediateFieldDiscriminantExponent_eq` (proved, lines 103 and 155) are contract obligations,
not padding.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean`: exit 0, 22 `sorry` warnings,
nothing else. A scratch file with `#check @name` for all 33 declarations elaborated once; every
type agrees with its README statement. The definitions `intermediateFieldIsTotallyRamified`,
`totallyRamifiedOfDegree`, `intermediateFieldDiscriminantExponent`, `wildExponent` and
`IsRepresentativeSet` carry `[Field K] [ValuativeRel K] [UniformSpace K]
[IsNonarchimedeanLocalField K]` and not `[IsUniformAddGroup K]`, which their types do not need;
every theorem carries all five. `toPoly` and `rootCount` need only `[Field K]`, `eisensteinSet`
and `integerBox` only `[Field K] [ValuativeRel K]`. No sorry'd data, no `set_option`, no
`lemma`, no `Prop`-valued placeholder. The headline theorems of the README (Theorem 1, Theorem 2,
the finiteness dichotomy, convergence, the orbit count, the tame count) are all stated (lines
448–487), on the roadmap's own carriers. One-tactic probe (`first | rfl | simp | infer_instance |
decide | omega` in place of each of the 22 `sorry`s, on a scratch copy): 22 errors, none closed.

**Library declarations opened at the pins** (Mathlib f6090c70, Tau Ceti 358314d4, the same in the
worktree and in the content checkout): `hensels_lemma`
(`Mathlib/NumberTheory/Padics/Hensel.lean` line 459, over `ℤ_[p]`); `Measure.addHaar_image_linearMap`
(`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`, real vector spaces);
`pow_sub_one_dvd_differentIdeal` (`Mathlib/RingTheory/DedekindDomain/Different.lean`, with its
`_aux` form at line 693); `conductor_mul_differentIdeal` (same file);
`conductor_eq_top_of_adjoin_eq_top` (`Mathlib/RingTheory/Conductor.lean` line 49);
`Submodule.quotientEquivPiSpan` (`Mathlib/LinearAlgebra/FreeModule/Finite/Quotient.lean`);
`AddSubgroup.index_eq_natAbs_det` (`…/Finite/CardQuotient.lean` line 98);
`isAddLeftInvariant_eq_smul_of_regular` (`Mathlib/MeasureTheory/Measure/Haar/Unique.lean`);
`Field.embEquivOfAdjoinSplits` and `Field.finSepDegree_eq_finrank_of_isSeparable`
(`Mathlib/FieldTheory/SeparableDegree.lean`, the latter line 749);
`IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean` line 45),
`valueGroupWithZeroIsoInt` (line 116) and the instance `IsAdicComplete 𝓂[K] 𝒪[K]` (line 177);
`MeasureTheory.lintegral_tsum` (`…/Integral/Lebesgue/Add.lean` line 362, `[Countable β]` and
`AEMeasurable` summands, as the README's Layer 3 plans); `ENNReal.summable_toReal`;
`Polynomial.IsEisensteinAt.irreducible`; `HenselianLocalRing` (`Mathlib/RingTheory/Henselian.lean`
line 108); `Mathlib/Analysis/Normed/Field/Krasner.lean` exists. The Tau Ceti pin (2026-10-07) has
none of this roadmap's objects (`totallyRamifiedOfDegree`, `wildExponent`, `eisensteinSet`,
`rootCount`, `IsRepresentativeSet`: no hit), so the folder's claim that nothing like the count is
upstream holds at the pin; the Tau Ceti development named in `STATUS.md` postdates it.

**Ownership.** Searched the roadmaps on main and the open heads for Serre's `σ_K(n)`, the wild
exponent, the Eisenstein region and the mass formulas: EtaleMassFormula (main) and
PadicExtensionFamilies (open) both consume them from this roadmap by name and section and restate
nothing. Ownership against open pull requests not listed with a path was not checked.

**Adversarial table.** Values computed by hand; `q` the residue cardinality.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `wildExponent L = d L + 1 − n` | `ℚ_2(√2)` (d = 3), `ℚ_2(i)` (d = 2), `K` itself (n = 1, d = 0), junk `L` infinite (d = 0, finrank 0) | 3+1−2 = 2; 2+1−2 = 1; 0+1−1 = 0; 0+1−0 = 1 | agrees with Serre's `c`; junk value harmless (every theorem has `0 < n` and membership) |
| `sub_one_le_intermediateFieldDiscriminantExponent` | `ℚ_2(√2)`, `ℚ_3(∛3)` (d = e − 1 + v_L(e) = 2 + 3 = 5), `K` | 1 ≤ 3; 2 ≤ 5; 0 ≤ 0 | holds; truncation faithful |
| `wildExponent_eq_zero_iff` | `ℚ_p(√p)`, p odd: c = 0, p ∤ 2; `ℚ_2(i)`: c = 1, 2 ∣ 2; `ℚ_2(∛2)`: tame, d = 2, c = 0, 2 ∤ 3; degree p over any K of residue char p: c > 0 (Dalawat 2012 line 32) | both directions on each | holds |
| Theorem 1 `∑ q^{−c} = n` | n = 1: `σ = {K}`; odd p, n = 2: two fields with c = 0; `ℚ_2`, n = 2: six fields, c ∈ {1,1,2,2,2,2}; `ℚ_2`, n = 3: three conjugates of `ℚ_2(∛2)`, c = 0 | 1 = 1; 2 = 2; 2·½ + 4·¼ = 2; 3 = 3 | holds |
| Theorem 2 `∑_R 1/(#Aut · q^c) = 1` | `ℚ_2`, n = 2 (all Galois, #Aut = 2, R = σ); odd p, n = 2; `ℚ_2`, n = 3 (one class, #Aut = 1) | 2·¼ + 4·⅛ = 1; 2·½ = 1; 1/1 = 1 | holds |
| `IsRepresentativeSet` | n = 0: `σ_K 0 = ∅` (finrank 0 forces `Module.Finite` to fail in the wrapper), so R = ∅ and Theorem 2's sum is 0 ≠ 1 | excluded by `0 < n` | hypothesis necessary and present |
| `ncard_isomorphic_mul_natCard_algEquiv` | Galois L: class {L}, #Aut = n; `ℚ_2(∛2)`: three distinct conjugate subfields (ζ₃ generates a quadratic extension, not inside a cubic), #Aut = 1 | 1·n = n; 3·1 = 3 | holds |
| `totallyRamifiedOfDegree_infinite_iff` | `ℚ_p` any n: ringChar 0 ≠ p, right side false, left false (finite by Theorem 1 with c ≤ n·v(n)); `𝔽_p((t))`, n = p: `X^p + t^m X + t` give d = pm, infinitely many; `𝔽_p((t))`, n = 1 or p ∤ n: tame, n members | iff on each | holds |
| `summable_…` | `𝔽_p((t))`, n = p: the real series has ℝ≥0∞ sum p < ∞ | summable | holds (information only there) |
| `ncard_totallyRamifiedOfDegree_of_not_dvd` | odd p, n = 2; `ℚ_2`, n = 3 | 2; 3 | holds |
| `eisensteinSet` | n = 0: `toPoly = 1`, coeff 0 = 1, set is `univ` (junk, excluded); n ≥ 1: `coeff 0 = a 0`, second clause says `v(a 0)` is the largest value below 1, i.e. `a 0` is a uniformizer | wrong model "all coefficients in 𝔪" admits `a 0 = π²`, excluded by the second clause | determined |
| `mem_eisensteinSet_iff` | `X² − 2` over `ℚ_2`: a = (−2, 0) ∈ E₂, IsEisensteinAt (coeff 0 ∉ 𝔪²); `X² − 4`: a 0 = −4 ∈ 𝔪², both sides false; `X² − 1`: both false | ↔ on each | holds |
| `measure_eisensteinSet` | n = 1: {v(a₀) = 1}, measure q^{−1}(1 − q^{−1}); n = 2, `ℚ_2`: ½ · ½ · ½ = ⅛ | formula: q^{−1}(1−q^{−1}); 2^{−2}(1 − ½) = ⅛ | holds |
| `lintegral_rootCount` | n = 1, L = K: rootCount ≡ 1, integral = μ(E₁) = q^{−1}(1−q^{−1}), formula with d = 0: q^{−1}(1−q^{−1}); `ℚ_2`, n = 2: Σ_L = 2·2^{−3}·½ + 4·2^{−4}·½ = ¼ = n·μ(E₂) = 2·⅛ | equal | holds, consistent with Theorem 1 |
| `tsum_rootCount` | separable Eisenstein a: n roots x_j, each in exactly one L = K(x_j) (both degree n): Σ_L = n; inseparable `X^p − t` over `𝔽_p((t))`: no root in the separable closure, Σ = 0 | n; 0 on the null locus (`a_i = 0` for p ∤ i, or disc = 0) | holds a.e., the a.e. is necessary |
| `card_aroots_eq` | f = X² − 2 over ℚ_2, g = X² − 2 + 2^T u: for T ≥ 4, g = X² − 2(1 − 2^{T−1}u), 1 − 2^{T−1}u a square, same root count in each L; f = X² − 17 (not Eisenstein, separable): both roots in K, so in every L | counts equal | holds |
| `exists_isRoot` | ℤ_2, F = X² − 17, y₀ = 1: v(F) = 4 > 2·v(F′) = 2; root z ≡ 1 mod 8 has v(z − 1) = 3 (from v(z−1) + v(z+1) = 4) | 4 ≤ 1 + 3 | holds, sharp; F(y₀) = 0 forces z = y₀; F′(y₀) = 0 vacuous |
| `eq_of_isRoot_of_addVal_lt` | same F, z and z′ = −z: v(z′ − z) = v(2z) = 1 = v(F′(z)) | hypothesis 1 < 1 false | consistent, bound sharp; F = 0 vacuous (F′ = 0 has value ⊤) |
| `card_quotient_range` | n = 0: det = 1, k = 0, quotient trivial; M = diag(π): index q; M = 0 (n ≥ 1): `Associated 0 (π^k)` false | 1 = q^0; q = q^1; vacuous | holds |
| `le_addVal_sum_eisenstein_powerBasis_iff` | `ℚ_2(√2)`, ξ = √2, n = 2: v_L(c₀ + c₁√2) = min(2v(c₀), 2v(c₁)+1); r = 3: need v(c₀) ≥ ⌈3/2⌉ = 2, v(c₁) ≥ ⌈2/2⌉ = 1; r = 1: ⌈1/2⌉ = 1 and (1−1)⌈/⌉2 = 0, `c₁` free; Eisenstein of degree 0 is a unit, no root, vacuous | both sides on each | holds |
| `adjoin_mem_totallyRamifiedOfDegree` | x = √2 in `SeparableClosure ℚ_2`: `ℚ_2(√2) ∈ σ(2)`; `X^p − t` over `𝔽_p((t))`: no x, vacuous | member | holds; separable closure does the exclusion |
| `countable_totallyRamifiedOfDegree` | `𝔽_p((t))`, n = p: infinite but countable (Serre's family is indexed by m, and each L has an open set of positive measure in E_n) | countable | consistent with the dichotomy |
| `intermediateFieldDiscriminantExponent_eq_of_algEquiv` | the three conjugates of `ℚ_2(∛2)` | d = 2 each | holds, junk case both 0 |

**Statements cross-checked against readable secondary texts** (the primary sources are listed
under *Not verifiable*): Serre's definition `c(E) = v(δ) − (n − 1)` and `∑ q^{−c(E)} = n` in
degree p, Dalawat 2012 (arXiv 1110.6702v2, cache 1505f040, lines 29–34), which also records
Krasner's second proof (line 39); Bhargava's formula as above, Wood 2008 lines 28–36.

## Not verifiable

- Serre 1978, *Une "formule de masse" …*, C. R. Acad. Sci. Paris 286, 1031–1036: cited for Thm. 1,
  Thm. 2, Remarks 1° and 3°, Lemma 1, Lemmas 2–3 with eqs. (1), (3), (5)–(13), and p. 1031 footnote
  1 (the seeded sample's targets 1–11, every Layer 3 and Layer 4 locator). The sources service found
  no legal copy; the Comptes rendus of 1978 are not in the open Gallica run, the Collège de France
  annual report lists the note without a text, and the Œuvres reprint is a paywalled Springer
  volume. Recorded in `needs-references.toml`.
- Bhargava 2007, IMRN, doi 10.1093/imrn/rnm052: cited in the Long-horizon paragraph (sample target
  12). The DOI landing page answers HTTP 403, no arXiv version exists, and the only other viewer
  found is a subscription service. Recorded in `needs-references.toml`.
- Krasner 1966, *Nombre des extensions d'un degré donné d'un corps p-adique*, CNRS proceedings,
  143–169 (sample target 13): no digital copy found anywhere legal. Recorded.
- Serre 1979, *Local Fields*, GTM 67: Chap. I §6 Prop. 17, Chap. III §3, Chap. III §6 Prop. 13
  (sample targets 14–15, both consumed through LocalFieldsRamification rather than used directly).
  Springer, paywalled; the service recorded it as `uncertified` with its locator. Note that this
  run of the brief's fetch command created `packages/MassFormula/sources.toml` with that single
  entry; the review edited no manifest by hand.

## Source issues

- none
