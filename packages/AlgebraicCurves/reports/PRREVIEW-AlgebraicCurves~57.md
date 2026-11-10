# Review of AlgebraicCurves (pull request #1807 at 5048718)

**Verdict:** needs changes

This head repairs all seven findings of the previous review (first table under Verified sound). The new general headline of §11.4 is true, and Rosenlicht §3 (p. 5) supports it as stated. A full re-review finds one P2 and three P3.

## R01 (P2) — The §11.4 step-3 lemma says "separably generated" for arbitrary fields, which is false

**Location.** `TauCetiRoadmap/AlgebraicCurves/README.md` lines 2008–2010: "Prove that a field is separably generated over the fixed field of any group of its automorphisms (Rosenlicht 1955, §3, Lemma, pp. 4–5)".

**Claim.** The README uses "separably generated" in the modern sense: §8.1 item 1 defines it as having a separating transcendence basis. In that sense the target is false unless the extension is finitely generated. Rosenlicht's proof (`Rosenlicht1955` lines 172–187) establishes only MacLane's criterion: `p`-th powers of `E^G`-linearly independent elements stay independent. That criterion is separability. It gives a separating basis only for finitely generated extensions.

**Witness.** Take `E` the perfect closure of `𝔽̄_p(t)` and `G` the translations `t ↦ t + a`, `a ∈ 𝔽̄_p`. Then `E^G = 𝔽̄_p`. If `{s}` were a separating basis, then `s^{1/p} ∈ E` would be purely inseparable of degree `p` over `𝔽̄_p(s)`. So `E/𝔽̄_p` is not separably generated.

**Repair.** In step 3, write: "Prove that for a field `E` and a group `G` of its automorphisms, the `p`-th powers of `E^G`-linearly independent elements of `E` are `E^G`-linearly independent (Rosenlicht 1955, §3, Lemma, pp. 4–5). Since `F/k` is essentially of finite type (`TauCeti.isFunctionField_iff_trdeg_eq_one`), Mathlib's `exists_isTranscendenceBasis_and_isSeparable_of_linearIndepOn_pow_of_essFiniteType` (`Mathlib/FieldTheory/SeparablyGenerated.lean:289`) then makes `F/k` separably generated." Add both names to the §11.4 *Needs:* line.

**Tested on the witness.** For the perfect closure, the repaired lemma holds: Frobenius is injective and `𝔽̄_p` is perfect, so `∑ cᵢ fᵢ^p = 0` gives `∑ cᵢ^{1/p} fᵢ = 0`. No separable generation is concluded, because `E/𝔽̄_p` is not essentially of finite type. For a function field `F/k` the conclusion of step 3 is unchanged.

## R02 (P3) — A §9.2 Check says `x^{−p}` has no antiderivative in characteristic `p`; it has one

**Location.** `TauCetiRoadmap/AlgebraicCurves/README.md` lines 1609–1610: "In characteristic `p`, `x^{−p} dx` has residue `0` at `P_0` while `x^{−1} dx` has residue `1`: the formula holds although `x^{−p}` has no antiderivative."

**Claim.** The Check is false, so it does not test what it says it tests. It means to show that residues behave in characteristic `p` even for differentials that are not exact.

**Witness.** `d(x^{1−p}) = (1 − p) x^{−p} dx = x^{−p} dx`, because `1 − p ≡ 1 (mod p)`. So `x^{−p} dx` is exact.

**Repair.** Use `x^{−p−1} dx`. Its residue at `P_0` is `0`, and it is not exact in `k((x))`: a Laurent antiderivative would need a term `c x^{−p}` with `−p · c = 1`, which is impossible in characteristic `p`.

**Tested.** At `p = 3`, the coefficient of `x^{−1}` in `x^{−4}` is `0`, and `d(c x^{−3}) = −3c x^{−4} dx = 0`.

## R03 (P3) — §8.1 items 1–2 and §11.4 step 1 plan facts the pinned Tau Ceti already proves, and cite none of them

**Location.**

- README lines 1237–1256, §8.1 item 1: "It gives … geometric reducedness of the generic field". Item 2: "prove the converse through separable generation and relative algebraic closure".
- The *Needs:* at lines 1267–1269.
- §11.4 step 1, lines 1981–1983: "Exactness makes `k` separably closed in `F`, so `F ⊗[k] k^sep` is a field".

