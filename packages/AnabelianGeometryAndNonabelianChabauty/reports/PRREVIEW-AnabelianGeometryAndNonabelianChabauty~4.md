# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at e47aa4f)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since f8c6414: two new Checks (the abelian-variety failure of SectionConjecture, and the affine Reichardt–Lind curve as a vacuous instance of CuspidalSectionConjecture) and the two reference entries they cite. No P1 or P2 finding; the three findings below are the previous report's P3 notes, unrepaired at this head, for the author to take or leave.

## R01 (P3) — Supply the source manifest

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/` contains README.md, Suggested.lean and metadata.toml only; `sources.toml` is absent.

**Claim:** The bibliography (now 49 entries) records no source-service provenance or verification status; the two new works were fetched and read for this review from legal copies (the Centre Mersenne PDF of Ciperiani–Stix, and arXiv:0910.5009v1), and belong in the manifest with `ciperiani-stix-2015` and `stix-brauer-manin-2011` as their lifetime keys.

**Witness:** Folder listing at this head: three files, no `sources.toml`. This is the previous report's R01, unchanged.

**Repair:** Add `sources.toml` with one key per work, both locators for works read in preprint and published form, `cited_for`, and the service's `url`, `fetched_from`, `sha256`, `licence_class` and `status`; paywalled items stay `uncertified`. The Stix 2011 entry carries both the arXiv v1 locator and the JPAA 215 (2011) 1371–1397 DOI with a `version_note` that locators use v1 numbering.

**Repair test:** The Ciperiani–Stix entry's `fetched_from` is the publisher's open PDF, licence class publisher-open; the Stix 2011 entry's is arXiv.

## R02 (P3) — Remove the dangling dilogarithm identifier

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:7016`: “Thus `colemanDilogarithm=−I_(01)`; using the forward coefficient without the minus sign fails both the derivative and normalization.”

**Claim:** §5.0 defines the tensor-path dilogarithm as `Li₂⁰` with `Li₂⁰=−I_(01)` (lines 7010 and 7012); the Check at line 7016 names `colemanDilogarithm`, defined nowhere and declared nowhere.

**Witness:** `grep colemanDilogarithm README.md` returns line 7016 only; `Suggested.lean` declares one theorem, `anabelian_isom`. Previous report's R02, unchanged.

**Repair:** Write “Thus `Li₂⁰=−I_(01)`”.

**Repair test:** The computed values stand: `∑ zⁿ/n²` has constant term 0 and linear coefficient 1; `I_(01)=−z−z²/4−⋯`; so `Li₂⁰=−I_(01)`.

