# Review of BordismFormalGroups (pull request #1807 at fa7b83e)

**Verdict:** needs changes

The pull request's change to this folder is confined to `TauCetiRoadmap/BordismFormalGroups/README.md`: the owners paragraph (lines 27–35) and F6.5 item 1 (lines 1540–1560) now consume GeneralizedCohomology G2.11 instead of planning the simplicial, quasicategorical and operadic foundations here, and the "Order and references" paragraphs (lines 1944–1945, 1985–1992, 2012) say so. `Suggested.lean` is unchanged. The move itself is sound (see "Verified sound"). The findings below are the gate's failures at this head, each a defect in its own right, plus the acceptance file's form; R01–R02 are the ones this pull request set out to cure and did not.

## R01 (P1) — Dependency cycle BordismFormalGroups → TangentialBordism → StringOrientation → BordismFormalGroups

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` line 31 ("TangentialBordism supplies geometric cycles and the Pontryagin–Thom comparison, and owns the integral unoriented/oriented/Spin coefficient calculations"), with the consuming sentences at lines 173 ("Consume TB B4.2's mod-2 Adams tower"), 189 ("Use TangentialBordism's geometric MU comparison"), 206, 242, 273, 748, 1007, 1952 and 1966.

Claim: TangentialBordism is a supplier of this roadmap.

Witness: the dependency check at this head prints `CYCLE among: BordismFormalGroups, StringOrientation, TangentialBordism`. The edges: this README lines 31/173/189 (→ TangentialBordism); TangentialBordism's README at its open head, line 142, supplier-table row for StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3 (→ StringOrientation); StringOrientation's README at its open head, line 226, supplier bullet "BordismFormalGroups F3–F5 (BP, BP⟨1⟩, cooperations, Hopf rings, …)" (→ this roadmap). TangentialBordism's README lines 19 and 47 also name this roadmap as its consumer. The pull request's description says it cuts every loop among the roadmaps on main except the ModularCurves/SchemeAndStackFoundations pair; this one is still closed.

Repair: this roadmap is on main and is the earliest member, so it cannot consume the other two. Own here, as F2 targets, the inputs lines 173–206, 242 and 273 take from TangentialBordism B4 (the MU and MO instances of the mod-p Adams tower and change-of-rings decomposition, the geometric MU coefficient comparison used for L→MU_*, and the computed MO coefficients used at line 273), or cite them from a supplier on main (GeneralizedCohomology G5 for MU's Thom model and geometric duality, AlgebraicTopology for the Steenrod/Adams carriers if it owns them). Rewrite line 31 so that TangentialBordism and StringOrientation are named only as consumers ("TangentialBordism consumes F1–F2's formal laws and coefficient universality and owns the integral MO/MSO/MSpin calculations"), and change lines 748, 1007, 1952 and 1966 accordingly. The same pattern applies to HomotopySpheres, which is not on main either (merge order position 66) and is consumed at lines 332 ("Consume HomotopySpheres Stage3C's three-fold Toda brackets"), 669, 708 and 1961; the check does not print a line for it, so I report it as a lead to settle in the same edit, not as a separate finding.

## R02 (P2) — Upward supplier citation of TangentialBordism

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` line 31.

Claim: a roadmap on main consumes a roadmap that is still a pull request.

Witness: the dependency check prints `UPWARD: BordismFormalGroups (on main) -> TangentialBordism (#9) at README lines [31]`; `TauCetiRoadmap/TangentialBordism` does not exist on main and sits at position 10 of the merge order.

Repair: as in R01; after the edit the check must print no UPWARD line for this roadmap.

## R03 (P3) — `Suggested.lean` imports Mathlib submodules instead of `import Mathlib`

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 1–4 (`import Mathlib.RingTheory.FormalGroup.Basic`, `import Mathlib.Algebra.Ring.GeomSum`, `import Mathlib.Algebra.Regular.SMul`, `import Mathlib.Algebra.Module.Basic`).

Claim: the file follows the import rule.

Witness: the gate reports `imports`, `mathlib-subimports` (four lines) and `no-import-mathlib`, and its targeted build emits four module-system warnings, one per submodule import (the `build` entries of the gate).

Repair: replace lines 1–4 by the single line `import Mathlib`. I elaborated that variant of the file in my scratch directory with `lake env lean`; see "Verified sound" for the result.

## R04 (P3) — Pinned-commit link and pull-request number in the README

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 14–16 ("HomotopySpheres section references use the §3C/§9 specification at 34167306… in PR284").

