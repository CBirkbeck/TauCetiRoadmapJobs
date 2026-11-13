# FIX-RT-ModpRepresentationsOfGL2OverLocalFields~1

Repair of red-team round 1 (reviews `~1a` and `~1b`) on `packages/ModpRepresentationsOfGL2OverLocalFields`.
Every finding was checked against the cited sources, the supplier roadmaps (read with
`roadmaps show`, i.e. at the heads of their open pull requests, and on main for
RepresentationTheory/QuiverRepresentations and RepresentationTheory/ArtinAlgebras) and the pinned
Mathlib and Tau Ceti. All fourteen findings hold; one suggested repair (1b/F09) is itself false at
a boundary and was applied in corrected form. Files changed: `README.md`, `design/plan.json`
(top-level `gaps` only), `sources.toml` (new key `BDJ10`). `Suggested.lean` is unchanged.

## RT-ModpRepresentationsOfGL2OverLocalFields~1a/F01 (P1) — applied

Witness holds (`p = 5`, `U = C₂`: `𝔪 = 𝔪²`, `gr M = 0`, `j_R(M) = 0`; BHHMS23 line 2392 assumes
pro-`p`). §4.2: "compact analytic without `p`-torsion" → "compact analytic pro-`p` group without
`p`-torsion", §0.5 hypotheses spelled out; `C₂` Check added. Pattern: §0.5 gives only
`j_R ≥ j_{gr R}`; equality is `gap:filtered-grade-equality`.

## RT-ModpRepresentationsOfGL2OverLocalFields~1a/F02, RT-ModpRepresentationsOfGL2OverLocalFields~1b/F04 (P1) — applied

PadicLocalLanglandsForGL2Qp §5.1 defines blocks; §5.2 lists them; nothing states finite
`Ext¹_{G,ζ}`. Added `gap:fixed-central-character-ext1-finite` (supplier §5.2, where the `Ext¹`
computations sit; 1a suggested §5.1). §1.4 route rewritten: finite splitting `k′` (exact
adjunction), vanishing for distinct central characters, left-exact comparison sequence, finite
blocks of §5.2. Contract lines and Layer 1 Dependencies cite §§5.1–5.2. New `p = 2` Check.

## RT-ModpRepresentationsOfGL2OverLocalFields~1a/F03 (P1) — applied

NoncommutativeAndEquivariantIwasawa §0.5 is stated for "a complete separated nonnegative adic
filtration with `F¹R⊆Jac(R)`"; the PBW filtration is increasing with `F₀ = k`. §4.4 route: "PBW and
§0.5 give Auslander regularity" → identification with `U_k(⊕𝔥_i)` plus
`gap:enveloping-auslander-regular` (§0.5), citing pinned
`TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`; BHHMS23 line 2800 cites an
enveloping-algebra theorem. Check added.

## RT-ModpRepresentationsOfGL2OverLocalFields~1a/F04 (P1) — applied

SmoothRepresentationsOfLocalGroups SR.0d.1 states Grothendieck + enough injectives only. §4.6 now
proves existence: `TauCeti.exists_isInjectiveEnvelope` for `k[U]`-modules, then the smooth part (SR.0.2
*smooth-rep-category*: right adjoint of the exact inclusion, so injective; essential since `τ`
essential in `E`); uniqueness `TauCeti.IsEssentialMono.exists_iso`. §§5.6, 6.6, Layer 4–6
Dependencies and the SR.0d.1 contract (now only §2.2) updated; `k → k²` and `ℤ_p` Checks added.

## RT-ModpRepresentationsOfGL2OverLocalFields~1a/F05 (P3) — applied

§5.6: restating Checks → `p = 17`, `σ = Sym^5`: `V = σ` (dim 6), `I(σ, Sym^9⊗det^6)` (dim 16,
`K₁`-trivial), `P_σ` (dim 34) without `[V:σ]=1`; and `Ext¹_{K/Z₁}(Sym^{14},Sym^{14}) = 0` vs
`Ext¹_{K/Z₁}(Sym^{15},Sym^{15}) ≠ 0` (HW22 line 564). §6.7 → lengths `8/4/4`, `20/10/10` vs `8`,
and `f = 2`: `12` per hull, `48`, `16`.

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F01 (P2) — applied