## R03 (P3) — Record the curve inputs in the supplier contracts

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:13` (“AlgebraicCurves Layers 4, 7, 9 and 12 supply …”) against the uses at lines 4179, 4187 and 4439 (“AlgebraicCurves Layer 0 … SchemeAndStackFoundations §4.9”).

**Claim:** The any-field curve branch of §1.9 consumes AlgebraicCurves Layer 0 (the relative algebraic constant field) and SchemeAndStackFoundations §4.9 (Stein factorisation), but the scope sentence and the SchemeAndStackFoundations contract paragraphs do not list them. Both sections exist on main, so this is a listing gap, not drift.

**Witness:** Before line 130, `AlgebraicCurves` occurs only at line 13 and `4.9` nowhere. Previous report's R03, unchanged.

**Repair:** Add Layer 0 to the AlgebraicCurves clause at line 13 and a clause for §4.9 (Stein factorisation; geometric connectedness of fibres of a proper morphism with `f_*O=O`) to the SchemeAndStackFoundations contract.

**Repair test:** An elliptic curve over `F₄` read as a connected `F₂`-curve has constant field `F₄` and two conjugate geometric components of genus one; the contract names the supplier of that constant field.

## Previous findings

- R01 — not repaired: no `sources.toml` at this head; this report's R01, now also covering the two new references.
- R02 — not repaired: README:7016 still reads “Thus `colemanDilogarithm=−I_(01)`”; this report's R02.
- R03 — not repaired: README:13 still lists “AlgebraicCurves Layers 4, 7, 9 and 12” and the contracts name no §4.9; this report's R03.

## Verified sound

### Gate, dependency order, folder and elaboration

- The worker's gate at e47aa4f reports every counter zero with `build=0`; my own plain gate run on this head: every counter zero, `dirty=0`, `outside-folder=0`, `stray-files=0`, OK. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Independent dependency check: `depcheck: 205 roadmaps, 1447 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- The diff touches README.md only (10 insertions, 0 deletions); `Suggested.lean` (76 lines, one theorem) is byte-identical to the head the previous report read.
- The packages directory of this worktree is at the manifest pins (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aa…`) with `TauCeti/AlgebraicGeometry/Cohomology/Genus.olean` present; the worker's signature extraction failed on a different shared packages directory, not on this one. `lake env lean` on a scratch copy of `Suggested.lean` with `#check @anabelian_isom` appended elaborated in 8.5 s with `sorry` as the only warning. The printed type keeps every binder: `Fact p.Prime`, both fields, `Algebra ℚ_[p] L`, the embedding, the finite-generation witness, both `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` instances, both `FiniteDimensional K (Cohomology (InvertibleSheaf.trivial _).obj 1)` instances, both genus bounds `2 ≤ Scheme.genus K _`, the `∀ e : P.Over ⊤ X ≌ P.Over ⊤ Y`, the constant-cover compatibility hypothesis and the `∃! f : X ≅ Y` conclusion. Nothing silently disappeared.
- One-tactic probe on a second scratch copy: `simp` leaves unsolved goals, `infer_instance` reports “type class instance expected”, `rfl` reports no binary relation. The headline is not padding. No data definition, no `set_option`, imports `Mathlib` and one existing `TauCeti` module.

### Changed passages: sources opened

| Passage | Text and locator | Result |
|---|---|---|
| New Check, §7.1 Grothendieck's section conjecture (README:8602) | Ciperiani–Stix, JTNB 27 (2015), `ciperiani-stix-2015 lines 75–80` (printed p. 48), Theorem 1: for every abelian variety A over a number field k there are sections of `1→π₁(A_k̄)→π₁(A)→Gal_k→1` not from rational points; the section space has a group structure, is isomorphic to `H¹(k,T(A))` and contains a copy of `Ẑ^d`, `d=[k:ℚ]dim A`. Lines 65–66 define the section space as `π₁(A_k̄)`-conjugacy classes (the roadmap's geometric-kernel conjugacy); lines 82–87 (Remark 2(1)) note that the rank-0 case is the real content. | Supports the Check as written, including “even when `A(k)` is finite” and the value of d. The roadmap's added hypothesis `dim A ≥ 1` is needed and correct (see Source issues). |
| New Check, §7.1 cuspidal packets (README:8639) | Stix, arXiv:0910.5009v1, `stix-brauer-manin-2011 lines 591–617` (printed pp. 15–16), §5.1: affine curve `2Y²=Z⁴−17, Y≠0` in the plane; projective model in `P³` smooth of genus 1 with good reduction outside {2,17}; the reduced locus `TB=0` is `Spec ℚ(⁴√17) ⊔ Spec ℚ(√2)`, étale of degree 6; U is hyperbolic of type (1,6). Lines 693–695, Theorem 27: `π₁(U/ℚ)` does not split, so the section conjecture holds trivially for U, with neither points nor sections. Lines 626–632: `X(ℚ)=∅` (Lind 1940, Reichardt 1942). | Supports every clause: genus-one compactification, six geometric cusps none rational, no section, `U(ℚ)=∅`. |
| New reference `ciperiani-stix-2015` (README:9153–9155) | Source lines 5–7 and 23–24: Tome 27, no 1 (2015), pp. 47–52; DOI 10.5802/jtnb.892 is the fetched URL's item id. | Bibliographic data correct. |
| New reference `stix-brauer-manin-2011` (README:9157–9159) | Crossref record for DOI 10.1016/j.jpaa.2010.08.017: Jakob Stix, The Brauer–Manin obstruction for sections of the fundamental group, J. Pure Appl. Algebra 215 (2011), issue 6, 1371–1397. arXiv v1 numbering (Theorem 27, §5.1) verified in the fetched v1. | Bibliographic data correct; the README says locators use the v1 numbering, and they do. |

### Supplier citations and ownership for the changed passages

| Citation | Where it resolves | Contract |
|---|---|---|
| Injectivity of the section map (cited by the new abelian-variety Check) | README:8562–8569, this roadmap | k with no infinitely divisible points on abelian varieties, X geometrically connected with an immersion into an abelian variety; an abelian variety A over a number field qualifies with the identity immersion and Mordell–Weil. |
| Sections of an abelian variety and the Kummer map | README:8543 | Sect(A/k) as geometric-kernel conjugacy classes; for abelian kernel, conjugation by `a` changes a section by the coboundary `a−σa`, so Sect(A/k)≅H¹(k,T̂A), as the Check and Ciperiani–Stix line 130 both state. |
| Cuspidal packets and the affine section conjecture, definition | README:8616–8618 | k finitely generated over ℚ, U affine smooth geometrically connected hyperbolic, D nonempty reduced finite étale; the Reichardt–Lind U satisfies all of these over ℚ. |

Ownership: `roadmaps grep -i 'Ciperiani|Reichardt'` over main and the 433 open pull requests finds the Lind–Reichardt curve in EffectiveDiophantineMethods §3.24 (a nontrivial torsor class; the Hasse-principle failure) and ArithmeticStatisticsPartII (a local-solubility Check). Neither states anything about sections of `π₁`; the new passages are Checks, not targets, so nothing is planned twice. Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial pass