Claim: a timeless citation of HomotopySpheres.

Witness: the gate reports `blob` (line 15, a `github.com/<repo>/blob/<sha>` link into the roadmap repository) and `prnum` (line 16, "PR284").

Repair: replace the three lines by "HomotopySpheres is cited by section: §3B (James construction), §3C (Toda brackets) and §9." with no link and no pull-request number.

## R05 (P3) — TeX-only syntax outside code spans

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1534 (`E^{tG}`), 1779 (`Σ^{d_j}MU`, `Σ^{e_k}MU`), 1786 (`Σ^{2r}P_C`), 1812 and 1815 (`⊕_{0≤α_i≤n}`, `∏_{α∈N^ℓ}`, `MU^{k−2|α|}`), 1852 (`BP_{−k}`), 1908 (`Σ^{b_D}`), 1911 (`Σ^{2r_C}`).

Claim: house style (Unicode outside code spans, ASCII inside them).

Witness: the gate's `tex` rule lists these eleven occurrences.

Repair: put each formula in a backtick code span, as the file already does for the displayed identities at lines 1787–1788 and 1841, or write the exponents with Unicode superscripts where they are single symbols (`E^(tG)` is the form the same paragraph uses at line 1536 for other exponents).

## R06 (P3) — Edits outside the pull request's declared roadmap folders

Location: `Completed/ArithmeticDirichletSeries/README.md` (one sentence) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one sentence).

Claim: the pull request changes only the roadmap folders it declares.

Witness: `git diff --stat origin/main...HEAD` outside the fourteen declared folders lists these two files (gate `outside-folder`, 2 entries). The pull request description names both as consumer-sentence rewrites, but the review brief for this folder does not list either folder as the pull request's own.

Repair: either declare the two folders as the pull request's own (so that each gets its own review) or move the two one-line edits to a separate pull request.

## R07 (P3) — Acceptance file: API and general-algebra declarations in place of headline theorems, and a docstring that does not name the non-statable headlines

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 6–10 (module docstring), 36 (`formalNSeries_constantCoeff`), 41 (`formalNSeries_one`), 46 (`formalNSeries_coeff_one`), 72 (`isSMulRegular_sub_of_pow_eq_zero`).

Claim: the file states the roadmap's headline theorems and only the definitions they need.