§R17.5.11 states Brauer characters, additivity and the lattice comparison; the pairing appears only
in its proof. Pinned `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`
(`Multiplicity.lean:158`, split form, `dim End_A(S) = 1`) now gives the last equality of §5.4; the
GL2AutomorphicRepresentationsAndTransfer contract and its citations (scope, §5.4, Layer 5
Dependencies) removed; §0.6 no longer used by §5.4 ("How to read the build" updated).

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F02 (P3) — applied

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 opens with "Use PadicLocalLanglandsForGL2Qp
§§2.7–2.8's `SerreWeight`, … and extend them". Contract §2.7 sentence, the scope bullet and the
R07.5.15 bullet now say: at `F = ℚ_p` the declarations are those of §§2.7–2.8; R07.5.15 extends
them to every `F` over `k̄`.

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F03 (P3) — applied

PotentialAutomorphyInfrastructure §3.12 is `derived_ordinary_comparison`; derived `N`-invariants
are the last interface item of §3.7. Contract bullet "§3.12 (derived ordinary comparison) …" →
"§3.7, last interface item …"; scope line "§3.12" → "the same §3.7"; §2.2 *Needs:* and Layer 2
Dependencies "§§3.7 and 3.12" → "§3.7".

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F05 (P3) — applied

Scope bullet "the `ℚ_p` finite-length criteria of Colmez–Dospinescu–Nizioł §1.4 (Layer 1)" → "the
finite-length criteria for finitely generated smooth representations of `GL₂(ℚ_p)/p^ℤ`: finite type
implies finite presentation, finite cosocle implies finite length, and finite length is detected
by the smooth vectors of the dual (Layer 1)". No other layer is identified by a source section.

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F06 (P3) — applied

`TauCeti.IsSmoothDiscrete` verified at `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259`
(fields `discreteTopology`, `stabilizer_isOpen`). Added to "From Tau Ceti" with its relation to
`IsSmoothRep` (same stabiliser condition; agrees for the discrete topology), and a pointer in the
scope sentence on the local smoothness predicate.

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F07 (P3) — applied

VIGNERAS11 line 7 is titled `De GL(2,F) à Gal_{Q_p}` (arXiv v1). References entry now names the
published title and states that the locators use the preprint arXiv:0909.4003v1 titled
*De GL(2,F) à* `Gal_{ℚ_p}`. `sources.toml` already records that title and the version note.

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F08 (P2) — applied

QuiverRepresentations on main: no socle; Krull–Schmidt is §2.1; §3.1 leaves the duality to
ArtinAlgebras §2.3. Contract → §2.1 and §3.1; new "From …ArtinAlgebras" (§2.3) for the dual forms of
§§5.6, 9.2; Tau Ceti `TauCeti.socle`, `TauCeti.exists_isInjectiveEnvelope_of_finite` added;
Conventions define `soc`, `rad` (`Module.jacobson`), `cosoc`, Loewy length; all eleven "Layer 3"
citations replaced.

## RT-ModpRepresentationsOfGL2OverLocalFields~1b/F09 (P2) — applied differently

The Buzzard–Diamond–Jarvis set was defined nowhere upstream (HilbertModularVarietiesAndShimuraCurvesPartII §0.2 is later). §3.4 now defines `W_BDJ(ρ̄)` for tame `ρ̄` (BDJ10 §§3.1–3.2, fetched). The
suggested "`W(ρ̄) = W_BDJ(ρ̄)` under 1-deep" is false: `p = 5`, `ω³⊕1`, `μ−η=(2,0)` gives
`{Sym², det³}` versus `{Sym², det³, det³⊗Sym⁴}`. Stated instead: regular part under 1-deep;
equality when irreducible or 2-deep; boundary Check added.

Evidence for the correction: BDJ10 line 1116 counts `|W′(χ₁,χ₂)| = 2^f + #{B : n ≡ n_B}`; at
`f = 1`, `p = 5`, `n = 3 ≡ n_∅ = −1 (mod 4)`, so `A = ∅` admits `r ∈ {0, 4}`. The extension-graph
map has only regular values (BHHMS23 line 687), so `det³ ⊗ Sym⁴` (`r = p − 1`) cannot be in
`W(ρ̄)`. The proof of the corrected statement (counting regular solutions per subset; base-`p`
digit argument under 2-deep) is in the §3.4 route.

