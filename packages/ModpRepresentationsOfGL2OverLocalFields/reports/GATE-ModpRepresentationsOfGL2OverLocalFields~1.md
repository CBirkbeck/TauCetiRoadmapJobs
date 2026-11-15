# GATE-ModpRepresentationsOfGL2OverLocalFields~1

Answer to the one unanswered comment on the roadmap's pull request (CBirkbeck, 2026-11-15T14:25:53Z,
an AI review of `e9433e9` carrying sixteen red-team findings F01–F16). The quoted copy of the comment
given to this job breaks off inside F09; the complete text was read from the pull request (read only)
so that all sixteen points are answered. H01–H16 below are F01–F16 in order. Every point was checked
against the cited sources, the supplier roadmaps (SmoothRepresentationsOfLocalGroups,
RepresentationTheory/QuiverRepresentations and RepresentationTheory/ArtinAlgebras on main;
PadicLocalLanglandsForGL2Qp, NoncommutativeAndEquivariantIwasawa, GL2AutomorphicRepresentationsAndTransfer,
FiniteFlatGroupsAndIntegralPadicHodgeTheory, PotentialAutomorphyInfrastructure and
HilbertModularVarietiesAndShimuraCurvesPartII at the heads of their open pull requests) and the pinned
Mathlib and Tau Ceti. All sixteen hold on the mathematics. Only
`TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md` changed (commit `f40e12e`);
`Suggested.lean` is unchanged, since no finding touches a Lean declaration. Line numbers below are
those of the README at `f40e12e`.

## H01 (CBirkbeck) — applied differently

No supplier states finite `Ext¹`: PadicLocalLanglandsForGL2Qp §5.1 defines blocks, §5.2 lists them and
cites the `Ext¹` computations only as its route, and §5.3 assumes finiteness as (H4). Added
gap:fixed-central-character-ext1-finite (README line 384) with the reviewer's statement, filed at §5.2
rather than §5.1 because §5.2 is where the supplier cites the `Ext¹` computations; the §1.4 route
(line 945) now passes to a finite splitting extension `k′` with the exact adjunction, kills distinct
central characters, uses the left-exact sequence `0 → Ext¹_{G,ζ} → Ext¹_G → Hom_cont(Z, Hom_G(π, π′))`
(CDN23 line 779) and the finite block list of §5.2, and the scope bullet (line 65), the contract
(line 380) and the Layer 1 Dependencies drop the claim that the supplier gives "their Ext computations".

## H02 (CBirkbeck) — applied

§4.4 "PBW and §0.5 give Auslander regularity" → identification of `gr_𝔪 A` with `U_k(⊕𝔥_i)`,
regularity from gap:enveloping-auslander-regular (NoncommutativeAndEquivariantIwasawa §0.5, line 462),
citing pinned `TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`
(`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213`) and BHHMS23 line 2800 (line 1768).
Same pattern repaired in the §0.5 contract and §4.2: the supplier's API states only
`j_R(M) ≥ j_{gr R}(gr M)`, so the contract (line 451) now says so and the equality used by §4.2
(line 1708) is gap:filtered-grade-equality (line 457).

## H03 (CBirkbeck) — applied

SR.0d.1 on main states Grothendieck and enough injectives only, and `TauCeti.IsEssentialMono.exists_iso`
is uniqueness. §4.6 (line 1814) now constructs `Inj_U τ` as the smooth part of the `k[U]`-module
envelope of pinned `TauCeti.exists_isInjectiveEnvelope` (`.../Injective/Envelope/Existence.lean:109`),
injective by the adjunction of SR.0.2 *smooth-rep-category* and essential because `τ` is essential in
`E`; §§5.6 and 6.6 cite §4.6, the SR contracts (lines 349–356) are corrected, and the `k → k²` and
`k[[T]] → k` tests are a Check (line 1847).

## H04 (CBirkbeck) — applied

HU12 line 200 puts `[g, v]` on `KZg⁻¹`, so the criterion "`P⁺KZ` / `wP⁺KZ`" → "`KZ(P⁺)⁻¹` /
`KZ(P⁺)⁻¹w⁻¹`" (line 799), with the convention sentence for `[g, v]` added after the definition of the
standard functions (line 781) and the negative control `sw = diag(ϖ, 1) ∈ P⁺` as a Check (line 815).

## H05 (CBirkbeck) — applied

