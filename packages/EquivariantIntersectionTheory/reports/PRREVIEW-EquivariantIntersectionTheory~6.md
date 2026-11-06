# Review of EquivariantIntersectionTheory (pull request #1685 at 1650b0a)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/EquivariantIntersectionTheory/README.md` and `Suggested.lean` at
`1650b0a`, a repaired head 603 changed lines after `1100c7d`. The gate passes every check
(`build=0`, `depcheck=0`, `blob=0`), `lake env lean` on `Suggested.lean` at the pins (Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9`) reports nine `declaration uses sorry` warnings and nothing else,
the dependency check reports no UPWARD, CYCLE or `moved:` line, and the pull request changes
nothing outside the folder against `origin/main`. Every finding of the previous review is repaired
(the check is below). Two P3 findings remain, both locator or style; nothing blocking.

## Previous findings (review of 1100c7d), finding by finding

- R01 (P2, 3.3 claimed the full Edidin–Hu Chow ring): repaired. `README.md` lines 518–522 now
  state "In characteristic `0`, prove `Pic [M_{0,2g+2}/𝔖_{2g+1}] ≅ ℤ/2g(2g + 1)`, by 3.4 with
  `n = 2g + 2`. This is the degree-one part of Edidin–Hu, Theorem 1.3 … the agreement is a
  comparison, not a target", and lines 40–41 put the ring beyond degree one out of scope.
- R02 (P3, `blob` links, open-revision citations): repaired. Lines 33–35 cite "AlgebraicVectorBundles
  L2A", "SchemeAndStackFoundations §§1.13, 1.15, …", "SchubertGeometry S3" by name; gate `blob=0`;
  "open revision" occurs nowhere.
- R03 (P3, locators): repaired. Lines 370–371 fix the arXiv numbering with Proposition 18 marked
  "published numbering" (line 448); 2.1 cites Definition-Proposition 1, Lemma 12, Proposition 22
  and Totaro Theorem 1.1 and Definition 1.2 (lines 378–382); 1.3 cites "Knop–Kraft–Luna–Vust,
  Lemma 2.2 and Proposition 2.3" (lines 312–313); 3.2–3.4 cite "SchemeAndStackFoundations §4.15";
  the group-scheme supplier is Mathlib `CommHopfAlgCat`, `AlgebraicGeometry.hopfSpec` and
  SchemeAndStackFoundations §1.13 (lines 85–86, 96–97).
- R04 (P3, Laurent-unit lemma not in Mathlib): repaired. 0.2 states `isUnit_laurentPolynomial_iff`
  with its route (lines 149–154) and names `PrimeSpectrum.isClopen_iff` (line 164, 172); the Lean
  declares it (line 78).
- R05 (P3, README shape): repaired. `## Exact supplier contracts` (71), `## How to read the build`
  (105), `## Downstream consumers` (572), `### Examples` and `### Dependencies` in every layer,
  a `*Needs:*` line on all fifteen targets, three or more Checks on each; `LinearizedLine` occurs
  nowhere; line 35 says "SchubertGeometry S3 builds the `G/B⁻` case itself … 1.4 restricted to
  `G/B⁻` agrees with it".
- R06 (P3, docstring): repaired. `Suggested.lean` lines 24–38 name the non-statable headlines of
  Layers 1–3 with the carrier each lacks; the sentence about `sorry` being allowed is gone.
- R07 (P3, unused hypotheses, `Finite σ`, one-term corollary): repaired. `hw`, `he` and
  `[Finite σ]` are gone (lines 113, 121–123); `homogeneousUnitDegrees_depressed` is deleted; the
  README says "the statements need neither" (line 217).
- R08 (P3, slice and unordered roots): repaired. 1.4 states "the action map `U × Y → X` is an
  isomorphism" (lines 339–340) with the `α_p` negative control (350–352); 3.4 item 4 says the
  roots "are not ordered, so a tangent line at a single root is not defined on `[U/Aff]`" and
  computes the product (545–550); item 2 says the inverse "needs `m` invertible" (540).

## R01 (P3) — 3.4 has no locator and does not say it is the roadmap's own computation; 2.2's operations cite no source

Location: `README.md` lines 531–552, "### 3.4 `[M_{0,n}/𝔖ₙ₋₁]` for every `n ≥ 3` … Over a field
of characteristic `0`, for `n ≥ 3` and `m = n − 1`, prove the following." Lines 399–405,
"proper pushforward, flat pullback, the localisation sequence … all deduced from
SchemeAndStackFoundations §§5.2–5.6".

Claim: every target carries a locator or says it is the roadmap's own result with its route.

Witness: 3.4 is the only target with no source citation at all (2.3, the other own computation,
opens with "These are this roadmap's own computations, by the following route" and cites
Edidin–Graham §2.2, Example). The literature has the even case only: Edidin–Hu, Theorem 1.3
(their text, line 86–87) gives the degree-one part for `n = 2g + 2`; for `n = 4` the result is
3.2 through the `μ₂`-gerbe. 2.2's operations are Edidin–Graham §2.3–2.4, Propositions 1–3 of the
arXiv text (eg1998 lines 229, 278, 399), which 2.2 does not cite (it cites Proposition 9 for the
change of presentation only).

Repair: open 3.4 with "This is this roadmap's own computation, by the following route; for
`n = 2g + 2` it is the degree-one part of Edidin–Hu, Theorem 1.3, and for `n = 4` it agrees with
3.2 through the `μ₂`-gerbe" (the Checks already compute both), and add to 2.2 "(Edidin–Graham
1998, §2.3, Propositions 1–3)" after the list of operations.

## R02 (P3) — a Check names a Lean declaration

Location: `README.md` lines 222–223, "with `x` of weight `0` it is still `⊥`, since the units are
the constants, so no positivity is needed for `homogeneousUnitDegrees_weighted`."

Claim: a Check never names or claims a Lean counterpart (house rule for `**Checks.**` bullets).

Witness: `homogeneousUnitDegrees_weighted` is the theorem of `Suggested.lean` line 113; the Check
states a property of the Lean statement rather than of the object.

Repair: "so no positivity is needed for the statement" (the target's prose at lines 209–211
already carries the name).

## Verified sound

**Gate, build, direction, folder.** Gate at `1650b0a`: every scanner 0, `build=0`, `OK`.
`lake env lean TauCetiRoadmap/EquivariantIntersectionTheory/Suggested.lean` at the pins: nine
`declaration uses sorry` warnings (lines 64, 71, 78, 86, 101, 113, 121, 149, 155), no error, no
other warning. Dependency check:

```
depcheck: 240 roadmaps, 2352 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is
empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. No `set_option`, no
`lemma`, no sorry'd data, a single `public import Mathlib` under `module`, no pull-request numbers
or process words in README or docstrings.

**Elaborated signatures.** `#check @` of all fifteen declarations in a probe copy at the pins
agrees with `scratch/signatures.md` and with the README statements of 0.1–0.5:
`eq_map_mulLeft_of_isUnit_mem` and `exists_isUnit_mem_of_connected` carry `[GradedAlgebra 𝒜]
[DirectSum.Decomposition ℳ] [SetLike.GradedSMul 𝒜 ℳ]`, the latter the idempotent hypothesis;
`isUnit_laurentPolynomial_iff` carries `[IsDomain S]`; `awayGrading_isInternal` carries
`[GradedAlgebra 𝒜]` and `hf : f ∈ 𝒜 e`; `depressedDiscr_prime` carries `[CharZero K]` and
`2 ≤ m`; `homogeneousUnitDegrees_weighted` and `_away_prime` carry no positivity, finiteness or
`e ≠ 0` hypothesis, as the README says (line 217). Nothing lost a section binder; README
generality equals the Lean's in both directions.

**One-tactic probe (padding).** Each of the nine sorried theorems tried with
`first | rfl | simp | infer_instance | decide` on the probe copy: none closes (seven fail outright,
`isUnit_laurentPolynomial_iff` and `depressedDiscr_mem` leave unsolved goals after `simp`). The
`m = 2` witness `depressedDiscr K 2 = −4 · a₂` proves at the pin from
`Polynomial.discr_of_degree_eq_two` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` 956) and
`simp`, so the README Check of 0.5 agrees with Mathlib's sign. No declaration restates a
definition, mirrors a Check or computes a value; the three `def`s and the `abbrev` are the
definitions the headlines need. All fifteen Lean names occur in the README (gate
`readme-ids-missing=0`), and the only backticked names of the roadmap's own in the README are these
fifteen.

**Library declarations opened at Mathlib `1b1ccf4b`.** `Polynomial.isUnit_iff`
(`Algebra/Polynomial/Degree/Units.lean` 49, under `[Semiring R] [NoZeroDivisors R]`, as 0.2 uses it
over a domain); `LaurentPolynomial.isUnit_T` (`Algebra/Polynomial/Laurent.lean` 229; the file has
no characterisation of units, so 0.2's lemma is the roadmap's, as stated); `PrimeSpectrum.isClopen_iff`
(`RingTheory/Spectrum/Prime/Topology.lean` 1383: `IsClopen s ↔ ∃ e, IsIdempotentElem e ∧ s =
basicOpen e`, exactly the README's gloss at lines 83–84); `HomogeneousLocalization.Away`
(`RingTheory/GradedAlgebra/HomogeneousLocalization.lean` 600, `Away.mk` with `x ∈ 𝒜 (n • d)`, the
degree-zero part 0.3 identifies); `MvPolynomial.weightedHomogeneousSubmodule`
(`RingTheory/MvPolynomial/WeightedHomogeneous.lean` 128); `Polynomial.discr`
(`Resultant/Basic.lean` 934); `SetLike.GradedSMul` (`Algebra/GradedMulAction.lean` 109);
`CommHopfAlgCat` (`Algebra/Category/CommHopfAlgCat.lean` 30); `AlgebraicGeometry.hopfSpec`
(`AlgebraicGeometry/Group/Affine.lean` 177, `(CommHopfAlgCat R)ᵒᵖ ⥤ Grp (Over (Spec R))`, so
`𝔾_m`, `GL_n`, `μ_n`, `Aff` are group objects over `Spec k` as 1.1 needs). Tau Ceti `2fd255d9`:
`TauCeti.AlgebraicGeometry.LineBundleClass` (`TauCeti/AlgebraicGeometry/LineBundle/Class.lean` 50,
namespace `TauCeti.AlgebraicGeometry`), the name the README uses. No linearised sheaf, quotient
stack or equivariant Chow carrier exists at either pin, so the docstring's non-statable list is
right.

**Cross-roadmap citations resolved on main (`eaf17b1`).** SchemeAndStackFoundations §1.13
(README line 2418; `GroupSpace.ofGroupScheme` 2427, `Action G X := ModObj G X` 2422), §1.15 (2502;
`Gm S` 2523, `picEquiv` 2529), §1.21 (2951; `actionQuotient.torsorEquiv` 2965), §1.22 (2989;
`Stacks.QCoh` 2991, `QCoh.presentationEquiv` 2994), §2.23 (4558; `EquivariantModules X Γ act`
4563), §3.4 (4789), §4.15 (5725; `StableCurves.Mbar` 5727, `Mbar.smooth` 5732), §5.1 (6567,
`ChowGroup κ X k` for `X` locally of finite type over `κ`), §5.2 (6653, with `chow_affine_bundle`
alias `homotopy_invariance`, which 2.2's homotopy invariance consumes), §5.3 (6701, `Chow.c1`),
§5.4 (6721, projective bundle theorem, which 2.3's flag-bundle route consumes), §5.5 (6768), §5.6
(6921). The three names the resolver flagged (`GroupSpace.ofGroupScheme`, `StableCurves.Mbar`,
`actionQuotient.torsorEquiv`) are README targets of SchemeAndStackFoundations, not pinned
declarations: fine. AlgebraicVectorBundles L2A (lines 306–339: the affine graded-ring interface
with its localisation comparison; StableReduction cites it at its lines 319–321, as the boundary
table says). SchubertGeometry S3 (line 46–47: constructs `L(λ)` "with its actual linearization"
itself and cites this roadmap nowhere, as line 35 says). GroupSchemesOverABase at its open head:
"### 6.1 Line bundles over a base" cites "EquivariantIntersectionTheory 1.1" (its lines 736–748),
as `## Downstream consumers` says; it is not on main and not in the merge order, so the direction
is its concern, not this roadmap's. No roadmap on main cites EquivariantIntersectionTheory.
Ownership: `roadmaps grep` over the 460 open pull requests and main for "equivariant Chow",
`Pic^G`, "linearised invertible", `ShiftClassGroup`, Totaro, `Pic M_{1,1}`, Arsie–Vistoli: no second
owner; the only hits outside this folder are GroupSchemesOverABase consuming 1.1 and 1.3.
`scratch/overlaps.md`: no pull request changes this roadmap, no cited id is dropped, no id of this
roadmap is cited elsewhere.

**Sources at their locators (seeded sample, all fifteen targets).**
- 0.1–0.5: Mathlib only, as above; `m = 2`, `m = 3` Checks recomputed in the table.
- 1.1: Mumford–Fogarty–Kirwan Ch. 1 §3 is paywalled (`mfk1994`, uncertified); the definition
  restated (an isomorphism `a^*L ≅ pr₂^*L` with the cocycle condition) is the standard one.
- 1.2: no external source; checked by computation (table).
- 1.3: brion2015 line 251–252 "a version of [KKLV89, Lem. 2.2, Prop. 2.3]", Proposition 2.10 at
  lines 253–255: for `X` a reduced `G`-scheme, `0 → O(X)^{*G} → O(X)^* → Ĝ(X) → Pic^G(X) →
  Pic(X) → Pic(G × X)/p₂^*Pic(X)`, as the README restates it at line 314 (dropping the first two
  terms). KKLV is paywalled (`kklv1989`, uncertified).
- 1.4: no external source; checked by computation (table).
- 2.1: eg1998 lines 143–146, hypothesis (1); Definition-Proposition 1 at 168–170 with
  `A^G_i(X) = A_{i+l−g}(X_G)` and the codimension condition "more than `n − i`" at 160; Bogomolov's
  double fibration at 179; Lemma 12 at 1572–1575 (for every `i > 0` a `(V, U)` with complement of
  codimension `> i` and a principal-bundle quotient); Proposition 22 at 1595–1601 (under (1), (2)
  or (3) the principal bundle quotient `X × U → X ×^G U` exists; under (1) by [GIT, Prop 7.1],
  line 1606, hence quasi-projective); Proposition 4 at 446–450 (free action with a geometric
  quotient: `A^G_*(X) = A_*(X/G)`), as the fourth Check cites it; §2.2 Example at 190–195
  (`𝔾_m` with weights one, `U/G = ℙ^{l−1}`; `GL_n` on `n × p` matrices). totaro1999 Theorem 1.1
  at 143–148 and Definition 1.2 at 151–153, as 2.1 cites them.
- 2.2: Proposition 9 at 745–753 (change of presentation; see Source issues for its index); the
  operations are Propositions 1–3 at 229, 278, 399 (R01).
- 2.3: own computation; the inputs it names (2.1, 2.2, SchemeAndStackFoundations §5.4) are the
  ones the route uses (table).
- 2.4: Arsie–Vistoli (arXiv math/0301008v2 text) line 617–620: "from [Ed-Gr98, Proposition 18] it
  follows that `Pic(H_sm(n,r,d))` is equal to `A¹_{GL_{n+1}/μ_d}(A_sm(n,rd))`", exactly the
  citation the README gives at lines 447–448; the published Edidin–Graham is paywalled, so
  "Proposition 18, published numbering" stays uncertified (the arXiv Proposition 18, line 1394, is
  torus localisation, and the README says which numbering it means).
- 3.1: by computation (table).
- 3.2: fo2010 lines 44–48, Theorem 1.1: `ℤ/12 × Pic(𝔸¹_S) → Pic(M_{1,1,S})`, `(i, L) ↦ λ^i ⊗ p^*L`,
  an isomorphism for `S` a `ℤ[1/2]`-scheme or reduced, as lines 497–499 state.
- 3.3: Arsie–Vistoli Corollary 4.2 at line 410–412 (`H_sm(n,r,d) ≅ [A_sm(n,rd)/(GL_{n+1}/μ_d)]`),
  Corollary 4.7 at 503–507 (hyperelliptic curves of genus `g`), Theorem 5.1 at 522–525 (UFD whose
  fraction field has characteristic not dividing `2rd`, order `r(rd−1)^n gcd(d, n+1)`), Remark 5.5
  at 706–708 (`2(2g+1)` for `g` even, `4(2g+1)` for `g` odd): with `n = 1`, `r = 2`, `d = g+1`
  this is `4g + 2` and `8g + 4` under characteristic not dividing `4(g+1)`, as lines 514–518
  state. Edidin–Hu (arXiv 2208.00556v2 text) lines 63–64 (`g ≥ 2`, algebraically closed,
  characteristic not dividing `2g + 2`) and Theorem 1.3 at 86–87, as lines 519–521 state.
- 3.4: own computation, recomputed in the table (R01 asks that the README say so).

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `homogeneousUnitDegrees`, `mem_…_iff` | nonzero ring, trivial grading; zero ring; `k[t,t⁻¹]`, `deg t = 1`; `deg t = 2`; inverse of a homogeneous unit | units in `𝒜 0` only: `⊥`; `0 = 1 ∈ 𝒜 d` for all `d`: `⊤`; `tⁿ` of degree `n`: `⊤`; `2ℤ`, `ShiftClassGroup = ℤ/2`; `u ∈ 𝒜 d`, `u⁻¹ = Σ v_e`, `1 = Σ u v_e` forces `v_e = 0` for `e ≠ −d`: the set is already a subgroup | three Checks and the iff correct | none |
| 0.1 `eq_map_mulLeft_of_isUnit_mem` | `u ∈ ℳ c`, `x ∈ ℳ n`; zero ring | `⊇` by `GradedSMul`; `⊆`: `u⁻¹x = Σ a_d`, `x = Σ u a_d` with `u a_d ∈ ℳ(c+d)`, uniqueness in `ℳ` kills `d ≠ n − c`; zero ring: `⊤ = ⊤` | true | none |
| 0.2 `isUnit_laurentPolynomial_iff` | `u = c tⁿ`; `u v = 1` over a domain; `R = k[ε]/ε²`, `u = 1 + εt` | `⇐` by `isUnit_T`; `⇒`: `p = t^N u`, `q = t^M v`, `pq = t^{N+M}`, `t` prime, `p = t^i p₀`, `q = t^j q₀`, `p₀q₀ = t^{N+M−i−j}` with `t ∤ p₀q₀` so exponent `0`, `p₀` a constant unit by `Polynomial.isUnit_iff`; `(1+εt)(1−εt) = 1`, not a monomial: `IsDomain` needed and present | true; negative control correct | none |
| 0.2 `exists_isUnit_mem_of_connected` | `1 = Σ m_e`; prime `p`; `A = k × k`; zero ring | `ρ_ℳ(ab) = ρ_𝒜(a)ρ_ℳ(b)` from `𝒜_d ℳ_e ⊆ ℳ_{d+e}`, so `m_e t^e = ρ_𝒜(m_e) u(t)`, `u(t)·Σ ρ_𝒜(m_e) t^{−e} = 1`; mod `p` a unit of `(A/p)[t,t⁻¹]` is a monomial: exactly one `m_e ∉ p`; `D(m_e)` disjoint open cover, each `D(e′)` with `e′ ∈ {0,1}`, one is `Spec A`; `k × k`: `ℳ 0 = k × 0`, `ℳ 1 = 0 × k` has no homogeneous unit, idempotent `(1,0)`; zero ring: hypothesis and conclusion both hold | route sound; hypothesis exactly what is used | none |
| 0.3 `awayGrading`, `_isInternal` | `f = 1`, `e = 0`; `f = 0`; `f = t ∈ k[t]`, `e = 1`; injectivity | `𝒜` back; zero ring, every degree `⊤`; `1/t` with `1 ∈ 𝒜(−1 + 1·1)`: degree `−1`; `Σ a_d/fⁿ = 0 ⇒ f^N Σ a_d = 0`, `f^N a_d ∈ 𝒜(d + (n+N)e)` distinct ⇒ each `0` | grading, negative degrees present | none |
| 0.4 `homogeneousUnitDegrees_weighted` | `w = 1`; `w = 0`; `w < 0`; `σ = ∅` | units `K^*` are weighted homogeneous of degree `0` only: `⊥` in every case | true; no hypothesis needed, none present | R02 (wording of the Check) |
| 0.4 `homogeneousUnitDegrees_away_prime` | `f = x`, `w = 1`; `w = 2`; `w = 0` (`e = 0`); `f = x²` (not prime); `f = xy`, weights `2, 3` | units of `K[σ]_f` are `c fᵐ` (UFD, `f` prime): `zmultiples e` = `ℤ`, `2ℤ`, `⊥`; `x = x³/x²` a unit of degree `1`: `ℤ ≠ 2ℤ`, excluded by `Prime f`; `c xᵃ yᵇ` of degree `2a + 3b`: `ℤ` | true; Checks correct | none |
| 0.5 `genericDepressed`, `depressedWeight` | `m = 2, 3`; `m = 0, 1` | `X² + a₂`, `X³ + a₂X + a₃`, weights `2` and `2, 3`; `Fin (m−1)` empty, `Xᵐ` (junk, excluded by `2 ≤ m`) | matches README | none |
| 0.5 `depressedDiscr_mem` | `m = 2`; `m = 3` | `−4a₂` (proved at the pin), weight `2 = 2·1`; `−4a₂³ − 27a₃²`, weight `6 = 3·2` | true | none |
| 0.5 `depressedDiscr_prime` | `m = 2` char `0`; char `2`; `m = 3` char `3`; general `m` | `−4a₂` prime; `0`, not prime; `−a₂³`, not prime: `CharZero` needed and present; Tschirnhaus `X ↦ X − a₁/m` identifies `Δ_dep` with the generic discriminant, prime in char `0` | true | none |
| 1.1 groupoid, `Pic^G` | `G = 1`; `𝔾_m` on `Spec k`; `ℤ/2` on `Spec k`, `2` invertible; char `2` | `Pic^1 = Pic`; `Aut(O) = k^*`, `Pic^{𝔾_m}(pt) = X^*(𝔾_m) = ℤ ≠ Pic(pt)^G = 0`; `Hom(ℤ/2, k^*) = {±1}`; `x² = 1 ⇒ (x−1)² = 0 ⇒ x = 1`: trivial | three Checks correct | none |
| 1.2 `ShiftClassGroup ↪ ker` | `A(d) ≅ A(e)`; `k × k`; `k[t,t⁻¹]` | iso `A → A` is `×u`, `u𝒜(n+d) = 𝒜(n+e)`, `n = −d` gives `u ∈ 𝒜(e−d)`: injective; gradings of `k × k` are pairs of degrees, `ℤ²`, image `{(d,d)}`; `ShiftClassGroup = 0 = Pic [𝔾_m/𝔾_m]` | as stated | none |
| 1.3 sequences | finite constant `G`; `G` connected, `X` normal, `k[X]^* = k^*`; `𝔾_m` on `𝔾_m` | kernel of `Pic^G → Pic` = cocycles `G → k[X]^*` mod coboundaries = `H¹`; Brion 2.10 with `χ = 0` on constants gives `0 → Ĝ(X) → Pic^G → Pic`, and `k` algebraically closed in `k(X)` (normality, no nonconstant units) makes `Ĝ(X) = X^*(G)`; `k[X]^* = k^* t^ℤ`, `Pic^{𝔾_m}(𝔾_m) = 0`, so `ℤ → 0` not injective: hypothesis needed | true with the stated hypotheses | none |
| 1.4 `Pic [X/G] ≅ Pic^G(X)`; change of group; `Pic^G(G/H)`; slice | `G = 1`; `H = G`; `Y = pt`; `Aff` on `𝔸¹`, `Y = {0}`; `𝔾_a` by `x + b^p` over `𝔽_p` | `[X/1] = X`; `G ×^G X = X`; one-dimensional `H`-modules = `X^*(H)`; `𝔾_a × {0} → 𝔸¹` iso, `[𝔸¹/Aff] = B𝔾_m`, `Pic = ℤ`; `b ↦ b^p` bijective on points, not an iso, stabilisers `α_p`, `[𝔸¹/𝔾_a] = Bα_p` | correct, including the negative control | none |
| 2.1 `A^G_i(X) = A_{i+l−g}(X ×^G U)` | `G = 1`; `𝔾_m`, `V = 𝔸^l`, `X = pt`; `i = −1`, `l = 2, 3` | `A_i(X × U) = A_i(X)` with `codim(V∖U) > n − i`; `A_{i+l−1}(ℙ^{l−1}) = ℤ` for `1−l ≤ i ≤ 0`, `0` for `i > 0`; `A_0(ℙ¹) = ℤ = A_1(ℙ²)` | consistent with Definition-Proposition 1 | none |
| 2.2 change of presentation | `[𝔾_m/𝔾_m] = [pt/1]`, `l ≥ 2` | `A^{𝔾_m}_i(𝔾_m) = A_{i+l−1}(𝔸^l∖0) = ℤ` for `i = 1` only; `A^1_i(pt) = ℤ` for `i = 0` only: shift `1 = dim 𝔾_m − dim pt`; codimension `0` on both sides | README's Check correct; Edidin–Graham's printed index is off (Source issues) | none |
| 2.2 localisation | `𝔾_m` on `𝔸¹`, `Z = 0`; `G = 1`, `X = ℙ¹`, `Z` two points | `ℤ[t] → ℤ[t]/(t) = ℤ`; `A_0(Z) = ℤ² → A_0(ℙ¹) = ℤ` not injective | Checks correct | none |
| 2.3 `A^*_{GL_n}` route | `n = 1`; `n = 2` | `[Fl/GL_n] = [pt/B]`, `A^*_B = A^*_T` by the affine bundle `[pt/T] → [pt/B]` with fibre `B/T ≅ 𝔸^N`; `ℤ[t₁..t_n]` free of rank `n!` over `ℤ[c₁..c_n]`, so faithfully flat: `ℤ[c] → A^*_{GL_n}` iso; `n = 1`: `ℤ[t]`; `n = 2`: `c₁ = t₁ + t₂`, `c₂ = t₁t₂` | route sound | none |
| 2.3 `A^*_{μ_n}` | `n = 1`; `n = 2` | `[pt/μ_n] = [𝔾_m/𝔾_m]` with weight `n`; image of `A^*_{𝔾_m}(0)` is `([0]) = (n t)`; `ℤ[t]/(t) = ℤ`; `ℤ[t]/(2t)` | consistent | none |
| 2.4 `Pic^G(X) ≅ A¹_G(X)` | `𝔾_m` on `𝔸ⁿ∖0`; `μ_n`; `G = 1` | `ℤ[t]/(tⁿ)`, `Pic = ℤ` for `n ≥ 2` (`n = 1`: `pt`, `0`); `ℤ/n = Hom(μ_n, 𝔾_m)`; `Pic = Cl = A_{dim−1}` on smooth `X` | Checks correct | locator uncertified (published numbering) |
| 3.1 `Pic [(𝔸ⁿ∖D)/𝔾_m] = ℤ/e` | `n = 1`, weight `1`; weight `2`; `n = 2`, weights `1,1`, `f = x`; `f = x²` | `A^{𝔾_m}_{n−1}(D) = ℤ[D]` (`D` integral), `[D] = e t`: `ℤ/e`; `ℤ/1 = 0 = Pic(pt)`; `Bμ₂`, `ℤ/2`; `(𝔸²∖{x=0})/𝔾_m ≅ 𝔸¹` by `y/x`, `0`; `{x² = 0}` non-integral would give `ℤ/2 ≠ 0`: integrality needed and present; 0.4 route: `Pic(k[σ]_f) = 0`, `ShiftClassGroup = ℤ/e` | agree in both descriptions | none |
| 3.2 `M_{1,1}`, `ℤ/12` | weights; stabiliser; char `2, 3` | `4a³`, `27b²` of weight `12`; `4a³ + 27b²` irreducible (`b² = −(4/27)a³`, not a square); `t⁴ = t⁶ = 1 ⇒ t = ±1`: `μ₂` acting by `−1` on `O(χ)`; `(x,y) ↦ (t²x, t³y)` scales `dx/y` by `t⁻¹`: `λ = O(χ^{∓1})`, a generator | matches Fulton–Olsson | none |
| 3.3 Arsie–Vistoli orders | `g = 2`; `g = 3` | `2·5·gcd(3,2) = 10`; `2·7·gcd(4,2) = 28 = 8·3 + 4` | formula as stated | none |
| 3.3 route to the order | `G = GL₂/μ_{g+1}`, `X = A_sm` | `A¹_G(A_sm) = A¹_G(A)/([Δ])`, `A¹_G(A) = A¹_G = Pic BG = X^*(G)` by 2.2, 2.4, 1.4, `[Δ] = χ_Δ`: inputs are the `*Needs:*` line | sound | none |
| 3.3 Edidin–Hu agreement | `g = 2`, `n = 6` | `2g(2g+1) = 20 = 5·4 = (n−1)(n−2)` | agreement in degree one, as stated | none |
| 3.4 items 1–3 | `n = 3`; `n = 4`; `n = 5`; `n = 6`; `m` not invertible | `Stab(∞) = Aff`, `𝔖_m` free on `(𝔸¹)^m∖Δ`: `[U/Aff]`; `p(x − a₁/m)` depressed, inverse of `𝔾_a × U₀ → U`; `a_j ↦ a^j a_j`: weight `j`; `ℤ/2 = Pic B(ℤ/2)`; `ℤ/6`; `ℤ/12`; `ℤ/20`; char `p | m`: no mean of roots, excluded by char `0` | correct | R01 (say it is own) |
| 3.4 item 4 | `T_∞`; `⊗ T_{r_i}`; `n = 3` | `y = 1/x`, `y ↦ y/(a + by)`, derivative `a⁻¹`: `O(χ⁻¹)`, class `−1`; each root `a`, product `aᵐ`: `O(χᵐ)`; `m − 1` of order `m(m−1)/(m−1) = m = n − 1`; `m = 2`: `1 ∈ ℤ/2` of order `2` | correct | none |
| 3.4 Check `n = 4` gerbe | weights `(4,6)` vs `(2,3)` | `t ↦ t²`, kernel `μ₂`; `ℤ/6 → ℤ/12` is `×2`, injective, index `2` | correct | none |
| Conventions 1, 5 | `μ₂` over `𝔽₂`; `𝔸ⁿ∖0` | flat, not smooth: Layer 1 only; quasi-affine, not affine for `n ≥ 2`, `O` ample with the trivial linearisation | correct | none |

**Counts.** 15 Lean declarations checked by `#check`; 9 one-tactic probes, 0 closed; 1 Check
witness proved at the pin; 9 Mathlib and 1 Tau Ceti declarations opened; 15 SchemeAndStackFoundations
sections, 1 AlgebraicVectorBundles layer, 1 SchubertGeometry section and 1 GroupSchemesOverABase
target resolved; 6 sources read at their locators (eg1998, totaro1999, brion2015, fo2010,
Arsie–Vistoli, Edidin–Hu); 3 not readable (below); 29 table rows.

## Not verifiable

- Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, Ch. 1 §3 (1.1): paywalled, `mfk1994`
  uncertified; the definition restated is the standard one.
- Knop–Kraft–Luna–Vust 1989, Lemma 2.2 and Proposition 2.3 (1.3): paywalled, `kklv1989`
  uncertified; Brion's attribution (brion2015 line 251–252) supplies the locators.
- Edidin–Graham, published numbering, Proposition 18 (2.4): the Invent. Math. text is paywalled;
  Arsie–Vistoli's citation of it (their line 618) is what the README reports.
- Mumford 1965, *Picard groups of moduli problems* (3.2, references): no legal copy; Fulton–Olsson
  Theorem 1.1 covers the statement used.

## Source issues

- **Misprint** in eg1998 at Proposition 9, arXiv p. 21 (line 745–753): the source says the
  equivariant Chow groups of two presentations agree in the same dimension index `i`; it should
  be shifted by `dim H − dim G` (the proof's last equality has `h` where `g` belongs); affects a
  stated result.