**Claim.** Each of these inputs is a pinned declaration that the README neither cites nor lists in the supplier contracts. This is duplication by object.

**Witness.** At the Tau Ceti pin:

| Pinned declaration | What it proves |
|---|---|
| `TauCeti.isGeometricallyReduced_of_separating` (`FieldTheory/Separable/Regular.lean:90`) | a separating element makes `F/k` geometrically reduced (item 1) |
| `TauCeti.isDomain_tensorProduct_of_isGeometricallyReduced` (`Regular.lean:110`) | geometrically reduced with exact constants gives tensor domains |
| `TauCeti.exists_isTranscendenceBasis_and_isSeparable_of_isGeometricallyReduced` (`Separable/GeometricallyReduced.lean:105`) | finitely generated and geometrically reduced gives separably generated (the converse in item 2) |
| `TauCeti.isDomain_tensorProduct_of_isIntegrallyClosedIn` (`FieldTheory/AlgebraicClosure.lean:57`) | exactness makes `F ⊗[k] L` a domain for separable algebraic `L` (step 1) |
| `TauCeti.IsPurelyInseparable.isDomain_tensorProduct` (`PurelyInseparable/TensorProduct.lean:94`) | the purely inseparable step |

**Repair.**

- Cite the first three in §8.1 items 1–2 and add them to that *Needs:* line.
- State item 2's converse as their composite:
  - a domain `k̄ ⊗[k] F` is reduced, so `F/k` is geometrically reduced (`Algebra.isGeometricallyReduced_field_iff`), hence separably generated;
  - a constant `a ∉ k` of degree `n ≥ 2` gives zero divisors in `k(a) ⊗[k] k̄ ≅ k̄[T]/(minpoly a)`.
- Cite the last two in §11.4 step 1 and its *Needs:* line.

**Tested.** On §8.1's own Check (`y^p = a + b x^p` over `𝔽_p(a, b)`), `k̄ ⊗[k] F` contains the nonzero nilpotent `z`. So the composite correctly reports no separating element.

## R04 (P3) — The `Suggested.lean` module docstring narrows a pinned theorem that the second headline uses at full strength