New rows carry computed values; rows for statements the diff leaves untouched are carried from the previous report (its table, which in turn carries the 108-row table with the exhaustive `S₃` test from the report before it).

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| New Check: SectionConjecture(A/k) fails for `dim A ≥ 1` | `k=ℚ`, `E=18496k1` (`y²=x(x²+17)`, the Reichardt–Lind Jacobian), `E(ℚ)=ℤ/2` | `κ_E` injective: image has 2 elements; `Sect(E/ℚ)≅H¹(ℚ,T̂E)⊇Ẑ^1`, uncountable; `d=1·1=1` | Not surjective though `E(ℚ)` finite. Retain. |
| Same, boundary | `dim A=0`, `A=Spec k` | `Ẑ^0=0`; `A(k)` and Sect(A/k) both one point; `κ` bijective | The `≥ 1` hypothesis is necessary; the source's Theorem 1 omits it (Source issues). Retain the roadmap's wording. |
| Same, growth of d | `k` quadratic, `dim A=2` | `d=2·2=4` | Matches `[k:ℚ]·dim A`. Retain. |
| Same, infinite rank case | `E/ℚ` of rank `r≥1` | `E(ℚ)` countable; `Ẑ^1` uncountable | Fails by cardinality alone, as Remark 2(1) says. Retain. |
| New Check: Reichardt–Lind, hyperbolicity | `g=1`, `deg D=6` | `2g−2+deg D=0+6=6>0` | Hypothesis of the definition met. Retain. |
| Same, cusps | `TB=0` | at infinity (`B=0`): `2T²=A²`, 2 geometric points over `ℚ(√2)`; `Y=0` (`T=0`): `Z⁴=17`, 4 geometric points over `ℚ(⁴√17)`; `2+4=6`, `D(ℚ)=∅` | Six geometric cusps, none rational. Retain. |
| Same, both sides of the bijection | `U(ℚ) ⊔ ⨿_{d∈D(ℚ)} Packet(d)` versus `Sect(U/ℚ)` | left: `∅ ⊔ ∅ = ∅` (`X(ℚ)=∅` so `U(ℚ)=∅`; no rational cusp); right: `∅` by Theorem 27 | Bijection of empty sets; the proposition holds. Retain. |
| Same, control | the projective `X` | `X(ℚ)=∅` but whether `π₁(X/ℚ)` splits is Stix's Question 34 (`lines 933–934`) | The Check is correctly stated for U only. Retain. |
| Hoshi pro-p non-example, SectionConjecture Checks for `Spec k`, `P¹`, `G_m` | as in the previous report | carried | Carried from the previous report. |
| §0.11 twisted kernel and its H¹, §0.13 twisted quotients, §0.18 finite-quotient colimit, §0.30 abstract embedded kernels, §0.31 invariant orbit transport | seeded sample, untouched by the diff | carried | Carried from the previous report. |
| §1.2 tangential specialization, §2.3 two finite towers, §2.4 universal objects and Hodge filtration, §3.7 geometric sections and line bundles | seeded sample, untouched | carried | Carried from the previous report. |
| §4.8 local conditions and Selmer varieties, §4.9 tangential Selmer (`P¹−{0,1,∞}` over ℤ, tangential realization) | seeded sample, untouched | carried | Carried from the previous report. |
| §6.3 height representation, §6.6 local terms and the height pair, §6.8 potentially good reduction, §7.4 conditional routes | seeded sample, untouched | carried | Carried from the previous report. |
| Headline `anabelian_isom` | genus-2 curve, identity versus hyperelliptic involution | `+I` and `−I` on `H⁰(Ω¹)`, distinct outer classes; `∃!` is uniqueness within one class | Carried from the previous report; re-elaborated here with all binders present. |

### Shape of the changed passages

Both new bullets sit in the `**Checks.**` lists of their targets (SectionConjecture and CuspidalSectionConjecture), state a computed outcome (never surjective; both sides empty), name the plausible wrong reading they exclude (surjectivity for abelian varieties; a cuspidal statement that needs a rational cusp), and carry a locator in parentheses at the claim. Neither names a Lean counterpart. The two reference entries follow the bibliography's shape (author, title, venue, DOI, which numbering the locators use). No process words, pull-request numbers, LaTeX or `lemma` were introduced; the gate's scanners agree.

## Not verifiable

- The passages the diff does not touch were not re-examined; the previous report's unverifiable items stand: Hadian's thesis, Labute 1967, the published Achinger, Serre Chapter V and Stix 2013 locators, and Kim 2008's published pagination.
- The published JPAA version of Stix 2011 is paywalled; its numbering was not collated against arXiv v1. The README says locators use v1, which was read.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- **Error** in ciperiani-stix-2015 at Theorem 1, printed page 48: the theorem is stated for every abelian variety over a number field, but for an abelian variety of dimension zero the section space and the point set are both one point and the Kummer map is bijective; it should assume dimension at least one; affects nothing (the roadmap's Check adds the hypothesis).
