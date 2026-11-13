<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6867424089 -->
Red team round 1 pass b (claude) of 8f92ca6

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) AlgebraicCurves is cited for two statements it does not make

   Location: `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:348-352` ("Layer 12
   (*the dictionary — function fields ↔ curves*): every smooth connected curve over a perfect field has a
   smooth completion `C̄`, unique up to unique isomorphism, with finite boundary `C̄ ∖ C`"), used by
   MS.0.1 (`README.md:376`, `*Needs:*` at 405–407) and by every boundary statement of MS.2–MS.4; and
   `README.md:348-350` (Layer 2 cited for "the coordinate ring of a smooth affine curve over a perfect
   field is a Dedekind domain, equal to the intersection of its local rings at closed points").

   Claim: both statements are supplied by AlgebraicCurves on main.

   Witness: `TauCetiRoadmap/AlgebraicCurves/README.md:1583-1632` (12A–12C). Layer 12 treats only
   integral regular *projective* dimension-one schemes: 12B builds `X_F` from a function field, 12C is
   the anti-equivalence with function fields. No sublayer states that a non-proper smooth curve `C`
   embeds as a dense open in `X_(k(C))` with finite complement (the README has no occurrence of "open
   immersion", "completion of a curve" or "compactification"). Layer 2 (`:478-518`) is about the integral
   closure `R_x` of `k[x]` in `F` and S-integers; the "integrally closed ⟺ holomorphy ring
   `⋂_(P∈S) 𝒪_P`" statement is in Layer 6 (`:752-753`), and neither layer speaks of the coordinate ring
   of an arbitrary smooth affine curve.

   Repair (the notion moves down into this roadmap; no supplier row is added):

   1. Replace the AlgebraicCurves subsection of the supplier contracts by:
      "Layer 12 (sublayers 12A–12C, with 12B.0b): for a function field `F/k` the regular projective model
      `X_F`, its closed-point/place dictionary, the anti-equivalence with function fields, and, for `k`
      perfect, smoothness of `X_F`. Layer 6 (integral closures): an integrally closed subring of `F`
      containing `k` with fraction field `F` is the intersection of the valuation rings of the places
      centred on it."
   2. Add to MS.0.1, before "Define the completed generic field", the target sentence:
      "Prove that for a smooth connected curve `C` over the perfect field `k` the canonical rational map
      `C ⇢ X_(k(C))` is an open immersion with finite complement, and that a second such pair is uniquely
      isomorphic to this one; write `C̄ = X_(k(C))`. Route: each local ring of `C` is a discrete valuation
      ring of `k(C)/k`, hence the local ring of one closed point of `X_(k(C))` (12A–12B dictionary); the
      resulting map is injective on points because `C` is separated, is a local isomorphism, and its image
      is open because it is constructible and stable under generisation; the complement is a proper closed
      subset of a one-dimensional Noetherian scheme, hence finite; uniqueness is 12C."
      Add the Check: "For `C = A¹_k`, `C̄ = P¹_k` and `C̄ ∖ C` is one point; for `C = G_m`, two points."
   3. In MS.2.2 replace "which holds for the Dedekind domain `k[C]`" by "which holds because `k[C]` is
      integrally closed with fraction field `k(C)` (AlgebraicCurves Layer 6) and
      `𝒪_(C,α) = k(C) ∩ k(α)[[x_α]]` by faithful flatness of completion", and change the `*Needs:*` entry
      "AlgebraicCurves Layer 2" to "AlgebraicCurves Layer 6"; change "AlgebraicCurves Layers 2 and 12" to
      "Layers 6 and 12" at `README.md:85` and `:1299-1300`.

   Tested on the witness: `C = A¹`: `k(C) = k(x)`, `X_F = P¹`, image `A¹`, complement `{∞}`; MS.2.2 Check 2
   (`k[x] = ⋂_α (k(x) ∩ k(α)[[x_α]])`) follows from the Layer-6 statement.

2. **F02** (P2) MS.3.9: finite étale transport of saturation lacks "Y connected"

   Location: `README.md:1497-1499` ("On a smooth connected `X`, prove that every irreducible
   overconvergent F-isocrystal is saturated, and that saturation is preserved by finite étale pullback and
   pushforward").

   Claim: for every finite étale `f : Y → X`, `N†` saturated on `Y` implies `f_*N†` saturated on `X`.

   Witness: `Y = X ⨿ X` with the fold map, `N† = O(−1)` on the first copy and `O(0)` on the second. Each
   restriction has rank one and is saturated (MS.3.8, first Check). `f_*N† = O(−1) ⊕ O(0)`, slopes 1 and
   0, `Top = O(−1)`, the summand `O(0)` is in the kernel: not saturated (MS.3.8, third Check). Saturation
   is moreover defined only on connected schemes (MS.3.8). TSU line 1302 has "of connected schemes".

   Repair: replace the first sentence of MS.3.9, up to its parenthesis, by "On a smooth connected `X`,
   prove that every irreducible overconvergent F-isocrystal is saturated; that for a finite étale morphism
   `f : Y → X` of smooth connected `k`-schemes, `M†` on `X` is saturated if and only if `f^*M†` is, and
   `f_*N†` is saturated whenever `N†` on `Y` is; that saturation is preserved by finite coefficient
   extension with compatible Frobenius, on each connected component of the base change, and by replacing
   `σ` with a positive power; on a curve PBQ and saturation remain independent properties", and add
   the Check: "Connectedness of `Y` is needed for the pushforward: for the fold map `X ⨿ X → X` and
   `N† = O(−1) ⨿ O(0)`, both pieces are saturated and `f_*N† = O(−1) ⊕ O(0)` is not." Tested: with `Y`
   connected the generic slopes of `f_*N` are those of `N`, `Top(f_*N) = f_*Top(N)` and
   `Γ(X, f_*N†) = Γ(Y, N†) ↪ Γ(Y, Top(N))`; the fold-map instance is excluded.

3. **F03** (P2) MS.5.4–MS.5.5: the generic dagger hull is not defined, and its reduction step is unowned

   Location: `README.md:1883-1886` ("the middle term is the dagger hull of `N` in `M`"), `:1910-1911`
   ("for `(φ,∇)`-modules `N ⊆ M` over `E` with `M` dagger-extendable, prove
   `S_min(N) = S_min(Hull†_M(N))`"), `:1914` ("by the generic analogue of MS.5.3").

   Claim: `Hull†_M(N)` and "dagger-extendable" are available over D'Addezio's generic pair, and the
   reduction to isoclinic `N` is supplied.

   Witness: "dagger-extendable" (`README.md:1787-1790`) and `Hull†` (MS.5.1) are defined only for
   convergent `F^n`-isocrystals on a smooth `k`-scheme, with uniqueness from §RD.5.8. Over the generic
   pair the corresponding full faithfulness is DAD lines 519–522 (residue field `k(t)`), which no target
   and no cited section provides (§RD.5.4 is for `k((t))`, as `README.md:253-255` itself insists for
   §RD.0.53). "The generic analogue of MS.5.3" is not a target; DAD line 582 uses its Lemma 4.1.5 there.

   Repair: (1) open MS.5.4 with the definition, which needs no full faithfulness: "Fix a `(φ,∇)`-module
   `M†` over `E†` and `M = E ⊗ M†`. A `(φ,∇)`-submodule of `M` is **dagger-extendable in `M†`** if it is
   `E ⊗ L†` for a `(φ,∇)`-submodule `L† ⊆ M†`; the **dagger hull** `Hull†_M(N)` of a `(φ,∇)`-submodule
   `N ⊆ M` is the smallest such submodule containing `N`. It exists because
   `(E ⊗ L†_1) ∩ (E ⊗ L†_2) = E ⊗ (L†_1 ∩ L†_2)` (flatness of `E` over the field `E†`) and ranks are
   finite. The datum `M†` is part of the notion." (2) In MS.5.5 replace "with `M` dagger-extendable" by
   "with `M = E ⊗ M†` as in MS.5.4", and replace "by the generic analogue of MS.5.3, take `N` nonzero
   isoclinic and `M = Hull†_M(N)`" by the stated step: "Reduce to `N` nonzero isoclinic by induction on the number
   `m` of slopes of `N`. For `m ≥ 2` put `N′ = S_(m−1)(N)`, `H′ = Hull†_M(N′)` and `H = Hull†_M(N)`, so
   `H′ ⊆ H` and `S_min(H′) = S_min(N′) = S_min(N)` by induction. If `H′ ≠ H`, the image of `N` in `H/H′`
   is nonzero isoclinic of the largest slope `s_m` of `N`, and `H/H′` is its hull (in the quotient
   `M†`-structure), so by the isoclinic case the minimal slope of `H/H′` is `s_m`, larger than that of
   `H′`; hence `S_min(H) = S_min(H′)` (D'Addezio, Lemma 4.1.5, p. 12). In the isoclinic case replace `M†`
   by the `E†`-submodule underlying `Hull†_M(N)`." Add the Check to MS.5.4: "For `M† = E†(−1) ⊕ E†(0)` and `N = E(0)`, `N` is
   dagger-extendable in `M†` and is its own hull; for `N = M`, the hull is `M`."

   Tested on the witness: with the submodule definition, MS.5.4's minimality argument ("every
   dagger-extendable subobject containing `N` gives a dual quotient of `(M†)^∨`") is literally true, and
   `(E ⊗ Q†)^∨ = E ⊗ (Q†)^∨` with `(Q†)^∨ ⊆ M†`.

4. **F04** (P3) Parent sections needed by a target but absent from its `*Needs:*`, and contract rows no target uses

   Location: `README.md:260-262` (§RD.5.29 "projective lifts of a smooth projective curve with its
   boundary points") and `README.md:405-407` (MS.0.1 `*Needs:*`).

   Claim: every contract row is consumed by a `*Needs:*` line and conversely.

   Witness (computed over all 69 `*Needs:*` lines): the ids §RD.0.1, 0.26, 0.36, 0.48, 5.2, 5.29, 6.59,
   6.60, 6.85 occur in the contract list and in no `*Needs:*` line (§RD.0.34, 3.48, 6.61, 6.77 are declared
   as only extended). MS.0.1 constructs `A†_(C,K) → E†_α` and `E_η → E_α` at boundary points `α ∈ C̄ ∖ C`,
   which needs a lift of `C̄` near `α` (§RD.5.29) and the carriers (§§RD.0.1, 0.26, 0.36).

   Repair: add "§§RD.0.1, RD.0.26, RD.0.36, RD.5.29" to the `*Needs:*` of MS.0.1 and to the Dependencies
   of Layer MS.0; add "§RD.5.2" to the local case of MS.0.4 (`README.md:532-534`) or delete it from the
   contract row at `:250-255`; delete §§RD.0.48, RD.6.59, RD.6.60 and RD.6.85 from the contract list and
   from the "Imported" paragraph (`:79-80`), or name the target that uses each (MS.6.10 uses only the
   supplier request coefficient-linear-weil-ii).

5. **F05** (P3) MS.5.7 `*Needs:*` names MS.5.4, which is stated only over the generic pair

   Location: `README.md:1963-1964` ("*Needs:* MS.4.2; MS.5.3; MS.5.4;", continued with the parent sections).

   Claim: the curve proof uses the dual image model MS.5.4.

   Witness: MS.5.4 (`README.md:1883`) is stated "Over D'Addezio's generic pair `(E†, E)` of the affine
   line". The route of MS.5.7 (`:1955-1961`) works with dagger sections over an affine open of an arbitrary
   curve and uses minimality of the hull of MS.5.1 directly; MS.5.4, MS.5.5 and MS.5.6 feed no step of
   it (and no other target).

   Repair: change the line to "*Needs:* MS.4.2; MS.5.1; MS.5.2; MS.5.3;
   PadicDifferentialEquationsAndRigidCohomology §§RD.1.37, RD.3.16, RD.3.31." and add to the opening paragraph of Layer MS.5: "MS.5.4–MS.5.6 are the
   generic and affine-line statements; MS.5.7 does not use them."

6. **F06** (P3) Abe–Esnault, Theorem 2.7 is cited for purity; it states mixedness

   Location: `README.md:330` and `:2268-2269` ("Tsuzuki, Theorems 7.18–7.19, p. 37, quoting Abe–Esnault,
   Theorem 2.7, p. 13").

   Claim: AE Theorem 2.7 says irreducible objects are `ι`-pure.

   Witness: AE lines 539–540: every object of the holonomic derived category of a finite-type scheme is
   `ι`-mixed. Purity of an irreducible object is the further step used at AE line 752 (proof of
   Theorem 3.10, p. 17).

   Repair: in both places write "Abe–Esnault, Theorem 2.7, p. 13 (every object is `ι`-mixed), with the
   purity of irreducible `ι`-mixed objects as used in the proof of their Theorem 3.10, p. 17; Tsuzuki,
   Theorem 7.18, p. 37, states the purity".

7. **F07** (P3) Page locator of Tsuzuki, Proposition 3.24

   Location: `README.md:951-952` ("Tsuzuki, Proposition 3.24, pp. 17–18").

   Witness: TSU line 951 is the marker of page 18 and Proposition 3.24 starts at line 953; its proof ends
   at line 964. Page 17 holds only the preceding definitions of the solution spaces.

   Repair: "Tsuzuki, Proposition 3.24, p. 18 (the solution spaces are defined on p. 17)". The Corrections
   entry at `:2521` already has p. 18.

8. **F08** (P3) "Frobenius `d`-eigenvector" is used and not defined

   Location: `README.md:905` ("a Frobenius `d`-eigenvector `f ∈ Sol_λ(M)` of slope `μ`").

   Witness: the term occurs once, in MS.1.7; Convention 4 defines the slope only of a vector with
   `φ(v) = c·v`. With `d ≠ 1` the normalisation matters: for `φ^d(f) = c f` the raw valuation is `d` times
   larger.

   Repair: after "prove that" insert "for an integer `d ≥ 1`, a nonzero `f ∈ Sol_λ(M)` with
   `φ^d(f) = c·f`, `c ∈ K^×` (a Frobenius `d`-eigenvector, of slope `μ = v_π(c)/(d·v_π(q))`)". Tested on
   MS.1.8's Check: `f_2` has `φ(f_2) = q f_2`, `d = 1`, `μ = 1`; with `d = 2`, `c = q²` and `μ = 2/2 = 1`.

9. **F09** (P3) `FixedPoints.subfield` is described as an action by automorphisms

   Location: `README.md:203-205` ("the subfield fixed by a monoid acting by ring automorphisms").

   Witness: `Mathlib/FieldTheory/Fixed.lean:44,103` at the pin: `[Monoid M] [MulSemiringAction M F]`, an
   action by ring endomorphisms. MS.0.3(1) allows imperfect `k`, where `σ` need not be surjective
   (`K` the completion of `ℚ_p(t)` for the Gauss norm, `σ(t) = t^p`).

   Repair: "the subfield fixed by a monoid acting by ring endomorphisms (`MulSemiringAction`); `K^σ` of
   MS.0.3 is the fixed subfield of `ℕ` acting through the powers of `σ`, which need not be automorphisms".

Three P2 findings (R01–R03) and six P3 findings (R04–R09). No P1. The declared supplier gaps are not
raised. No finding of an earlier repair report was marked `not actionable in this package`, so nothing
is re-raised.

Dependency check (run on the head, unchanged files):

    depcheck: 240 roadmaps, 2169 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

Counts: 0 declarations in `Suggested.lean` (79 lines read; module docstring only), 69 targets read
(all 2594 README lines), 72 parent section ids resolved at the head of the parent's open pull request
(all headings exist; statements of 16 read against their use), 2 other supplier roadmaps read on main,
16 pinned declarations grepped (all exist at the stated files), about 120 of the 148 locators checked
for theorem number and page against the cached texts (every TSU, DAD, CT11, AE and KED05 locator by an
index of numbered statements with page markers; OHK by page for 14 of 18), of which 30 statements were
read in full against the target that cites them, about 60 Checks recomputed, 9 gap slugs compared
between `design/plan.json` and the README (identical). `git diff --stat origin/main...HEAD` shows only
files of the package folder. No `lemma`, `set_option`, pull-request number or process word in the
README or the Lean file.

Suggested.lean. No declaration, so the `#check` comparison has zero cases. Headline theorems listed
from the README: MS.4.6, MS.4.8, MS.5.7, MS.6.13, MS.6.14 (end theorems), MS.0.4, MS.0.7, MS.1.1,
MS.1.8, MS.2.5, MS.3.7, MS.4.2, MS.5.8. Each needs `(φ,∇)`-modules over the Amice or bounded Robba
field, or F-isocrystals; grep of the pinned Tau Ceti for "Robba", "isocrystal" and "Amice" finds only the Amice transform of distributions, and the rings of `README.md:214-232`, so
none is statable, and each is named in the module docstring with the missing carrier. No padding.

Adversarial table (values computed on each side; "log" is the module of MS.0.2, `S = E(−1) ⊕ E(0)`):

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conv. 4 slopes, MS.0.3 Checks | `ℚ_p(√p)`, `c = √p`, `q = p`; `q = p²`, `c = p²` | `v_π = 1`, `v_π(q) = 2`, slope 1/2; `4/4 = 1` | holds |
| MS.0.1 | `A¹`: residue field of `E_η`; `Σ x^(n!)` | `k(x)`; not rational | holds |
| MS.0.2 | log: horizontality; Sol | `φ(e_1) = q⁻¹e_1` forced; `Sol_0` dim 1, `Sol` dim 2; coefficient norm `p^r` at `n = p^r` | holds |
| MS.0.3 | `W(𝔽̄_p)[1/p]`; `ℚ_p`, `q = p²` | `K^σ = ℚ_p`; `K′ = ℚ_(p²)`, `σ = id`, residue field `𝔽_(p²)` | holds; TSU 1961–1971 |
| MS.0.4 | `M† = E†`, `P = E²`; `M† = S`, `P = E(0)`; `M† = 0`; nonsplit `E†`-extension with sub of slope 1 | ranks `1 < 2`; no injection; slopes 0 and 1 both; slope-1 sub maps to 0 | holds; inequality form follows from TSU Thm 2.14 applied to `E·f(M†)` |
| MS.0.5 | unit, 0, log | `B = 1`; `B(0) = 0`; `Mᵇ = E e_1`, `B` rank 1 | holds |
| MS.0.6 | log (`a = −1, b = 0`); `S` (`a = 1, b = 0`) | `b − a = 1`, unbounded, nonsplit; `b < a`, split | holds; CT11 540–554 |
| MS.0.7 | `S`; log; rank one | bounded and split; unbounded and nonsplit; isoclinic | holds |
| MS.0.8 | log over `B′`; `B′ = B` | rank 1 = rank 1; identity | holds |
| MS.0.9–0.11 | rank one, 0, `S`, log, dual of log, `U = 0` | PBQ; not; `B = S` two slopes, not; `B` = unit, PBQ; `B = E(−1)`, PBQ; `M ⊗ 0 = 0` not PBQ | holds |
| MS.1.1–1.3 | `S`; log; 0 | `P_1 = E(−1)`, grades 1 > 0, nested terms both 1; `r = 1`; length 0 | holds; grade correction confirmed at TSU 883–886 |
| MS.1.4–1.5 | `E†(−1) ⊕ E†(0)`; rank one | `E†(−1) ⊂ M†`; one step | holds |
| MS.1.6 | constant; `log(1+u)`; polynomial at `λ < 0` | growth 0; growth 1, not 0; excluded by convention | holds |
| MS.1.7–1.9 | log over `E†`: `f_1`, `f_2`; `diag(1, q)` on the disc | slopes 0, 1; growths 0, 1; `μ ≤ λ − 0`; `Sol_0` slopes `0, −1` (not PBQ) | holds; OHK 1938–1941, 2158–2159 |
| MS.2.1, 2.4, 2.5 | rank one; 0; `L_1 ⊕ L_0`; empty family | PBQ; not; not, filtration `L_1 ⊂ M`; sum 0 | holds |
| MS.2.2 | `Σ p^n x^(p^n)` on `G_m`; `A¹`; `y² = x³ − x` over `𝔽_5`, `P = (0,0)` | in `Â`, `E†_0`, not `E†_∞` (`p^(−n) r^(−p^n) → ∞`); polynomials; `div x = 2P − 2O`, class of order 2, `2 ∣ q − 1` | holds |
| MS.2.3 | slope-1 constant line; `L_η = M_η`, 0 | must twist; `M†`, 0 | holds; TSU 1052–1075 |
| MS.2.6 | Artin–Schreier; isomorphism | unit ↦ unit; `f_*1` unit-root | holds; source defects confirmed at TSU 1019–1031 |
| MS.2.7, 2.9 | `L_1 ⊕ L_0`; ordinary Legendre | `B_C = M`; top not overconvergent, kernel `H` rank 1 slope 0 | holds |
| MS.2.8 | `p ≡ 1 (4)`: eigenvalues; ranks | `π_p²`, `π̄_p²`, slopes 0, 2, absolute value `p`, distinct as `ab ≠ 0`; `M/L†(χ)` slope `0 < 1`, so `P_1 = L†(χ)` | holds; TSU 1126–1146 |
| MS.3.1–3.5 | `E†(−1) ⊕ E†(0)`; `[[1,1],[0,1]]` over `𝔽_q`; `(a,b) ↦ a + αb` | kernel `E†(0)`, `Sat = E†(−1)`; `c^q − c = 1` has no root in `𝔽_q((t))`, reducible top; span `E`, kernel dim 1 | holds |
| MS.3.6–3.7 | `h = id` on `S`; log vs unit | identity; ranks 2 ≠ 1 without saturation | holds |
| MS.3.8, 3.10 | rank one; 0; constant slopes 1, 0 | saturated; saturated; kernel `O(0)`, `Sat` rank 1 | holds |
| MS.3.9 | fold map `X ⨿ X → X`, `O(−1) ⨿ O(0)` | pieces saturated, pushforward not | fails: R02 |
| MS.4.1–4.2 | identity; `O(−1) ⊕ O(0) → O(0)`; log on `G_m`; `P = 0`; ordinary Legendre | equal; kernel on sections; kernel the slope −1 line; no slope; ranks `1 = 1` | holds; TSU 1344–1349 |
| MS.4.3–4.5 | rank one; log; `a < b` nonsplit; `a > b` rank two; Legendre–Kummer | irreducible; PBQ not saturated; quotients `M, N` only, PBQ; all slopes of `L` exceed those of `N`, splits; kernel of top map injects into the quotient line, zero if nonsplit | holds; TSU 1408–1417 |
| MS.4.6–4.8 | `h = c·id`; proper `C`; duals | `g† = c·id`; isoclinic; `Top(M^∨) = S_min(M)^∨`, direction `M† → N†` | holds; TSU 1435–1443 |
| MS.5.1–5.3 | `N = 0`; isoclinic `M`; `n = 2`, `L_0 ⊕ L_1` | 0; `N = Hull`; `F = [[0, q²],[1, 0]]`, eigenvalues `±q`, slopes `(0,0,1,1)` | holds; DAD 435–442, 451–457 |
| MS.5.4–5.5 | `N = 0`, `N = M` | `Q† = 0`, `(M†)^∨` | statement holds once defined: R03 |
| MS.5.6–5.7 | `y ↦ y^p − y`; `N` isoclinic, `M = Hull` | finite étale, wild at `∞`; `rank Top(M^∨) = rank N`, `N ⊆ S_min(M)` equal ranks | holds; DAD 665–674 |
| MS.5.8 | `P²_(𝔽_(p²))/𝔽_p`; Dwork on `A²`, line `x = 0` | `H⁰ = K_2`, `2 = 2`; `0 → 1` jump | holds; DAD 757–764, AE 509–514 |
| MS.6.1–6.4 | `A¹_(𝔽_(p²)) → A¹_(𝔽_p)`; disconnected `X` | fibre `Spec 𝔽_(p²)`, 0 rational points; support on one component, `h ≠ 0` there | holds; TSU 1456–1463 |
| MS.6.5–6.7 | `L = K`; cubic non-normal `L`; `m = 2` | rank; `L ⊗ L = L × L_2`; traces 1, 2; composites 2, 4; `m·deg(K_m/K) = m²` | holds; TSU 2110–2112 |
| MS.6.8 | fold map; `X_m` disconnected in MS.6.14 | `a ↦ (a,a)` injective; bijectivity onto a division algebra excludes it | holds |
| MS.6.9 | `ℚ_3(√5)`, `a = (1+√5)/2` | `T² − T − 1` values `2, 2, 1` mod 3; norm `−1`; `|a| = 1.618`, weights `±0.876` | holds |
| MS.6.10–6.14 | pole; duality twist; composite direction | `H^(2d)_c` eigenvalue `q^d`, weights `≤ j < 2d` below; `M^∨ ⊗ M` pure of weight 0 on `U` from equal fibres; `e_M ↦ 3e_M/2` | holds; TSU 1830–1842, 1936–1950 |

Ownership: `roadmaps grep` over main and the open heads: "PBQ", "dagger hull|†-hull" and "maximally
bounded" have no match; "minimal slope conjecture|minimal slope property" matches only a reference
entry of KloostermanSheavesAndBesselIsocrystals (`README.md:2491`); "Lefschetz condition" matches only
SatoTateGroups, for an unrelated notion. The parent (read at its head) states none of these objects. No `Suggested.lean` name can collide (no declaration).

Gaps: the nine `needs` sentences each state hypotheses and conclusion; none asks for something the
parent already states at its head (checked against §§RD.0.53, RD.5.2, RD.1.72, RD.6.85, RD.6.57,
RD.5.8c); the Weil II gap is needed because the `K`-linear Frobenius of an `L`-object has the
conjugates of the `L`-linear eigenvalues (the `ℚ_3(√5)` instance).

Wording: 14 passages put beside the sources (MS.0.4 / TSU 526–539 and DAD 568–581; MS.0.6 / CT11
547–557; MS.1.1 / TSU 878–897; MS.1.7 / OHK 2158–2159; MS.1.9 / TSU 953–964; MS.2.3 / TSU 1052–1075;
MS.2.6 / TSU 1019–1031; MS.2.8 / TSU 1111–1146; MS.4.2 / TSU 1344–1352; MS.4.5 / TSU 1408–1417;
MS.5.1–5.2 / DAD 435–442; MS.5.3 / DAD 451–457; MS.5.8 and the docile gap / AE 509–514; MS.6.1 / TSU
1456–1463). The longest shared run is the hypothesis "a complete intersection of ample divisors in good
position with respect to `Z`" (13 words, AE line 510), a fixed list of technical conditions; the proof
sketch of MS.1.9 has the three steps of TSU 960–963 in other words. No sentence is reproduced.

Arrangement: TSU has the largest share. Its sections against the layers: MS.0 ↔ §2.3, §§3.1, 3.3–3.6
(part), App. A, with CT11 §4; MS.1 ↔ §§3.6–3.7 with OHK; MS.2 ↔ §3.1 (lemmas), §§3.8–3.9 and the
convergent filtration, which TSU only asserts; MS.3 ↔ §§4–5; MS.4 ↔ §§6.1–6.2; MS.5 ↔ DAD §§4.1–4.2,
4.4; MS.6 ↔ §6.3, §7, App. B. Three layers share §3, one layer spans §§4–5, one layer comes from
another article: not a one-to-one map. The order MS.0 → MS.1 → MS.2 → MS.4 and MS.3 → MS.4 → MS.6 is
forced by the `*Needs:*` lines of MS.1.1, MS.2.5, MS.4.1, MS.4.3 and MS.6.2.

Source independence: 14 passages compared with 5 sources, none shared; largest share TSU, 101 of 148 locators; contents compared with TSU: independent

## Not verifiable

- de Jong 1998, Proposition 6.4 and Tsuzuki 1998, Theorems 4.2.6 and 7.2.3: recorded `uncertified`
  in `sources.toml`; cited by locator only, text not read.
- Ohkubo, Lemmas 1.12–1.15, 2.10–2.14, Proposition 12.4, Definition 12.5, Theorem 12.7 and Lemma 7.10:
  existence and pages confirmed, statements not compared line by line.
- Chiarellotto–Tsuzuki §4.4 (pp. 50–54), Examples 5.2(3) and 5.11: locators confirmed, the rank-three
  computation of the MS.1.5 Check not recomputed.
- The 56 parent sections whose headings resolve but whose statements were not read against their use.
- Whether the parent will accept the nine supplier requests: a declared contract, not checked here.
- Ownership against the open pull requests whose files the brief does not list (267 of 464) was
  checked only through `roadmaps grep`.

## Source issues

- **Misprint** in TSU at Theorem 3.19(1)(ii) and (2), pp. 16–17: the source says the decreasing maximal slopes and the summands of the bounded quotient are those of the nested terms; it should be those of the successive quotients; affects a stated result.
- **Error** in TSU at Lemma 3.31 and its proof, p. 19: the source puts the direct-image object on the base curve and the pullback object on the cover, and its proof of (1) ends with the hypothesis while (2) cites the lemma itself; it should place them oppositely and prove (1) by base change of the bounded quotient; affects the proof.
- **Misprint** in TSU at §3.9, p. 21: the source says the support-forgetting map goes from the ordinary first cohomology to itself; it should start from compactly supported cohomology; affects nothing.
- **Misprint** in TSU at Proposition 3.24, p. 18: the source says the rank of the isoclinic quotient equals the slope part of the solution space; it should be its dimension; affects nothing.
- **Misprint** in TSU at Theorem 6.4, p. 27: the source says the given isomorphism is one of overconvergent objects with target a generic bounded quotient; it should be a convergent map between the global bounded quotients; affects a stated result.
- **Misprint** in DAD at proof of Lemma 4.1.4, p. 12: the source says the first term of the chain is the sum of the Frobenius pullbacks of the hull; it should be the first slope step of that sum; affects nothing.
- **Gap** in DAD at proof of Proposition 4.2.12, p. 17: the source says a positive lower bound for norms off `p` times the lattice follows from compactness; for the inclusion of `A_1` in the Tate algebra the elements `p^j u^j` have norm `p^(−j)`, so the bound and the bounded-torsion claim fail; affects the proof.
- **Gap** in DAD at proof of Lemma 4.2.7, p. 15: the source says injectivity of the generic overconvergent base change follows from a proposition proved for a complete residue field; it should be proved for the residue field `k(t)`; affects the proof.

## For the human reviewers

- **Scope.** The roadmap follows one 2019–2021 research article (TSU, 101 of 148 locators) and one Annals article (DAD); both are refereed or on arXiv with published versions. Whether a roadmap of this width is wanted is yours to decide.
- **Licence.** AE is read from an author page (`sources.toml`, `licence_class = "author-page"`); DEJONG98 and TSU98 are `uncertified` and cited by locator only.
- **Scope.** `README.md:2494-2573` lists 34 corrections to published sources, including a claimed gap in the proof of DAD Proposition 4.2.12 (confirmed here on the instance `A_1 ⊂ W⟨u⟩`); whether such a list belongs in a roadmap is a human decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8f92ca6c1eae1d42b8d4ca29b35c661fe046cf5d", "job": "RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1b", "model": "fable", "worker": "chris-x52"} -->