**Location.** `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 27–28: "genus invariance under finite separable constant extension `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`".

**Claim.** The pinned theorem covers separable algebraic extensions, finite or not. The docstring of `finite_algEquiv_of_two_le_genus` (lines 95–97) applies it to the infinite `k̄/k`. As written, the module docstring makes that step look unsupported.

**Witness.** `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean:267–275` assumes only `[Algebra.IsSeparable k k']`, and its docstring says "finite or not … Over a perfect `k` this applies to an algebraic closure of `k`".

**Repair.** Replace "finite separable constant extension" with "separable algebraic constant extension, finite or not".

## Verified sound

**The previous review (b0d6406), finding by finding.**

| Id | Passage at this head | Status |
|---|---|---|
| R01 | `Suggested.lean` line 80 `finite_algEquiv_of_two_le_genus_of_genus_constantCompositum_pos`, with `[IsAlgClosure k K]`, `hc : constantCompositum F K F' = ⊤`, `hK : 0 < genus K F'`; README §11.4, lines 1956–1963; the perfect case is kept as a corollary | repaired, more general than asked (`0 < g′` instead of `g′ = g`) |
| R02 | §11.4 *Needs:* lines 2029–2033 name `groupScheme`, `identityComponentHopfIdeal`, `eq_snd_comp_lift_comp`, `genus_eq_genus_of_constantCompositum_eq_top`; the rigidity map `(P, σ) ↦ φ(σP) − φ(P) − φ(σP₀)` is at lines 2000–2003; the closed subgroup is stated as a target ("Prove that", line 1992) | repaired |
| R03 | Lines 963–965: Thm. 3.8.7 "consumes it only through the separability of the residue extensions" | repaired |
| R04 | §8.1 item 2 owns the regular-field targets; 12B.0a (lines 2149–2155) consumes them; the *Needs:* are split by item (lines 1267–1270, 2190–2193); the build paragraph (lines 302–304) gives the item order | repaired |
| R05 | Lines 186–196 cite `Mathlib/RingTheory/RamificationInertia/` and `Ideal.sum_ramification_inertia_eq_finrank`, call the NumberTheory module deprecated, and drop the replacement sentence; §6.3 (line 1012) uses the new name | repaired |
| R06 | Lines 544–551 use the complementary index set `T`; the new Check at lines 563–565 | repaired |
| R07 | Lines 307–309 map the old anchor; `overlaps.md` lists no dropped id | repaired |

**Gate, dependency check, build.**

- The worker's gate at 5048718 passed every check, including `build=0`.
- My run of `gate … --base origin/main` fails only on `outside-folder=26`. All 26 paths are the `README.md` and `Suggested.lean` of the 13 folders this brief names as the pull request's own. `git diff --stat` over every other path is empty.
- Dependency check: `depcheck: 234 roadmaps, 2290 edges, 0 problem(s)`, with no UPWARD or CYCLE line. AlgebraicCurves is on main and cites only main suppliers: JacobianChallenge, FormalLaurentPuiseux and `Completed/` LocalFieldsRamification.
- `lake env lean` on `Suggested.lean`: two warnings, `80:8` and `104:8` `declaration uses 'sorry'`, and nothing else.

**Signatures.** `signatures.md` matches README §11.4 for both declarations:

- the general theorem has `{k K F F'}`, the scalar towers `k K F'` and `k F F'`, `[IsAlgClosure k K]`, `hF`, `hex`, `hc`, `2 ≤ genus k F` and `0 < genus K F'`;
- the corollary has `[PerfectField k]`, `hF`, `hex` and `hg`.

No binder is lost. I made no change to the file, so there was nothing to re-check.

**Padding probe.** On scratch copies, for both theorems: `infer_instance` fails to synthesize an instance, `simp` makes no progress, and `exact?` fails. The pinned `TauCeti.finite_algEquiv_of_two_le_genus` needs `[IsAlgClosed k]` (`Automorphism/HigherGenus.lean:124`). Deriving the corollary from the general theorem needs a field `F′` to be constructed, so it does not close in one tactic. Neither declaration is padding.

**Names at the pins.**

- A scratch file of 307 `#check @…` for every backticked dotted or underscored README token gave 22 errors, all accounted for:
  - variables: `W.…`, `ord_P`;
  - the namespace `Polynomial.Bivariate`;
  - this roadmap's two names;
  - 12 unqualified Mathlib names, each found by grep: `count_*` in `DedekindDomain/Factorization.lean`, `ringKrullDim_stalk_eq_coheight` in `AlgebraicGeometry/Properties.lean`, `finite_appTop_of_universallyClosed` in `Morphisms/Proper.lean`, and so on;
  - two names in the unbuilt module `AffineModel/SInteger.lean`, read in source at lines 82 and 104;
  - `TauCeti.ProjectiveGeneralLinear.groupScheme`, an `abbrev` at `ProjectiveGeneralLinear/Basic.lean:132` that my import list missed.
- The only deprecation warnings are for `Ideal.inertiaDeg'` and `Ideal.sum_ramification_inertia`, which the README itself calls deprecated.

**Pinned statements opened and compared with the README.**

| Declaration and location | Checked against the README |
|---|---|
| `constantCompositum` (`GeometricDegree.lean:115`) | `adjoin F (range (algebraMap k' F'))` |
| `genus_le_genus_of_constantCompositum_eq_top` (`Genus/Basic.lean:243`) | `[Algebra.IsAlgebraic k k']` only |
| `genus_eq_genus_of_constantCompositum_eq_top` (`:273`) | `[Algebra.IsSeparable k k']` and exactness |
| `AlgebraicGeometry.genus_eq_genus_functionField_of_constantCompositum_eq_top` (`Curves/Genus/ConstantExtension.lean:125`) | smooth of relative dimension 1, proper, geometrically integral |
| `eq_snd_comp_lift_comp` (`AlgebraicGeometry/Rigidity.lean:191`) | `X` proper and geometrically integral; `Y` locally of finite type and geometrically integral; `Z` separated |
| `identityComponentHopfIdeal` (`Connected/Comultiplication.lean:213`) | `[IsAlgClosed k]`, finite-type Hopf algebra |
| `holomorphyRing` (`HolomorphyRing/Basic.lean:108`) and `isPrincipalIdealRing_holomorphyRing` (`:468`) | `S.Finite` only |
| `Set.restrictScalars_integer_eq_holomorphyRing` / `holomorphyRing_eq_restrictScalars_integer` (`AffineModel/SInteger.lean:82`, `:104`) | as described |
| Mathlib `Ideal.ramificationIdx` (`RingTheory/RamificationInertia/Ramification.lean:54`) | length of `S_q/pS_q` |
| `Ideal.sum_ramification_inertia_eq_finrank` (`Basic.lean:73`) | `IsDomain R`, finite, flat |
| `Mathlib/NumberTheory/RamificationInertia/Galois.lean` | not deprecated; imports the RingTheory module |
| `adjoin_eq_adjoin_of_finrank_adjoin_eq_two` (`Hyperelliptic/RationalSubfield.lean:152`) | exact, `g ≥ 2`, no separability |
| `infinite_algEquiv_of_genus_eq_one` (`Automorphism/Elliptic.lean:227`) | as described |

**Cross-roadmap citations resolved.**

- JacobianChallenge (main): Layers A–B at lines 111 and 135, Layers E–F at 332 and 448.
- FormalLaurentPuiseux (main): L1–L3 at lines 70, 112 and 140.
- LocalFieldsRamification (`Completed/`): Layer 3 at line 724.
- SchemeAndStackFoundations at this head: §4.15 at line 5538, and its consumer contract at line 548.
- BelyiMaps (main) line 581 cites "Layer 8 item 2 and Layer 12, items 12B.0a, 12B.0b and 12B.0d". All of these still resolve: 12B.0a now consumes §8.1 item 2.
- Layer-11 consumers at open heads, which read correctly against the general headline and its perfect-field case: CanonicalModelsAndGonality (line 1380), GroupActionsOnRiemannSurfaces (line 302, characteristic zero) and HyperellipticCurves (line 833).

**Ownership and overlaps.**

- `roadmaps grep` for `Rosenlicht` and `finite_algEquiv` across main and the open heads finds only consumers. FunctionFieldArithmetic's "Rosenlicht" is the ray-class universal property, a different object. Nobody else owns finiteness over an arbitrary field.
- #1808 and #1854 conflict with this head. The description's merge-order block fixes the order `AlgebraicCurves`: this pull request → #1808 → #1854.
- No id is dropped either way.

**Sources checked against the text.**

- `Rosenlicht1955`:
  - §2 Theorem at line 140 (p. 4): algebraically closed `k`, `g > 0`.
  - The first Lemma at lines 61–64: `6g − 6 > 2g − 2`, `r = 5g − 5`.
  - The second Lemma at lines 107–139: `G` is the identity component of `G′`.
  - §3 opens at lines 164–168; its Lemma is at lines 169–187 (pp. 4–5) and its Corollary at lines 188–192 (p. 5).
  - The argument of lines 193–212 (p. 5) concludes that `k̄K` is rational in the exceptional case. This is the general headline in contrapositive form, and steps 1–3 of the README follow it, including the role of singular places at lines 200–207.
  - The p. 10 Theorem and its converse are at lines 406–420. The genus `(p − 1)(p − 2)/2` of `y^p − y = a x^p` and the condition "exceptional if `p > 2`" are at lines 425–429.
- Sampled Stichtenoth locators are not readable (see Not verifiable). Their numbering agrees with the pinned Tau Ceti docstrings for:
  - Prop. 1.2.1 (18 occurrences), Thm. 1.2.2, Cor. 1.2.3;
  - Def. 1.4.1, 1.4.2, 1.4.15; Prop. 1.4.14; Cor. 1.4.16; Thm. 1.4.17;
  - Def. 1.5.1–1.5.3; Thm. 1.5.4; Cor. 1.5.5; Thm. 1.5.17;
  - Prop. 1.6.3, 1.6.6, 1.6.12; Rem. 1.6.4; Def. 1.7.1; Prop. 1.7.2–1.7.4;
  - Prop. 3.1.4, 3.1.7, 3.1.15; Def. 3.1.5; Thm. 3.1.11; Cor. 3.1.12;
  - Thm. 3.5.1; Cor. 3.5.5; Prop. 3.6.1, 3.6.6; Cor. 3.6.4, 3.6.8; Thm. 3.8.7;
  - Def. 4.2.8, 4.2.10; Prop. 4.2.9.

**Adversarial table.**

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | General headline (Lean line 80) | `k = ℂ`; `y²=x⁵−1/𝔽₃(t)`; `y²=(x³−t)(x²−1)/𝔽₃(t)`; `y⁵−y=ax⁵` over separably closed imperfect `k`; `y²=x³−2/ℚ`; `ℂ(x)` | `k` closed: `hc` forces `F′≅F`, `g′=g`. `x⁵−1` separable mod 3: `g′=2`, finite. `τ³=t`, `u=y/(x−τ)`: `u²=(x−τ)(x²−1)`, `g′=1`, `|Aut|≤2·3!=12`. `w=y−a^{1/5}x`, `w⁵=y`, `g′=0`, infinite, `hK` fails. `5²=27−2`, `g=1`, `hg` fails. `PGL₂(ℂ)` infinite, `hg` fails | true; both genus hypotheses load-bearing | none |
| 2 | Perfect corollary (Lean line 104) | Hermitian `y³+y=x⁴/𝔽̄₃`; `y²=x⁵−1/ℚ` | `g=3`, gaps `{1,2,5}` with `2=5` in `𝔽₃`, `|PGU₃(3)|=27·28·8=6048`. `g=2`, finite. `k̄/k` separable, `g′=g≥2>0` | true | R04 (docstring) |
| 3 | §11.4 step 1 (unique prime of `F⊗K`) | `y^p=a+bx^p/𝔽_p(a,b)`; `k=ℚ` | `z=y−a^{1/p}−b^{1/p}x`: `z^p=0`, `z≠0`, so `F′=(F⊗K)_red`. Over `ℚ`, `F⊗ℚ̄` is a domain | holds | R03 (citations) |
| 4 | §11.4 step 3 lemma | perfect closure of `𝔽̄_p(t)`, `G` translations | `E^G=𝔽̄_p`. `s^{1/p}∈E` has degree `p` over `𝔽̄_p(s)`, so no separating basis | false as worded | R01 |
| 5 | §11.4 step 2, rigidity | `(P,σ)↦φ(σP)−φ(P)−φ(σP₀)` | `X×{e}↦φ(P)−φ(P)−φ(P₀)=0`; value at `(P₀,σ)`: `−φ(P₀)=0` | holds | none |
| 6 | §2.3 S-integers | `k(X)`, `S={P_X}` | `𝒪_S=k[X]_(X)=Set.integer T` with `T∌(X)`; `Set.integer {(X)}=k[X][1/X]` | holds | none |
| 7 | §6.3 via `sum_ramification_inertia_eq_finrank` | `y²=x/ℚ` at `P_{x+1}`, `P_x` | `1·2=2`; `2·1=2`; rank `2` | holds | none |
| 8 | §1.1 places | `𝔽₂`; `ℝ` | `P_X`, `P_{X+1}`, `P_∞`: `3=2+1`. `X²+X+1`: `b²=1<4` | holds | none |
| 9 | §3.1 divisors | `ℂ(x)/ℝ`; `ℚ` | `div i=0`, `i∉ℝ`. `deg P_{X²+1}=2` against an unweighted `1` | holds | none |
| 10 | §3.4 genus junk | `ℂ(x)/ℝ`, `D=nP_∞` | `2n−2(n+1)+1=−1`; `deg D≤−2` gives `≤−1`. Pinned genus `0` | holds | none |
| 11 | §4.1 filtration | `D=−P_∞`; `1/X` at `P_X` | `v(0)=0≤exp(−1)`, while the additive form demands `0≥1`. `v(1/X)=exp 1`: in `A(P_X)`, not in `A(0)` | holds | none |
| 12 | §4.2 quotients | `P_{X²+1}/ℚ`; `nP_∞` | `dim 𝔪⁰/𝔪¹=2`; `F∩A(nP_∞)` has dimension `n+1` | holds | none |
| 13 | §5.1 regime | `W`; `y²=x³−x` | `ℓ(W)=g≠g−1`; `(x)_∞=2O`, `(y)_∞=3O` | holds | none |
| 14 | §5.2 genus zero | `x²+y²=−1/ℝ` | every place has even degree, so no degree-1 divisor; not rational | holds | none |
| 15 | §5.7 local components | `ω(1)`; `k(X)` at `P_X` | `∑ω_P(1)=ω(1)=0`; the completion is `k((X))` | holds | none |
| 16 | §6.1 lying over | `y²=x`; `ℂ(x)/ℝ(x)` | `P_x`: `e=2`. `P_{x−1}`: two places, `e=f=1`. `P_∞`: `e=1`, `f=2` | holds | none |
| 17 | §7.2 Dedekind | `y²+y=x³/𝔽₂`; `y²=x³−x` | `m=3`, `d=(2−1)(3+1)=4≥e=2`, wild; `d=1=e−1` | holds | none |
| 18 | §8.1 three inputs | `ℂ⊗_ℝℂ(x)`; `y^p=a+bx^p` | `≅ℂ(x)×ℂ(x)`. `[F:kF^p]=p²>p`, so no separating element; `z^p=0` | holds | R03 |
| 19 | §8.7 Hilbert | `y²+y=x³`; fierce `V₄` | `G₀…G₃=ℤ/2`: sum `4=d`. `G₀=V₄`, `G₁=1`: `3≠2` | holds | none |
| 20 | §9.2 residues | `dx/x`; `x^{−p}dx` | `res₀=1`, `res_∞=−1` (`dx/x=−dt/t`). `d(x^{1−p})=x^{−p}dx` | Check false | R02 |
| 21 | Layer 6 audit (old R03) | fierce `V₄` | Hilbert sum `3`, `d=2`; the sentence now restricts Thm. 3.8.7 | holds | none |
| 22 | §8.1/12B.0 order (old R04) | *Needs:* lines | items 1–2 → Layer 0; 12B.0a–b → §8.1 item 2; item 3 → 12B.0a–b: acyclic | holds | none |
| 23 | §10.1 characteristic-2 Check | `y²=x³+a/𝔽₂(a)` | `2g−2=−6+2·2+2·1=0`; `Δ=a₃⁴=0`; `v²=x³` over `k(√a)` | holds | none |
| 24 | §8.11 plane bound | `y²=x³−x`, `n=[F:ℚ(y)]=3` | `g≤2·1/2=1`, equality | holds | none |
| 25 | §11.6 Hermitian | `q=41,37,64` | `68921>68796`; `50653<55860`; `262144>169260` | holds | none |
| 26 | Docstring of `genus_eq_genus_of_constantCompositum_eq_top` | pin, `Genus/Basic.lean:269` | pin: "finite or not"; module docstring: "finite" | narrower | R04 |

## Not verifiable

- `Stichtenoth2009` is settled as uncertified, so I could not read it. This covers every sampled locator except §11.4: §1.1 (Prop. 1.2.1, Thm. 1.2.2), §3.1 (Def. 1.4.1–1.4.2), §3.4 (Prop. 1.4.14–Def. 1.5.1), §4.1 (Def. 1.5.2–1.5.3), §4.2 (Thm. 1.5.4, Cor. 1.5.5), §5.1 (Thm. 1.5.17, Prop. 1.6.6, 1.6.12), §5.2 (Prop. 1.6.3, Rem. 1.6.4), §5.7 (Def. 1.7.1–Prop. 1.7.4), §6.1 (Prop. 3.1.4–3.1.7), §6.3 (Thm. 3.1.11), §7.2 (Thm. 3.5.1, Lemma 3.5.3), §8.1 (Prop. 3.6.1, Cor. 3.6.4, Prop. 3.6.6, Cor. 3.6.8), §8.7 (Thm. 3.8.7) and §9.2 (Def. 4.2.8–4.2.10).
  - The numbering is cross-checked against Tau Ceti docstrings only. No docstring cites Lemma 3.5.3.
  - The Tau Ceti docstrings cite Rem. 1.6.4 only for the real conic, not for §5.2's finite-field clause.
- Uncertified, cited by locator only: `Hartshorne1977`, `Goldschmidt2003`, `VillaSalvador2006`, `Deuring1973`, `Rosen2002`, `Serre1979`, `Roquette1970`, `Stichtenoth1973a` and `Stichtenoth1973b`.

## Source issues

- **Gap** in Rosenlicht1955 at §3, Lemma, p. 4: the source says `E` is separably generated over the fixed field of any automorphism group; it should say separable (MacLane's criterion), which gives a separating transcendence basis only for finitely generated `E`; affects nothing.