GL2AutomorphicRepresentationsAndTransfer §R17.5.11 states Brauer characters, additivity and the lattice
comparison; the pairing appears only in its proof. §5.4's last equality is now pinned
`TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`
(`TauCeti/Algebra/Module/ProjectiveCover/Multiplicity.lean:158`, hypothesis
`finrank k (End A S) = 1`) (line 1996); the GL2AutomorphicRepresentationsAndTransfer contract, its scope
text and its Layer 5 citation are deleted, and "§0.6, used in §§5.4 and 9.1" → "§0.6, used in §9.1".

## H06 (CBirkbeck) — applied

QuiverRepresentations on main has no socle, Krull–Schmidt in §2.1, and leaves the left–right duality
to ArtinAlgebras §2.3 (its §3.1). The contract (line 496) now cites §§2.1, 3.1, a new ArtinAlgebras
§2.3 contract (line 505) covers the dual forms of §§5.6 and 9.2, `TauCeti.socle` and
`TauCeti.exists_isInjectiveEnvelope_of_finite` are in the Tau Ceti contract, the Conventions define
`soc`, `rad` (Mathlib `Module.jacobson`), `cosoc` and Loewy length (line 177), and all twelve
"Layer 3" citations now name §3.1 (§§2.1 and 3.1 in §6.5 and the Layer 6 Dependencies).

## H07 (CBirkbeck) — applied

`W_BDJ(ρ̄)` (tame case) moves down from HilbertModularVarietiesAndShimuraCurvesPartII §0.2, which is
later in the merge order: it is defined in §3.4 (line 1518, BDJ10 §§3.1–3.2) and the comparison is the
corrected one of the comment (line 1529): regular part under 1-deep, equality for irreducible `ρ̄` or
2-deep, with the `p = 5`, `ω³ ⊕ 1` boundary and the `p = 17` irreducible count with `ξ` fixed as
Checks (lines 1572, 1580). §2.4's Check (line 1296), the scope bullet and Downstream consumers
(line 2648) follow; BDJ10 is in References.

## H08 (CBirkbeck) — applied

§0.2 "crossed product given by coset representatives of `H/U`" → the rule with `U_g = U ∩ gUg⁻¹` and
product `Σ_a hag ⊗ (g⁻¹x_a g)y` (SHOTTON20 lines 320–327), the crossed product kept for normal `U`
(line 596), and the `S₃`, `U = ⟨(12)⟩` Check added (line 633). The reviewer's `V` is written `U_g`
because `V` already names representations in §0.2.

## H09 (CBirkbeck) — applied

§0.1 gains the locally admissible category with `V ↦ V_{l.adm}` right adjoint to the exact inclusion
and enough injectives from SR.0d.1 (line 566; EMERTON1 Definition 2.2.15–Proposition 2.2.18, EMERTON2
Proposition 2.1.1); §2.1 defines `Ord_B` on smooth torsion representations and proves it preserves
local admissibility (line 1052; EMERTON1 Proposition 3.2.4 and Theorem 3.3.3, an alternative to the
suggested EMERTON2 Theorem 3.4.7(2), which also gives it); §2.2 derives `Ord_B` in that category
(line 1101, EMERTON2 §3.7), and its *Needs:* and the SR.0d.1 contract say so.

## H10 (CBirkbeck) — applied

§5.6 Checks: the two restating bullets → the `p = 17`, `σ = Sym^5` hulls of dimension `6` and `16` with
the non-uniqueness of the cosocle-`σ` submodule without `[V : σ] = 1` (`dim P_σ = 34`), and the sharp
self-extension boundary `Sym^{14}` versus `Sym^{15}` (HW22 lines 558–565) (lines 2099, 2109). §6.7
Checks → lengths `8, 4, 4`, then `20, 10, 10` against `8`, then the `f = 2` count `12` per hull,
`48`, `16` (lines 2281–2289).

## H11 (CBirkbeck) — applied

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 opens by using PadicLocalLanglandsForGL2Qp
§§2.7–2.8's declarations. The §2.7 contract (line 375), the scope bullet and the R07.5.15 contract now
say that at `F = ℚ_p` the declarations are those of §§2.7–2.8 and R07.5.15 extends them to every `F`.

## H12 (CBirkbeck) — applied

PotentialAutomorphyInfrastructure §3.12 is `derived_ordinary_comparison`; derived `N`-invariants are the
last interface item of §3.7. Contract "§3.12 (derived ordinary comparison) …" → "§3.7, last interface
item …" (line 430); scope "§3.12" → "the same §3.7"; §2.2 *Needs:* and Layer 2 Dependencies
"§§3.7 and 3.12" → "§3.7".

## H13 (CBirkbeck) — applied

