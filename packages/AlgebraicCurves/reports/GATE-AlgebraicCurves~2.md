# GATE-AlgebraicCurves~2: answers to the review of `61e0208`

One review comment (CBirkbeck, 2026-10-28T11:43:38Z) with four findings, F01–F04, numbered H01–H04 below. Repairs are in commit `5d3a641` ("AlgebraicCurves: review repairs (headlines on pinned Tau Ceti carriers; pinned names cited; spacing, wording)"). Not pushed.

**Action for the worker (outside this job's edit scope).** `TauCetiRoadmap/AlgebraicCurves/ConstantExtensionSuggested.lean` should be deleted from the branch. It imports `TauCetiRoadmap.AlgebraicCurves.Suggested` and uses that file's `IsFunctionField`, `Place`, `Place.ord` and `Place.ResidueField`. Those parallel carriers are gone, so the file no longer elaborates. Its one surviving headline now lives in `Suggested.lean` as `isDomain_tensorProduct_of_isSeparable`, and nothing else in it is wanted (H01, H02). The gate does not see the file (`stray-files=0`, `imports=0` at both heads). But `lakefile.toml` globs `TauCetiRoadmap.*`, so a full library build would fail on it. I did not build it.

## H01 (CBirkbeck) — applied

`Suggested.lean` now uses the pinned carriers. Old: 448 lines with parallel copies of `IsFunctionField`, `Place`, `Divisor`, `riemannRochSpace`, `Divisor.dim`, `genus`, `repartitionSpace`, `adeleFiltration`, `classGroupZero`, plus 20 sorried theorems. New: 101 lines, imports `Mathlib`, `TauCeti.FieldTheory.FunctionField.ConstantExtension.Algebraic` and `TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus`.

- **Deleted theorems.** All 20 sorried theorems are proved at the Tau Ceti pin, and each is now cited at its README layer by its pinned name, checked with `#check`. For example:
  - `TauCeti.Place.instIsDiscreteValuationRing`
  - `TauCeti.Place.exists_forall_mem_ord_sub_eq`
  - `TauCeti.Place.finite_setOf_ord_ne_zero`
  - `TauCeti.Divisor.degree_principal`
  - `TauCeti.riemannRochSpace_zero_of_isIntegrallyClosedIn`
  - `TauCeti.Divisor.degree_add_one_sub_genus_le_dim` with `TauCeti.exists_forall_dim_eq_degree_add_one_sub_genus`
  - `TauCeti.isRiemannRochDivisor_weilDifferentialDivisor` with `degree_/dim_weilDifferentialDivisor`
  - `TauCeti.Divisor.two_mul_dim_le_degree_add_two`
  - `TauCeti.Divisor.finite_ker_degreeClass`
  - `WeierstrassCurve.Affine.genus_functionField`
  - `WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing` with `isDedekindDomain_coordinateRing_of_isIntegrallyClosed`
  - `TauCeti.genus_eq_of_sq_eq` (at `x⁵ − 1`: `(5 − 1)/2 = 2`)
- **Kept headlines.** Three headlines the pin does not prove are stated on `TauCeti.*` carriers:
  - `isDomain_tensorProduct_of_isSeparable` (Layer 8 item 2): the review's `constantExtension_isDomain`, with the separating element written inline instead of through the deleted `IsSeparatingElement`.
  - `genus_le_genus_of_constantCompositum_eq_top` (Layer 8 genus non-increase; the pin proves only the finite-separable equality).
  - `finite_algEquiv_of_two_le_genus` (Layer 11 finiteness over algebraically closed characteristic-zero `k`). The review assumed this was at the pin, but the pin proves only the hyperelliptic case, `TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two`, and finite-subgroup bounds.
- **Not stated in Lean.** The review's trace-Gram length identity was left as README prose: it is a local lemma, not a headline.
- **Module docstring.** It now names what is not statable at the pins, with the missing carrier: the Layer 9 residue theorem (no residue of a differential at a place) and Layers 12B/12C (no regular projective model of a function field, no category of regular projective curves).
- **README.** Every backticked name that pointed to a deleted declaration was replaced by its pinned name (lines 71, 401–453, 516–548, 574, 602–608, 615, 645, 666, 914, 1162–1165, 1598). The Tau Ceti carriers bullet in "Existing formalizations" now lists the pinned headline proofs. The three new names appear at Layer 8 item 2, at the genus-drop bullet and at the Layer 11 finiteness bullet.

## H02 (CBirkbeck) — applied differently

None of the seven declarations (`HasSeparableResidue`, `traceGram`, `traceGram_det_ne_zero`, `traceDualBasis`, `trace_traceDualBasis_mul`, `mem_poleFibre_iff`, the base-change `example`) is carried into `Suggested.lean`. Nor are `poleFibre`, `IsSeparatingElement` or `exists_isSeparatingElement`; the last is the pinned `TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_perfectField`. The README keeps the trace-Gram and pole-fibre statements as prose. Deleting `ConstantExtensionSuggested.lean` itself is outside this job's edit scope and is the worker action at the top of this report.

## H03 (CBirkbeck) — applied

- **Process paragraph.** README lines 158–162 ("Additional target signatures … in `ConstantExtensionSuggested.lean`, reusing the unchanged `Suggested.lean` carriers") are reduced to the sentence about the Layers 7–8 and 12B.0 producers.
- **Process sentence in "The build, in layers".** "its milestones are added to `Suggested.lean` with `sorry`" now says that pinned headlines are cited by name and `Suggested.lean` states the others.
- **Stale quotation.** The quotation "to the upstream coordination" (lines 52 and 1813) is replaced by what EllipticCurves Layer 0 on main says now: it uses this roadmap's normalized-valuation place interface and takes its places from Layer 10's early Weierstrass local-ring milestone (EllipticCurves README lines 357, 367–372; "coordination" occurs 0 times there).
- **Pull-request numbers.** Both citations of Mathlib PR `#41729` (lines 554, 1783) now cite the object, the Dedekind divisor group `(FractionalIdeal R⁰ K)ˣ ≅ (HeightOneSpectrum R →₀ ℤ)`.
- **The two Lean sentences** ("proof targets, not validated results", "This signature is unvalidated") are in `ConstantExtensionSuggested.lean`, which goes with the file (H02).

## H04 (CBirkbeck) — applied

Every word+number fusion outside code spans was re-spaced mechanically: about 110 tokens, including "Layers 7–8", "Lemma 3.5.3", "Cor. 3.5.5", "Prop. 3.6.1", "12B.0c", "genus stays 0", "characteristic 2", "Belyi 9.1C" and "SAME 12B". Roman-numeral section locators (`III.11`, `IV.2.5`) and the repository name `vaca22` were left alone.

The fierce-regression bullet (Layer 8) was rewritten with code spans: `A = k[t]_(t)`, `B/tB = k(√s, √u)`, maximal ideal `(t)`, `G_0 = V₄`, different `(t)`, tower different `(t²)`, `f·d = 8`. "At p3" is now "At `p = 3`" (Layer 8 and Worked examples).

## Build, gate, dependency check

- `lake build TauCetiRoadmap.AlgebraicCurves.Suggested`: **Build completed successfully (9024 jobs)**. Three warnings, all `declaration uses sorry` (lines 52, 70, 85), nothing else.
- Gate: `gate AlgebraicCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1150 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the new README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.

**Signature check.** The three declarations and all 47 pinned names the README and docstring now cite were elaborated together with `#check @name`, in one temporary build of the file with extra `TauCeti.*` imports; the file was restored afterwards. Every name resolves at the pin; `TauCeti.adeleFiltration` (README Layer 4) was checked in `TauCeti/FieldTheory/FunctionField/Repartition/Basic.lean`, namespace `TauCeti`. The three new headlines keep every binder: `Algebra.IsAlgebraic k k'`, both scalar towers, `IsAlgClosed k` and `CharZero k` all appear in the elaborated types, and the types match the README statements. No `variable` block is used.

## Adversarial pass (the three statements this round adds)

| statement | instances tried | values on each side | result |
|---|---|---|---|
| `isDomain_tensorProduct_of_isSeparable` | `K = k` | `k ⊗ F = F`, a domain | holds |
| same | `K = F` (regular `F/k`) | `F ⊗_k F ⊆` a field (`F` and `F` linearly disjoint over `k`) | holds |
| same, drop `hex` | `k = ℝ`, `F = ℂ(x)`, `K = ℂ` | `ℂ ⊗_ℝ ℂ(x) ≅ ℂ(x) × ℂ(x)`, zero divisors `(1,0)·(0,1) = 0` | `hex` is load-bearing; negative control in docstring and README |
| same, drop `hsep` | `k = 𝔽_p(a,b)`, `F = k(x,y)`, `y^p = a + b x^p` (exact constants per the pinned `ConstantExtension/Basic.lean` docstring), `K = k(a^{1/p}, b^{1/p})` | `(y − a^{1/p} − b^{1/p} x)^p = y^p − a − b x^p = 0`, element nonzero | `hsep` is load-bearing; negative control |
| `genus_le_genus_of_constantCompositum_eq_top` | `k' = k`, `F' = F` | `adjoin F (range k) = ⊥ = ⊤` in `IntermediateField F F`; `g ≤ g` | holds |
| same | `k = 𝔽_p(t)`, `y² = x^p − t`, `p` odd, `k' = k(t^{1/p})` | left `0`, right `(p−1)/2`; pinned `TauCeti.GenusDrop.genus_lt_genus`, `genus_curveField` | holds strictly; the docstring cites it |
| same | finite separable `k'` | equality by pinned `TauCeti.genus_eq_genus_of_constantCompositum_eq_top` | consistent |
| same, `k'` not exact in `F'` (pinned example `y^p = t x^p + u`, `k' = k(t^{1/p})`) | `m = [k̃':k'] ≥ 1`, `g'` the genus over `k̃'` | pin's truncated value `= max 0 (m(g'−1)+1)` (by `deg_{k'} = m·deg_{k̃'}`, `ℓ_{k'} = m·ℓ_{k̃'}`); `m(g'−1)+1 ≤ m g' = h¹_{k'}(normalized component) ≤ h¹(X_{k'}) = g` (flat base change; nilradical and normalization `H¹` surjections) | holds without exactness of `k'`; recorded in docstring |
| same, units | `ℝ ⊂ ℂ(x)` | excluded by `hex` | not tested further |
| `finite_algEquiv_of_two_le_genus` | `g = 0`, `F = k(x)` | `Aut ≅ PGL₂(k)`, infinite (pinned `RatFunc.infinite_algEquiv`) | excluded by `2 ≤ g` |
| same | `g = 1` | translations by `Cl⁰(F) ≅ E(k)`, infinite over `k = k̄` | excluded by `2 ≤ g` |
| same | `y² = x⁵ − 1` over `ℂ`, `g = 2` | finite by pinned `TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two` | consistent |
| same, exactness | `IsAlgClosed k` | algebraic elements of `F` over `k = k̄` lie in `k`, so `hex` is automatic and `genus k F` is not a junk value | no hypothesis missing |

## Ownership, sources

- **Ownership.**
  - `roadmaps grep` finds no other roadmap on main or in an open roadmap pull request stating `IsDomain (K ⊗[k] F)` for function fields, `Finite Gal(F/k)` in genus at least 2, or genus non-increase under constant extension. The only hit is this roadmap's own README on main.
  - No declaration of `Suggested.lean` reuses the fully qualified name of a declaration in a readable roadmap.
  - The deleted carriers are owned by the Tau Ceti pin, as the README's carriers bullet already said.
- **Sources.** No new sources were cited or fetched. The three docstrings use Stichtenoth (already the roadmap's primary source) and pinned declarations. `needs-references.toml` was not written.