## Checks run

- `lake env lean packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean` (from the
  content checkout): exit 0; output only the seven `declaration uses 'sorry'` warnings, at lines
  104, 121, 133, 151, 166, 180, 202. `Suggested.lean` was not modified (no finding asked for a Lean
  change; no README target with a Lean counterpart changed its statement).
- `#check @name` for all 12 declarations, in one scratch file holding a copy of `Suggested.lean`:
  exit 0. Each elaborated type was compared with its README statement: `IsSmoothRep`,
  `IsTorsionAdmissible`, `IsFinitelyPresented`, `smoothDualSpan` keep `A`, `G`, `V` with
  `[CommRing A] [Group G] [TopologicalSpace G] [AddCommGroup V] [Module A V]`; `GL2ModScalar F ϖ`;
  the three `ℚ_[p]` theorems carry `IsSmoothRep ρ` and `Module.Finite (MonoidAlgebra k G′)`; the
  Layer 0 and 2 theorems carry the local-field instances, both residue `CharP p`, `Irreducible ϖ`,
  `IsTorsionAdmissible p ρ`, `IsFinitelyPresented ρ`; the Banach theorem keeps `hF`, the lower
  Borel predicate, joint continuity, `CompleteSpace E`, `IsModuleTopology`. Nothing changed.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`.
  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere
  (it did not check names outside TauCetiRoadmap; every new library name was checked by hand at the
  pin: `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`
  (`Algebra/Module/ProjectiveCover/Multiplicity.lean:158`), `TauCeti.jordanHolderMultiplicity`
  (`RingTheory/CompositionSeries/Multiplicity.lean:217`), `TauCeti.exists_isInjectiveEnvelope`
  (`Algebra/Module/Injective/Envelope/Existence.lean:109`), `TauCeti.IsInjectiveEnvelope`
  (`…/Envelope/Basic.lean:95`), `TauCeti.exists_isInjectiveEnvelope_of_finite`
  (`…/Envelope/FiniteDimensional.lean:67`), `TauCeti.IsEssentialMono.exists_iso`
  (`CategoryTheory/Injective/Envelope.lean:103`), `TauCeti.socle`, `TauCeti.le_socle_iff_isSemisimpleModule`,
  `TauCeti.socle_eq_top_iff` (`RingTheory/SimpleModule/Socle.lean:42, 64, 73`), `TauCeti.IsSmoothDiscrete`
  (`…/SmoothDiscrete/Basic.lean:259`), `TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`
  (`Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213`), Mathlib `Module.jacobson`
  (`RingTheory/Jacobson/Radical.lean:45`), `TopRep` (`RepresentationTheory/Continuous/TopRep.lean:31`)).
- `sources fetch` for BDJ10 (arXiv:0810.2106v5): certified, open repository; entry adjusted
  (locator, publication year, version note). The service also re-serialised the field order of the
  BARTHEL-LIVNE94 and SERRE-LRFG entries without changing their content. No text is missing; no
  `needs-references.toml` was written.
- Gate failures: `tex=1`, the VIGNERAS11 entry under References in `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`, whose preprint title carried the TeX-style subscript `_{ℚ_p}` outside a code span. The title now reads *De GL(2,F) à* `Gal_{ℚ_p}`, the formula moved into a code span; nothing else changed. A scan of the README and this report for `_{`, `^{`, `$` and backslash markup outside code spans and indented code blocks finds no other occurrence. The dependency check, re-run after this edit: `depcheck: 239 roadmaps, 2170 edges, 0 problem(s)`.

## Adversarial pass on changed and added statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.2 comparison (pro-`p`) | `U = C₂`, `p = 5`, sign `M` | `𝔪 = 𝔪²`, `gr M = 0`: RHS `−∞`; `j_R(M) = 0`: LHS `0` | fails without pro-`p` | hypothesis added, Check |
| §4.2 | `U = ℤ_p^d`, `M = k`; `U = {1}`, `M = k`; `M = 0` | `d − d = 0 = dim Supp k`; `0 − 0 = 0 = dim Supp k`; `−∞ = −∞` | holds | none |
| §4.2 route, inequality only | §4.7 use | `dim_I V = d − j_R ≤ d − j_{gr} = dim Supp ≤ dim C_J(k) = f` | headline needs only `≥` of §0.5 | equality via new gap |
| gap filtered-grade-equality | `R = ℤ_p[[T]]`, `M = R/(T)` | `j_R = 1`, `gr M = 𝔽_p[P,T]/(T)`, `j_gr = 1` | true | gap |
| §4.4 Auslander regularity | `f = 1`, PBW filtration | `F₀ = k ≠ U(𝔥)`, increasing | §0.5 inapplicable | gap enveloping-auslander-regular |
| gap enveloping-auslander-regular | `𝔤` abelian of dim `d`; Heisenberg | `U = k[x₁..x_d]`, regular; `gr_PBW U(𝔥) = k[e,f,h]` | true | gap |
| §4.6 envelope existence | `U = {1}`, `τ = k`; `U = ℤ_p`, `τ = k`; `τ = 0` | envelope `k` (not `k → k²`); `C^∞(ℤ_p,k)`, dual `k[[T]]`, infinite-dim; `0` | holds | Checks |
| §1.4 route, central characters | `p = 5`, `δ(u) = ū`, `z = 2` | `δ(4) = 4 ≠ 1`: distinct central characters, `Ext¹ = 0` | holds | none |
| §1.4 comparison sequence | `p = 2`, `π = π′ = 1` | `Ext¹_G(1,1) = Hom(ℚ₂^×, k)`, dim 3; image `2ℓ(z) = 0` | not right exact; left exact used | Check |
| §1.4, `X` term | odd `p`; `p = 2` | `dim Hom_cont(ℚ_p^×, k) = 2` (`ℤ`, `1+pℤ_p`); `3` (`ℤ`, `±1`, `1+4ℤ₂`) | finite | none |
| §1.4 scalar extension | `[k′:k] = 2` | `dim_k Ext_k(π, π′⊗k′) = 2·dim_k Ext_k(π,π′)`, `dim_{k′} = dim_k Ext_k(π,π′)` | consistent | none |
| gap fixed-central-character-ext1-finite | `p = 2`, `π = π′ = 1`, `ζ = 1` | `Hom(ℚ₂^×/(ℚ₂^×)², k)`, dim 3 | finite | gap |
| §3.4 `W_BDJ`, reducible | `p = 17`, `f = 1`, `ω⁶ ⊕ 1` | `Sym⁵` (`r+1=6`), `Sym⁹⊗det⁶` (`r+1=10`, `b=6`), no other `r ≤ 16` | `= W(ρ̄)` | Check |
| §3.4 `W_BDJ`, irreducible | `p = 17`, `ω₂⁶ ⊕ ω₂^{102}` | `Sym⁵`; `Sym^{11}⊗det⁵`: `ω₂^{90}(ω₂^{12}⊕ω₂^{204})`, `294 ≡ 6 (288)` | `= W(ρ̄)`, matches §3.5 | Check |
| §3.4 comparison, boundary | `p = 5`, `f = 1`, `μ−η = (2,0)`, `ω³⊕1` | `W = {Sym², det³}`; `W_BDJ` adds `det³⊗Sym⁴` (`n = 3 ≡ n_∅`) | 1-deep equality false | corrected statement, Check |
| §3.4 2-deep digits | `p = 7`, `f = 1`, `m+1 ∈ {3,4}`; `p = 7`, `f = 2`, `m = (2,2)` | `n ∈ {3,4}` vs `n_A ∈ {1, 5}`; `n = 24 = (3,3)` vs `n_A ∈ {0, 8 = (1,1), 40 = (5,5)}` | no coincidence | none |
| §3.4 `W_BDJ`, wrong normalisation | arithmetic Artin map, `p = 17` | `ω⁶⊕1 ↦ ω^{10}⊕1`: `{Sym⁹, Sym⁵⊗det^{10}}`, the dual's weights | excluded by Conventions | existing Check |
| §2.4 Check (Le) | `F = ℚ_{p³}`, irreducible `ρ̄` | irreducible: `W = W_BDJ` under 1-deep | consistent | wording |
| §5.4 last equality (pin) | `f = 1`, `σ = Sym^{p−1}`, `P_σ = σ` | `dim Hom(σ, St̄) = 1 = [St̄:σ]`; `dim Hom(σ, k) = 0 = [k:σ]`; `End(σ) = k` | holds | none |
| §5.6 Checks | `p = 17`, `σ = Sym⁵`, `τ ∈ {σ, Sym⁹⊗det⁶}`; no multiplicity condition | dims `6`, `6 + 10 = 16`; `P_σ`: `6+6+10+12 = 34 = 2p` | discriminating | Checks |
| §5.6 self-Ext | `p = 17`, `r = 14, 15` | `0`; `≠ 0` (HW22 line 564); `Ext¹_Γ(Sym^{15},Sym^{15}) = 0` (§3.3) | bound sharp | Check |
| §6.7 Checks | `p = 23`, `μ−η = (10,0)`; mult `(2,3)`; `f = 2` | `8, 4, 4`; `20, 10, 10` vs `8`; `12` per hull, `48`, `16`; box rank `Σa_i ≤ 1` gives `3` | discriminating; 8-deep `8 < 11 < 15` | Checks |
| ArtinAlgebras §2.3 use | `A₁ = k[[K/Z₁]]/𝔪_{K₁}²` | `g ↦ g⁻¹` preserves `𝔪_{K₁}²` (`K₁` normal): anti-involution | duality applies | contract |
| Conventions `soc`, `rad` | `M = k[ε]/(ε²)` over itself | `soc = rad = (ε)`, `cosoc = k`, Loewy length 2 | consistent with §§6–9 usage | none |

## Ownership, suppliers and maintainer notes

- **Moved down:** the tame Buzzard–Diamond–Jarvis set is stated here (§3.4) because its only
  planned owner, HilbertModularVarietiesAndShimuraCurvesPartII §0.2, is later in the merge order.
  That roadmap's API item "for tame ρ with 1-deep parameter, W(ρ) equals MP.3's tame weight set" is
  false at the boundary (its own `p = 5`, `ω³⊕1` Check lists three weights); it should cite §3.4's
  comparison (equality for irreducible `ρ̄` or 2-deep, regular part otherwise). Recorded in
  Downstream consumers. Not edited (outside this package).
- **New supplier gaps** (README "Exact supplier contracts" and `design/plan.json` `gaps`, same slugs):
  `fixed-central-character-ext1-finite` (PadicLocalLanglandsForGL2Qp §5.2),
  `filtered-grade-equality` and `enveloping-auslander-regular` (NoncommutativeAndEquivariantIwasawa §0.5).
  Ownership search (`roadmaps grep` over main and the open heads) found no roadmap stating finite
  `Ext¹_{G,ζ}` between irreducibles of `GL₂(ℚ_p)` or Auslander regularity of an enveloping
  algebra; the pins have neither (`grep` for "Auslander" finds only Auslander–Reiten files).
- **Supplier changes:** GL2AutomorphicRepresentationsAndTransfer is no longer a supplier; new
  supplier RepresentationTheory/ArtinAlgebras §2.3 (on main). SR.0d.1 is now cited only for §2.2.
- **Source issue:** BHHMS23, Proposition 2.4.2, p. 16 (BHHMS23 lines 716–718) states
  `W(ρ) = {F(t_{μ−η}(sω))}` under 1-deep; it fails when some weight of the BDJ set has all
  `r_i ∈ {0, p−1}` (e.g. `p = 5`, `f = 1`, `ω³⊕1`); it holds for irreducible `ρ` or 2-deep `μ−η`, and
  in general on regular weights. Affects a stated result; this roadmap never uses the false case.
- **Names cited by other roadmaps:** no Lean name changed; no section was renumbered; the MP mapping
  table is unchanged. §3.4 gained `W_BDJ(ρ̄)`; §4.6 gained the smooth envelope `Inj_U τ`.
- Ownership against the 233 listed open pull requests was checked through `roadmaps grep`/`show`
  for the objects added (BDJ set, smooth injective envelopes, finite `Ext¹`, enveloping-algebra
  regularity); no other owner of the smooth envelope construction was found.
- Untrusted text: nothing in the reviews or fetched texts asked for actions outside this job.
- The "For the human reviewers" section of review `~1b` was not acted on.