Line 28 "the `ℚ_p` finite-length criteria of Colmez–Dospinescu–Nizioł §1.4 (Layer 1)" → "the
finite-length criteria for finitely generated smooth representations of `GL₂(ℚ_p)/p^ℤ`: finite type
implies finite presentation, finite cosocle implies finite length, and finite length is detected by the
smooth vectors of the dual (Layer 1)". No other scope item or heading is named by a source section.

## H14 (CBirkbeck) — applied

VIGNERAS11 line 7 (arXiv:0909.4003v1) is titled *De GL(2, F) à Gal_{Q_p}*; the References entry
(line 2748) now names that preprint title, with the formula in a code span, beside the published title.

## H15 (CBirkbeck) — applied

`p = 5`, `f = 2`: the exponents `±1, ±5, ±2, ±10, ±6, ±4` modulo `24` are twelve distinct classes, and
a collision needs `|Σ c_i p^i| ≤ 4p^{f−1}` to reach `q − 1`, which happens only for `q = 5`. §5.1
"`p > 5`" → "`q ≠ 5`" with that route (line 1900), the `p = 5`, `f = 2` Check as its own bullet
(line 1914), Conventions line 203, and §7.5 "`p = 5` collision" → "`q = 5` collision".

## H16 (CBirkbeck) — applied differently

NoncommutativeAndEquivariantIwasawa §0.13 states only `H*(U, 𝔽_p) ≅ ∧*H¹` with `dim H¹ = d`. §5.6 gains
the API bullet of the comment, `1 + pX ↦ X mod p` giving `H¹(K₁/Z₁, k) ≅ ⊕_i A_i^*` for `p > 2`
(line 2090), and its statement cites it, with §0.13 for the dimension only. In §8.1 (line 2448) the
parenthesis now cites §5.6 alone: §8.1 uses the identification but no dimension count, so §0.13 is not
a need of §8.1 (it stays in the Layer 8 Dependencies for §8.6).

## Build, gate and dependency check

- `lake build TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields.Suggested`: `Build completed
  successfully (18239 jobs)`, only the seven `declaration uses 'sorry'` warnings (Suggested.lean lines
  103, 133, 145, 163, 178, 192, 214).
- Gate, after the commit:
  `gate ModpRepresentationsOfGL2OverLocalFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
  (the run before the commit differed only by `dirty=1`).
- Dependency check (`gate --depcheck … --movable --pr 2282`):
  `depcheck: 244 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
  GL2AutomorphicRepresentationsAndTransfer is no longer a supplier; RepresentationTheory/ArtinAlgebras
  (on main) is a new one.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. It does
  not check names outside TauCetiRoadmap, so every library name the repairs add was checked at the pins
  by hand: `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`
  (`Algebra/Module/ProjectiveCover/Multiplicity.lean:158`), `TauCeti.jordanHolderMultiplicity`
  (`RingTheory/CompositionSeries/Multiplicity.lean:217`), `TauCeti.exists_isInjectiveEnvelope`
  (`Algebra/Module/Injective/Envelope/Existence.lean:109`), `TauCeti.IsInjectiveEnvelope`
  (`…/Envelope/Basic.lean:95`), `TauCeti.exists_isInjectiveEnvelope_of_finite`
  (`…/Envelope/FiniteDimensional.lean:67`), `TauCeti.IsEssentialMono.exists_iso`
  (`CategoryTheory/Injective/Envelope.lean:103`), `TauCeti.socle` and
  `TauCeti.le_socle_iff_isSemisimpleModule` (`RingTheory/SimpleModule/Socle.lean:42, 64`),
  `TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`
  (`Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213`, `[Module.Free R L]`), Mathlib
  `Module.jacobson` (`Mathlib/RingTheory/Jacobson/Radical.lean:45`, the infimum of the maximal
  submodules).