Witness: `formalNSeries_constantCoeff` and `formalNSeries_coeff_one` are the file's copies of the F1 API items `constantCoeff_nsmulSeries` and `coeff_one_nsmulSeries` (README line 50–51), and `formalNSeries_one` is the boundary case n = 1 of the definition at line 17 (it is `FormalGroup.zeroX_eq_X`, Mathlib `RingTheory/FormalGroup/Basic.lean` line 296, after unfolding; none of the three closes with one tactic, see "Verified sound", but they are API lemmas, not headlines). `isSMulRegular_sub_of_pow_eq_zero` is a proved lemma about free variables of an arbitrary ring and module whose conclusion is algebra on its hypotheses; it belongs to the library, not to the acceptance test. The docstring says "suggested forms" and names no headline theorem that is not statable at the pins, although none of Lazard's polynomial theorem (no Lazard-ring carrier at the pins: Mathlib's `RingTheory/FormalGroup/` has only `Basic.lean`, and the pinned Tau Ceti has no `TauCeti/RingTheory/FormalGroup/` directory), Quillen's theorem L ≅ MU_*, Landweber's exact functor theorem, the nilpotence theorem, the Greenlees–Sadofsky/Kuhn Tate vanishing (no spectra, MU or BP at the pins) or the classification by height over separably closed fields (no `FormalGroupHom` or height at the pins) is statable.

Repair: delete the four declarations at lines 36, 41, 46 and 72 (the README keeps the statements; the F6.6 regularity remark stays prose there). Keep `formalNSeries`, `exists_unique_normalized_exponentTwo_logarithm` and, if wanted, `formalNSeries_eq_nsmul` as a proved `example` (it tests the recursion against Mathlib's `nsmul` on `FormalGroup.Point`, which is nontrivial about a kept definition); drop `formalVariable` if that example goes. Replace the docstring by "Bordism, formal groups and chromatic operations: target signatures", saying that README.md is the roadmap, that the file states the headline theorems against the pinned Mathlib and Tau Ceti, and listing the six headlines above with what each lacks.

## Verified sound

**Gate and dependency check.** I re-ran the dependency check at this head; its output is

```
UPWARD: BordismFormalGroups (on main) -> TangentialBordism (#9) at README lines [31]
CYCLE among: BordismFormalGroups, StringOrientation, TangentialBordism
depcheck: 236 roadmaps, 2078 edges, 2 problem(s)
```

Every other gate rule passes at this head: `set_option`, `latex`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `lean-lines`, `forbidden`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `metadata`, `stray-files`, `dirty`, `source-material` (all 0). `PROGRESS.md`, `STATUS.md` and `metadata.toml` (`topic = "math.AT"`) are roadmap files, not strays.

**The change itself (F6.5 → GeneralizedCohomology G2.11).** The citation resolves at this pull request's head of GeneralizedCohomology: G2 item 11, "Enriched, quasicategorical and monoidal foundations", `TauCetiRoadmap/GeneralizedCohomology/README.md` lines 669–1510 (added by this pull request; its line 674 names BordismFormalGroups F6.5 as a consumer and its line 3390–3391 says "G2.11 consumes G2.1–5 and G2.9 and precedes G5.7; BordismFormalGroups F6.5 consumes it with no returned input", so the direction is single). I checked each item F6.5 lines 1544–1557 consumes against that range: Bergner model and rigidification/coherent-nerve (10 and 14 occurrences), straightening (17) with marked variants (39), Joyal model (13), Cat∞ colimits/descent/Kan extensions (6/5/8), stable enhancements Sp∞ and Fun(BG,Sp∞) (6 and 3), the DK quotient by a tensor ideal (lines 658, 682–685 of the range), Day convolution (692), the universal exact lax-monoidal approximation (735), the parameterized refinement categories with B→A (765–782), the two-colored associative algebra/module operad and its rectification (785, 804–818), relative adjoints (2), universes (2). What F6.5 keeps (lines 1560–1640) is the application to C = Sp^(BG) with the induced-object ideal, the κ-accessibility argument, the two-colored-operad action, restriction/transfer/norm identities and the B(G/H) descent; nothing of it is restated in G2.11. GeneralizedCohomology's `Suggested.lean` is unchanged by the pull request, so no declaration moved or was duplicated.

**Sources, seeded sample.** "The smoothing-and-triangulation comparison, item 1 Smooth implies PL" is a citation of GeometricTopology, which is on main: `TauCetiRoadmap/GeometricTopology/README.md` line 930 (section "The smoothing-and-triangulation comparison (far horizon)") and line 938 (item 1, "Smooth implies PL. Every smooth manifold has an essentially unique PL structure (a smooth triangulation, Whitehead)", with the references Whitehead, Ann. of Math. 41 (1940) 809–824 and Munkres, Elementary Differential Topology, 1966). The hypotheses match the use at F6.6 lines 1767–1774: C and D are compact closed manifolds, so the smooth triangulation is finite and the "finite CW model" follows through AlgebraicTopology's smooth-manifold CW comparison, which AlgebraicTopology's README (this pull request's head) states at lines 66–68 ("the finite-dimensional Hausdorff second-countable smooth-manifold CW comparison consumes geometric topology's smooth triangulation; compact manifolds have finite CW type"). The primary texts themselves are under "Not verifiable".

**Library declarations opened at the pins** (Mathlib `f6090c7`, Tau Ceti `358314d`): `FormalGroup` structure with fields `zero_constantCoeff`, `lin_coeff_X`, `lin_coeff_Y`, `assoc` (`Mathlib/RingTheory/FormalGroup/Basic.lean` lines 56–66), `FormalGroup.IsComm` (74), `FormalGroup.Point` with `Add`, `Zero`, `AddMonoid` (126–336; `nsmul := nsmulRec`), `𝔾ₐ` (145) and `𝔾ₘ` = X₀ + X₁ + X₀X₁ (161), `zeroX_eq_X` (296); `AddCircle.toCircle_zsmul` (`Analysis/SpecialFunctions/Complex/Circle.lean` 402), `AddCircle.homeomorphCircle` (435, hypothesis `T ≠ 0`), `AddCircle.toCircle_addChar` (`Analysis/SpecialFunctions/Complex/CircleAddChar.lean` 31); `Commute.geom_sum₂_mul`, `IsSMulRegular.of_mul`, `IsSMulRegular.pow` (used by the proof at `Suggested.lean` 72–80, which elaborates). The README's Tau Ceti citations `FormalGroup.nsmulSeries`, `nsmulSeries_add`, `nsmulSeries_mul`, `constantCoeff_nsmulSeries`, `coeff_one_nsmulSeries`, `natCast_dvd_coeff_nsmulSeries` (README lines 49–56) and `constantCoeff_log`, `coeff_one_log`, `derivative_log`, `subst_toPowerSeries_log`, `subst_toPowerSeries_eq_add_iff`, `subst_exp_log`, `subst_log_exp` (lines 97–101) are not at the pinned Tau Ceti (it has no `TauCeti/RingTheory/FormalGroup/` directory) but all exist at the Tau Ceti commit `1844920e` the README links (`NSMul.lean` lines 77, 90, 101, 116, 190, 222; `Logarithm.lean` lines 212, 218, 223, 234, 271, 331, 336); the pin is simply older than the roadmap's progress, and `Suggested.lean` correctly carries its own `formalNSeries` for that reason. `TauCeti.TopCat.serreFibrations` (README line 654) was not found at the pin or at that commit; it is a pre-existing citation unchanged by this pull request and I did not pursue it further.

**Elaboration.** `lake env lean` on `Suggested.lean` at this head: exit 0, four `declaration uses 'sorry'` warnings (lines 36, 41, 46, 53) and nothing else. The elaborated signatures in the worker's file match the README statements: the exponent-two theorem carries `[F.IsComm]` and `formalNSeries F 2 = 0`; the README's extra "2 = 0 in R" is implied, since `formalNSeries_coeff_one` gives coefficient 2 of [2]_F, so the generalities agree. No section binder is lost. One-tactic probes on a scratch copy: `exact F.zeroX_eq_X` leaves the goal `MvPowerSeries.subst ![0, PowerSeries.X] F.toPowerSeries = PowerSeries.X` (not reducibly defeq), and `simp [formalNSeries]` makes no progress on any of the three F1 lemmas; so nothing in the file is one-tactic padding. The single-`import Mathlib` variant for R03 (lines 1–4 replaced by `import Mathlib`, nothing else changed) elaborates with exit 0 and the same four `sorry` warnings only, so the repair is safe.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `formalNSeries` recursion [n+1] = F([n], X) | n = 0; n = 1; 𝔾ₘ with n = 2; 𝔾ₐ | [0] = 0; [1] = F(0,X) = X (`zeroX_eq_X`); 𝔾ₘ: [2] = 2X + X²; 𝔾ₐ: [n] = nX | agrees with [n]_F | none |
| `formalNSeries_coeff_one` | 𝔾ₘ, n = 2; n = 0 | coeff₁ = 2 = (2 : R); n = 0: coeff₁(0) = 0 = (0 : R) | holds | none |
| Exponent-two logarithm (Lean line 53, README 108–118) | R = 𝔽₂, F = 𝔾ₐ; R = 𝔽₂, F = 𝔾ₘ; R the zero ring; R = ℤ | 𝔾ₐ: [2] = 2X = 0, g = X satisfies all four conditions; the additive competitor X + X² has coeff(2¹) = 1 ≠ 0, so the normalization is what forces uniqueness; 𝔾ₘ: [2](X) = X² ≠ 0, hypothesis fails; zero ring: every series is 0, unique; ℤ: hypothesis forces 2 = coeff₁([2]) = 0, so no instance | true as stated; direction g(F(X,Y)) = g(X) + g(Y) matches README | none |
| `isSMulRegular_sub_of_pow_eq_zero` | S = N = ℤ/4, a = 1, b = 2, q = 2; S = N = M₂(𝔽₂), a = [[0,1],[1,0]], b = e₁₂; q = 0 | ℤ/4: a − b = −1, regular; M₂(𝔽₂): a unit, b² = 0, ab ≠ ba, a − b = [[0,0],[1,0]] squares to 0, not regular; q = 0: b⁰ = 1 = 0 forces S = 0, conclusion trivial | true; `Commute` is needed | none (deletion by R07) |
| Grading conventions (README 38–41) | a_ij, b_i, v₁ at p = 2 | with |x| = −2 homological, deg(a_ij x^i y^j) = 2(i+j−1) − 2(i+j) = −2 = |x|; deg(b_i x^{i+1}) = 2i − 2(i+1) = −2; |v₁| = 2(2−1) = 2 | consistent | none |
| Cocycle lemma, d_n and C_n (README 65–72, 120–128) | n = 2, 3, 4, 6; C_{2^k}(X,X) for k = 1, 2 | C₂ = XY (d₂ = 2); C₃ = X²Y + XY² (d₃ = 3); C₄ = 2X³Y + 3X²Y² + 2XY³ (gcd(4,6,4) = 2); d₆ = gcd(6,15,20,15,6) = 1; C₂(X,X) = X², C₄(X,X) = 7X⁴, coefficient (2^{2^k−1} − 1) odd | integral, and the parity claims hold | none |
| Height (README 136–140) | 𝔾ₐ and 𝔾ₘ in characteristic p | 𝔾ₐ: [p] = pX = 0, height ∞; 𝔾ₘ: [p](X) = (1+X)^p − 1 = X^p, height 1 | matches the stated values | none |
| K-theory law F_K(x,y) = x + y + uxy (README 157–160) | x_K(L) = u⁻¹([L⁻¹] − 1); u·x | [L₁⁻¹L₂⁻¹] − 1 = X₁ + X₂ + X₁X₂ with X = [L⁻¹] − 1, so x(L₁ ⊗ L₂) = x₁ + x₂ + u x₁ x₂; u·x_K obeys Mathlib's 𝔾ₘ = X₀ + X₁ + X₀X₁ | consistent | none |
| Invariant primes of BP_*BP (README 471–478) | the ungraded ideal (p, v₁ − 1) | η_R(v₁) − 1 = (v₁ − 1) + p t₁ ∈ (p, v₁ − 1)Γ: invariant, prime, not homogeneous | the homogeneity hypothesis is needed, as the README says | none |
| Euler cancellation identity (README 1841) | general q with n = Π − eν, n^q = 0; q = 1 | (Π − n)·Σ_{i=1}^{q} Π^{q−i} n^{i−1} = Π^q − n^q = Π^q; q = 1: n = 0, eν = Π | holds in any commutative ring | none |
| Torus characters (README 1823–1828) | ℓ = 1, m = 0; ℓ = 2 | characters of (S¹)^ℓ ↔ ℤ^ℓ via z ↦ ∏ z_i^{m_i}; `toCircle_zsmul` gives z ↦ z^n at period 1; `homeomorphCircle` needs T ≠ 0, satisfied at T = 1 | consistent with the pinned names | none |
| K(n)^*(BC_p) and Tate vanishing (README 1652–1660) | n ≥ 1; n = 0 | K(n)^*[[x]]/(v_n x^{p^n}) with v_n a unit ⇒ x^{p^n} = 0 ⇒ x⁻¹K(n)^*(BC_p) = 0 ⇒ K(n)^{tC_p} ≃ 0; n = 0: [p](x) = px, x not nilpotent, excluded by n ≥ 1 | hypothesis n ≥ 1 is in the statement (line 1533) | none |
| Sylow unit criterion (README 1616–1618) | G = S₃, p = 2, P = C₂; p = 3, P = C₃ | tr∘res = [G:P] = 3 (a unit at 2) and 2 (a unit at 3) | holds | none |
| Smooth implies PL, as used (README 1771–1774) | compact C, D; a noncompact manifold | compact: smooth triangulation is finite, finite CW model exists; noncompact: only locally finite, excluded by "compact closed" at line 1767 | hypotheses present | none |

**Ownership and duplication.** `tauceti-roadmap roadmaps grep --lean-only` for `formalNSeries`, `nsmulSeries`, `LazardRing`, `exponentTwo` finds no match on main or in any open roadmap pull request; no other `Suggested.lean` declares these names. ChromaticHomotopyTheory (open head) consumes BordismFormalGroups F1–F3/F5 and F6.1–F6.5 and declares `gap:weak-ring-finite-postnikov` against F6.5; that is its declared contract, not a finding here. Ownership against open pull requests was checked only in the sibling checkouts the brief lists.

**Shape.** The README predates the `## Layer k` / `**Checks.**` / `## Exact supplier contracts` shape and keeps its own F1–F6 sections; the gate's shape rules (`layer-ids`, `target-ids`, `empty-sections`) pass, and since the folder is existing work on main that this pull request only revises at F6.5, I raise no finding on the shape.

## Not verifiable

- Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940), the primary source behind the sampled "Smooth implies PL": the sources service found only the JSTOR landing page (doi 10.2307/1968861), which is paywalled; recorded in `needs-references.toml` of this job. Munkres, *Elementary Differential Topology* (1966) is a book with no open copy. The statement is classical and is used here only through GeometricTopology's section, whose text I read.
- The cited Lurie, Nikolaus–Scholze and Clausen–Mathew passages behind F6.5 (README lines 2008–2012) were not opened in this round; the pull request changes only which roadmap owns the foundations, not the mathematics cited, and GeneralizedCohomology's review covers the moved text.

## Source issues

- none