- Signatures: Suggested.lean is unchanged and the only Lean command this job may run is the build
  above, so no new `#check` file was elaborated; the twelve elaborated types of `signatures.md` (whose
  `sorry` lines match the build's) were compared with their README statements, none of which the
  repairs changed. Nothing changed in the Lean file.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.4 scalar extension | `[k′ : k] = 2` | `Ext¹_{k[G]}(π, π′ ⊗ k′) = Ext¹_{k[G]}(π, π′)²`: `k`-dim `2d`, `k′`-dim `d` | consistent | route |
| §1.4 distinct central characters | `p = 5`, `z = 2`, `ζ(2) ≠ ζ′(2)` | on `E`, `(z − ζ(z))(z − ζ′(z)) = 0` with distinct roots, `E` splits | `Ext¹_G = 0` | route |
| §1.4 comparison sequence | `π = π′ = 1`; odd `p`, `p = 2` | `Ext¹_G(1,1) = Hom_cont(ℚ_p^×, k)`, dim `2` / `3`; image `ℓ(z²) = 2ℓ(z)`: injective for odd `p`, zero for `p = 2` | left exact only, as used | route |
| gap fixed-central-character-ext1-finite | `p = 2`, `π = π′ = 1`, `ζ = 1` | `Hom(ℚ₂^×/(ℚ₂^×)², k)`, dim `3` | finite | gap |
| §4.2 route | `U = ℤ_p^d`, `M = k`; `U = {1}`, `M = k`; `M = 0` | `d − d = 0 = dim Supp k`; `0 − 0 = 0`; `−∞ = −∞` | holds | gap for equality |
| gap filtered-grade-equality | `R = ℤ_p[[T]]`, `M = R/(T)` | `j_R = 1`; `gr M = 𝔽_p[P, T]/(T)`, `j_gr = 1` | equality | gap |
| §4.4 / gap enveloping-auslander-regular | `f = 1`; abelian `𝔤` of dim `d` | PBW `F₀ = k ≠ U(𝔥)`, increasing; `gr U(𝔥) = k[e,f,h]`; `U(𝔤) = k[x₁..x_d]` | §0.5 inapplicable, gap true | route |
| §4.6 envelope | `U = {1}`, `τ = k`; `U = ℤ_p`, `τ = k`; `τ = 0` | envelope `k`, `k → k²` not essential; `C^∞(ℤ_p,k)`, invariants `k`, dual `k[[T]]`; `0` | holds | Check |
| §0.8 convention | `h ∈ G`, `[g,v]` | `(h·[g,v])(x) = [g,v](xh) ≠ 0` iff `x ∈ KZ(hg)⁻¹`, value `v` at `(hg)⁻¹` | `h·[g,v] = [hg,v]` | sentence |
| §0.8 criterion | augmentation `W = k`; identity of `c-Ind W` | `[1,1], [w,1] ↦ 1`, supports `KZ`, `KZw⁻¹`: `Δ = k`; inverted cells disjoint: `Δ = 0` | agrees with both Checks | API |
| §0.8 old criterion | `s = (0 1; 1 0)`, `w = (0 1; ϖ 0)` | `sw = diag(ϖ,1)`, `diag(ϖ,1)P⁺ ⊆ P⁺`, so `f(x) = s⁻¹f(sx) = 0` | old gave `Δ = 0 ≠ k` | Check |
| §0.2 rule | `S₃`, `U = ⟨(12)⟩`, `g = (123)`; `ℤ_p ⋊ C₂`; `H = 1` | `gUg⁻¹ = ⟨(23)⟩`, `U_g = 1`, `(12)(123) = (23)`, `g⁻¹(12)g = (13)`; `s⁻¹Ts = [−1] − 1`; `𝒪` | consistent with `[(12)][(23)] = [(123)]` | Check |
| §0.1 `V_{l.adm}` | `V = 0`; `H = {1}`; `V = L/𝒪` trivial | `0`; all torsion vectors; each `𝒪v` finite: locally admissible, not of bounded exponent | holds | API |
| §2.1 local admissibility | `V = ⋃ V_n`, `V_n` finitely generated | `Ord_B(V) = ⋃ Ord_B(V_n)` (inductive limits), each torsion-admissible | holds | statement |
| §2.2 `R¹Ord_B` | `0 → V → J → J/V → 0`, `J` injective, locally admissible | `R¹Ord_B(V) = coker(Ord_B J → Ord_B(J/V))`; Steinberg sequence `0 → 0 → χ⊗χ → Ord_B(St⊗χ∘det) → 0` | unchanged values | definition |
| §5.4 last equality | `f = 1`, `σ = Sym^{p−1}`, `P_σ = σ` | `dim Hom(σ, St̄) = 1 = [St̄ : σ]`; `dim Hom(σ, k) = 0 = [k : σ]`; `End(σ) = k` | holds | pinned |
| §3.4 `W_BDJ`, reducible | `p = 17`, `ω⁶ ⊕ 1` | `A = {0}`: `r + 1 = 6`; `A = ∅`: `r + 1 ≡ 10`, `b = 6`; `n = 6 ≠ 1, 15` | `= W(ρ̄)` | Check |
| §3.4 `W_BDJ`, irreducible | `p = 17`, `ω₂⁶ ⊕ ω₂^{102}`, `ξ = ω₂⁶` | `A = {0}`: `r = 5`, `b ≡ 0`; `A = {1}`: `r = 11`, `b ≡ 5 (16)`; unordered: both on `A = {0}` | `= W(ρ̄)` | Check |
| §3.4 boundary | `p = 5`, `μ − η = (2,0)`, `ω³ ⊕ 1` | `W = {Sym², det³}`; `W_BDJ` adds `det³ ⊗ Sym⁴` (`n = 3 ≡ n_∅`) | 1-deep equality false | statement, Check |
| §3.4 2-deep digits | `p = 7`, `f = 1, 2` | `c_i = ±d_i − e_i`, `2 ≤ |c_i| ≤ 5`, `|Σ c_i 7^i| ≤ 5·8 = 40 < 48`, nonzero | no `A` with two weights | route |
| §5.1 bound | `(p,f) = (5,1), (5,2), (7,1)` | `q − 1 = 4`: `2 ≡ −2`; `24`: twelve classes; `6`: `±1, ±2` distinct | only `q = 5` fails | statement, Check |
| §5.6 identification | `p > 2`; scalars; `p = 2` | `(1+pX)(1+pY) ≡ 1+p(X+Y)`; `1+pa ↦ a·1`; `tr 1 = 2 = 0` at `p = 2` | `≅ sl₂(k_F)` for `p > 2`, dim `3f` | API |
| §5.6 Checks | `p = 17`, `σ = Sym⁵` | dims `6`, `6 + 10 = 16`, `P_σ`: `6 + 6 + 10 + 12 = 34 = 2p`; `Ext¹_{K/Z₁}` of `Sym^{14}`, `Sym^{15}`: `0`, `≠ 0` | discriminating | Checks |
| §6.7 Checks | `p = 23`, `(10,0)`; mult `(2,3)`; `f = 2` | `8/4/4`; `20/10/10` vs `8`; `12` per hull, `48`, `16`; box rank gives `3` | discriminating, `8 < 11 < 15` | Checks |
| ArtinAlgebras §2.3 use | `A₁ = k[[K/Z₁]]/𝔪_{K₁}²` | `g⁻¹ − 1 = −g⁻¹(g − 1)` keeps `𝔪_{K₁}²` (`K₁` normal) | anti-involution, duality applies | contract |

## Ownership, suppliers and notes

- Moved down: the tame Buzzard–Diamond–Jarvis set is stated here (§3.4); its only planned owner,
  HilbertModularVarietiesAndShimuraCurvesPartII §0.2, is later in the merge order (merge order lines
  361 and 268) and extends it to every `ρ̄` (Downstream consumers). Its API sentence equating the BDJ
  description with the 1-deep parametrisation is false at the `p = 5`, `ω³ ⊕ 1` boundary; it is not
  edited (outside this job).
- New supplier gaps (README contracts; the pull request carries no plan file):
  gap:fixed-central-character-ext1-finite (PadicLocalLanglandsForGL2Qp §5.2),
  gap:filtered-grade-equality and gap:enveloping-auslander-regular (NoncommutativeAndEquivariantIwasawa
  §0.5). `roadmaps grep` over main and the open heads finds no roadmap stating finite fixed-character
  `Ext¹` for `GL₂(ℚ_p)` or Auslander regularity of an enveloping algebra.
- Owned here after search: the locally admissible category of an arbitrary `p`-adic Lie group with its
  injectives (§0.1; SmoothRepresentationsOfLocalGroups *finiteness-conditions* defines the notion
  without the category, PadicLocalLanglandsForGL2Qp §2.2 has the `GL₂(ℚ_p)` fixed-character case,
  ScholzeFunctorAndModpCohomologyOfTheLubinTateTower uses it and is later) and smooth injective
  envelopes for compact analytic groups (§4.6).
- Sources: no fetch was needed; BDJ10 is already in the cache and in the roadmap's manifest on the
  board, and the README's References now list it. No text is missing; no `needs-references.toml` was
  written.
- Source issues for the record: BHHMS23 Proposition 2.4.2 (BHHMS23 lines 716–718) states the equality
  under 1-deep alone, false at the boundary above; BHHMS23 Lemma 6.1.1 assumes `p > 3` where the
  multiplicity statement needs `q ≠ 5`.
- No section, heading or target id changed and the MP mapping table is untouched, so no consumer
  citation breaks.
- Untrusted text: nothing in the comment asked for actions outside this job.
