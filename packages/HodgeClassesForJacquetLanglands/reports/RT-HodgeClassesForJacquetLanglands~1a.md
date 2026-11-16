<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6904652339 -->
Red team round 1 pass a (claude) of 14accbd

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) gap:quaternion-ramification-classification asks for what GL2AutomorphicRepresentationsAndTransfer §R17.1.5 already provides

   - **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:469-473` ("quaternion algebras over
     a number field are classified by their ramification sets, every finite set of non-complex places of
     even cardinality occurs, an element of order two in `Br(F)` is the class of a unique quaternion
     algebra, and …"); the same sentence in `design/plan.json`, `gaps`, slug
     `quaternion-ramification-classification`.
   - **Claim.** All four clauses are missing from every earlier roadmap, so ClassFieldTheory must supply
     them.
   - **Witness.** GL2AutomorphicRepresentationsAndTransfer (open head, earlier in the merge order),
     §R17.1.5, paragraph "Ramification realization": finite sets `S_f, S_∞` are the nonsplit places of a
     quaternion algebra iff `S_∞` is real and `|S_f|+|S_∞|` is even. That is the second clause. The
     sentence is also compound (four theorems).
   - **Repair.** Replace the contract paragraph by:

     > What ClassFieldTheory must provide (gap:quaternion-ramification-classification): two quaternion
     > algebras over a number field with the same set of ramified places are isomorphic; every element of
     > order two in `Br(F)` is the class of a quaternion algebra; and a quadratic extension `E/F` embeds
     > in a quaternion algebra `B` exactly when no place ramified in `B` splits in `E` (IP23, §12.2.1,
     > p. 94). The existence of a quaternion algebra with a prescribed finite set of non-complex ramified
     > places of even cardinality is GL2AutomorphicRepresentationsAndTransfer §R17.1.5 and is not asked
     > for again.

     Add `§R17.1.5` to the list of GL2AutomorphicRepresentationsAndTransfer sections in "Scope and
     ownership" (line 91), to the supplier subsection (after `§R16.1.8`, as "§R17.1.5 ramification
     realization for quaternion algebras"), and to the `*Needs:*` lines of §0.4 and §10.2 and the
     Dependencies lines of Layers 0 and 10. Narrow the `needs` sentence of the plan's gap to the same
     three clauses. Tested on the instance of the §0.4 Check (`F` real quadratic, `B` ramified at
     `{𝔭, 𝔮}`): existence is §R17.1.5 with `S_f = {𝔭, 𝔮}`, `S_∞ = ∅`, `2` even; uniqueness and the class
     `[B₁]+[B₂]` are the narrowed gap.

2. **F02** (P2) gap:derham-local-system-cohomology asks for subquotient stability that PadicHodgeTheory §3.1 already states

   - **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:528-529` ("and every subquotient of
     a de Rham representation of `G_K` is de Rham"); used at `README.md:2448` and in the `*Needs:*` of
     §9.4 (`README.md:2459-2460`); the same clause in `design/plan.json`, slug
     `derham-local-system-cohomology`.
   - **Claim.** PadicHodgeTheory lacks the stability of de Rham representations under subquotients.
   - **Witness.** PadicHodgeTheory (open head), §3.1 "Regular periods and finite-dimensional descent":
     on `B`-admissible representations the functor is exact and "Subobjects and quotients of an
     admissible object are admissible"; de Rham is `B_dR`-admissible (its §3.3).
   - **Repair.** End the contract paragraph after the first statement:

     > What PadicHodgeTheory must provide (gap:derham-local-system-cohomology): a lisse `ℚ_p`-sheaf `𝕃`
     > on a geometrically connected smooth variety over a finite extension `K` of `ℚ_p` whose stalk at
     > one classical point `x`, defined over a finite extension `K′` of `K`, is a de Rham representation
     > of `G_{K′}` is de Rham in the sense of §7.2 (the de Rham input of IP23, Remark 11.10, p. 90).

     In the PadicHodgeTheory supplier line (`README.md:512`) put "§3.1 (`B`-admissible representations:
     exactness, and stability under subobjects and quotients)" before §3.3. In §9.4 write "using that
     subquotients of de Rham representations are de Rham (PadicHodgeTheory §3.1 for `B = B_dR`)" and
     change its `*Needs:*` to "§9.3; ClassFieldTheory Layer 11; GlobalNumberFields Layers 2, 4;
     PadicHodgeTheory §§3.1, 3.3." In the Layer 9 Dependencies write "PadicHodgeTheory §§3.1, 3.3, 4.4"
     (R04), and narrow the plan's `needs` to the one-point rigidity statement. Tested
     on the step that used the clause: for `W` de Rham with `0 → ℚ_ℓ^m → W → ℚ_ℓ → 0`, each pushout
     along a coordinate `ℚ_ℓ^m → ℚ_ℓ` is a quotient of `W`, de Rham by §3.1; §0.2 uses only the rigidity
     statement and is unaffected.

3. **F03** (P3) a Check of §7.10 miscounts the sign vectors of its own theorem

   - **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:2129-2130` ("For `d = 1` there are
     two signs at the split place and the statement gives two nonzero pairings for one class.").
   - **Claim.** For `d = 1` the theorem gives two nonzero pairings.
   - **Witness.** The theorem (`README.md:2111`, `2119`) indexes `ε` by `{±1}^{Σ_∞}` and gives `2^n`
     pairings; `d = 1 < n` forces `n ≥ 2`, so at least `4`. The Layer 7 Example (`README.md:2142-2144`)
     counts four for `F` real quadratic. IP23 line 3072 indexes `ε` by `Σ_∞`.
   - **Repair.** Replace the Check by: "For `F` real quadratic and `d = 1` there are `2² = 4` sign
     vectors, two signs at the split place and two at the compact place, and the statement gives four
     nonzero pairings for one class; when `k_v = 2` at the compact place the two signs there give the
     same weight `0`, and the vector is the same up to a scalar." Computed: weights at the compact place
     are `±ε_v(k_v − 2) = 0` for `k_v = 2`.

4. **F04** (P3) the Dependencies lines of Layers 0 and 9 omit suppliers their sections' `*Needs:*` lines name

   - **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:931-938` (Layer 0) and
     `README.md:2487-2489` (Layer 9).
   - **Claim.** Each Dependencies line is the union of its layer's `*Needs:*` lines.
   - **Witness.** §0.2 (`README.md:710-715`) needs PadicHodgeTheory §7.2, gap:derham-local-system-cohomology
     and gap:vhs-hodge-decomposition; §0.4 needs gap:quaternion-ramification-classification; §0.1 needs
     `TauCeti.symPowerRep`; none is in the Layer 0 line. §9.3 (`README.md:2438`) needs PadicHodgeTheory
     §4.4; the Layer 9 line has only §3.3.
   - **Repair.** Layer 0: change "ComplexKahlerGeometry §K6.1" to "ComplexKahlerGeometry §K6.1 and
     gap:vhs-hodge-decomposition", "PadicHodgeTheory §§3.3, 8.1" to "PadicHodgeTheory §§3.3, 7.2, 8.1 and
     gap:derham-local-system-cohomology", "ClassFieldTheory Layer 10" to "ClassFieldTheory Layer 10 and
     gap:quaternion-ramification-classification", and "Tau Ceti `TauCeti.Hodge`" to "Tau Ceti
     `TauCeti.Hodge`, `TauCeti.symPowerRep`". Layer 9: change "PadicHodgeTheory §3.3" to
     "PadicHodgeTheory §§3.1, 3.3, 4.4" (with R02; "§§3.3, 4.4 and gap:derham-local-system-cohomology"
     if R02 is not applied).

Two P2 findings (both on declared supplier gaps that ask for something an earlier roadmap already
provides) and two P3 findings. No P1: no false statement, no unowned prerequisite and no broken
supplier citation was found. `Suggested.lean` was not changed and no Lean was run (the brief allows
none); the elaborated types were read from the worker's `signatures.md` and compared with the README.

## Adversarial table

`Suggested.lean` declarations (context: no `variable` block; every binder is in the signature).

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| `IsExteriorStar` (def, real body) | `H = diag(a₁..a₄)`, `vol(e₁₂₃₄) = −1`; wrong model `σ(·)`-conjugated or `−L` | `L(e₁₂)∧e₁₂ = −a₁a₂e₁₂₃₄` gives `L(e₁₂) = −a₁a₂e₃₄`; `e₂₄∧e₁₃ = −e₁₂₃₄` gives `L(e₁₃) = +a₁a₃e₂₄`; `−L` fails the identity at `y = e₁₂` (`+a₁a₂ ≠ −a₁a₂` unless `0`) | determines `L`; matches README §1.3 list (all six recomputed) |
| `existsUnique_isExteriorStar` | `H = 0`; `σ = id`; `σ` not an involution (`ℚ(t)`, `t ↦ t²`) | `H = 0`: `L = 0` unique since the wedge pairing is perfect in degree `(2,2)` of a 4-space; general `σ`: `⋀²` of a `σ`-semilinear map exists, uniqueness from spanning by pure wedges | true as typed; `FiniteDimensional` is implied by `2 + 2 = finrank` (harmless) |
| `IsExteriorStar.comp_self` | diagonal Hermitian; `H = 0`; `σ = id` with `A = 1 + E₁₂` (not symmetric); alternating `A` | diagonal: `L(L e₁₂) = σ(a₁a₂)a₃a₄ e₁₂ = a₁a₂a₃a₄ e₁₂`, RHS `det/(σ(−1)(−1)) = a₁a₂a₃a₄`; general: matrix of `L∘L` is `(σ(c)c)⁻¹ C₂(G)ᵀ S C₂(G) S = det G/(σ(c)c)` by Jacobi's complementary-minor identity, using only `σ(G) = Gᵀ`; `H = 0`: `0 = 0`; `1 + E₁₂`: `L²e₁₃ = e₂₃ ≠ e₁₃` (hypothesis needed) | true; the denominator is a unit (`vol` is an isomorphism, `b` a basis) |
| `IsExteriorStar.map_similitude` | scalar `g = t`; `ν = 0`; `g = −1` | general: `vol(L(⋀²g u)∧y) = ν² vol(Lu ∧ ⋀²g⁻¹y) = ν² det(g)⁻¹ vol(⋀²g Lu ∧ y)`; scalar `t ∈ F`: `ν = t²`, `det = t⁴`, factor `1`, both sides `t²L`; `ν = 0` forces `H = 0`, `L = 0`, `0 = 0`; `g = −1`: `ν = 1`, `det = 1`, `⋀²g = id` | true; factor is `ν²/det g`, not its conjugate (IP23 line 1267) |

README targets (one row per recomputed statement; the 75 targets were all read).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.2 Check, `Res_{ℚ(√2)/ℚ}𝔾_m`, level `K(3)` | `ε = 1+√2` mod 3 | `ε² ≡ −√2`, `ε⁴ ≡ −1`, order `8 = #𝔽₉^×`; units `≡ 1`: `⟨−ε⁴⟩`; `Sh` one point; `X_K` a circle, translation `8 log ε` | as stated |
| §0.3 degree formula and Check | `K(9) ⊂ K(3)` | `ε⁴ ≡ −1+3√2`, `ε⁸ ≡ 1+3√2`, `ε¹² ≡ −1 mod 9`, order `24`; `72/24 = 3` points; `[K(3):K(9)] = 9`; `(−ε⁴)³ ≡ 1`, effective degree `9/3 = 3`; `K₁(K₂∩Z(ℚ)⁻) = K₁(K₂∩Z(ℚ))` since `K₁` is open | as stated |
| §0.6 Hodge types | `d = 2`, weights `(2,2)` and `(2,4)` | `(2,0),(1,1),(1,1),(0,2)`; `(3,−1),(2,0),(0,2),(−1,3)` | as stated |
| §0.7 weight | — | `d + d − 2d = 0`; `V₁^∨ ≃ V₁(d)` | as stated |
| §1.1 volume, rescaling, rank 0 | `diag(1,2,1,−5)`, `d_U ↦ 2d_U`; `ℚ(t)`, `σ(t) = t²` | `−10 ↦ −10/4 = −5/2`; `vol = t⁻³`, `σ(vol) = t⁻⁶` | as stated |
| §1.4 Checks | `A = 1 + E₁₂`; alternating `A` with rows `(0,1,2,3)…` | `A⁻¹Aᵀ e₁ = e₂`, `e₂ ↦ −e₁+e₂`: `⋀²(e₁₃) = e₂₃`, `⋀²(e₂₃) = −e₁₃+e₂₃`; Pfaffian `6 − 10 + 12 = 8`, `det = 64` | as stated |
| §1.5 identities and negative control | general; `H = diag(i,1,1,1)` | `b(Lx,y) = iJ·vol(x∧y)`, symmetric; `σ(b(Lx,Ly)) = −J b(x,y)`; control: `−1` versus `+1` | as stated |
| §1.6 form and rescaling | `⟨x, yj⟩` versus `⟨x,y⟩j`; `d′ = αd` | both `jσ(b(x,y)) − σ(b(Lx,y))`; `j′² = J/N(α)`, `z = σ(α)⁻¹`, `N(z)J = J′` | as stated |
| §2.1 | `β = (1+2i)+j·i`, `α = 2−i`, `J = −3` | `Nrd = 5+3 = 8`, `ν = 8/5`, `det = 8/(3−4i) = 24/25 + 32i/25`; `L₁² e₁ = −a₁a₂ e₁` | as stated |
| §§2.3–2.4 | dimensions; image lies in fibre product | `5+5−1−1 = 8 = 7+2−1`; `N(Nrd(b₁)α₁⁻¹α₂) = Nrd(b₁)Nrd(b₂)` when multipliers agree | as stated |
| Layer 1–2 Examples | `diag(1,−J₁,1,−J₂)` | `L(e₁₂) = J₁e₃₄`, `L(e₃₄) = J₂e₁₂`, mixed images `e₂₄, J₁e₁₄, J₂e₂₃, J₁J₂e₁₃`; Gram on `W`: `1, −J₁, −J₂, J₁J₂` | as stated |
| §3.2–3.4 | centre `(z,z,N(z))`; `(2,0,0)`, `(0,0,2)`, `(1,0,0)`; `y = (1,1,i,i)` | `(N(z)²)³`; `(1,−1,1,−1)`, `(1,1,−1,−1)`, odd sum excluded; `(1,1,−1)`; both composites are the identity (`k₁+k₃ = l₁`, …; sum of image `= 2k₁`, even) | as stated |
| §3.5 | Levi `𝔰𝔬(2)⊕𝔰𝔬(2,2)`; `k = 2, 3` | `dim 𝔲∩𝔭 = 8 − 4 − 2 = 2`, `(R₊,R₋) = (1,1)`, `(1+t²)²`; lowest `K`-type `(k,0,0)`; dualized labels agree with MetaplecticAutomorphicForms §3.35 | as stated |
| §4.2 | `[x+a∂, x−a∂]`, `a = 1/2π`; `ι⁻¹(z₁²)` | `1/π = [2i∂_z, z/2πi]`; `(2πi)²(4x₁² − π⁻¹)φ₀` | as stated; IP23 line 2168 |
| §4.3 Check | wedge of `ω_{a5}∧ω_{b6}` with `ω^ε` | `1, −1, εi, εi`; sum `(z₁+εiz₂)²` | as stated |
| §4.4 | `e₁²` in signature `(2,2)` | contraction of `Q` is `4`; projection `e₁² − Q/4` | as stated |
| §4.6 | `ℓ = 1`, all coordinates negative | pairing gives `(−1)^ℓ(z₁+εiz₂)^ℓ`, Fock map `(−1)^ℓ`; product `+1` | as stated (see Source issues) |
| §5.2–5.3 | centre, kernel, `η_T∘j` | `[t²,1] = [t,t]`; kernel `([−1,1],1)`; `N((t₁t₂)⁻¹α) = (t₁t₂)⁻¹ ≠ 1`; `η(s⁻¹) = 1` | as stated |
| §6.3 | `s = 3/2` | `b/a = ζ_v(4)ζ_v(6)ζ_v(8)/(ζ_v(3)ζ_v(1)ζ_v(−1))`; global `ζ^S(1)` | as stated; IP23 lines 2720–2721, 2760 |
| §7.7 | `χ_v` of order two | `η_v|_{E_v¹} = χ_v² = 1`: rejected | as stated |
| §7.9 | weights | `k_v + 1` at `Σ`; `−k_v − 1` elsewhere | as stated |
| §7.10 Check for `d = 1` | `n = 2` | `2^n = 4`, not `2` | R03 |
| §8.1 | Asai factorisation; dihedral case | `As⁺ = Sym²σ ⊕ (ω_σξ_E) = Sym²σ ⊕ 1`; `χ|_{𝔸^×} = 1`, `χ^σ = χ⁻¹`, cuspidal iff `χ² ≠ 1` | as stated |
| §§8.6–8.7 | `(1,1)`, `(0,4)`, `(3,3)`; `k = 4` | `(k′, p+q+m−k′)`: `(k−1,k−1)`, `(0,2k)`, weight `2k+2`; after shift `(1,1)`, `(2−k,k+2)` | as stated |
| §9.1 | `θ̂²`; torus; dimensions | `ν·det g·det θ₄(g) = ν`; `(s₄⁻¹,…,s₁⁻¹; ν̂∏s_i)`; `34` versus `33`; agrees with EndoscopicTransferAndUnitaryTraceComparison §1.8 | as stated |
| §9.2 | `d = 1` | `⋀²(W₁⊕W₋₁)`: dimensions `1 + 4 + 1`, `4 = 1 + 3`; degrees `6, 4, 2` | as stated |
| §§9.3–9.4 | `v ∤ ℓ`; `log χ`; `Frob ↦ 1` | `𝒪_v^×` is finite times pro-`p`, no `ℚ_ℓ`-valued character; ramified, not de Rham; crystalline | as stated |
| §10.6 Checks | `(i)` over `ℚ(i)/ℚ`; `diag(x₁c₁, x₂c₂)` | average `(i + (−i))/2 = 0`; `x = (1,0)` gives `0` | as stated |

## Dependency check

```
depcheck: 235 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` shows only files under
`packages/HodgeClassesForJacquetLanglands/`.

## Verified sound

- **Declarations read:** 4 of 4 in `Suggested.lean` (1 definition, 3 theorems), each recomputed
  above. One `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only, one module docstring,
  namespace `TauCetiRoadmap.HodgeClassesForJacquetLanglands`. Elaborated types read from the worker's
  `signatures.md`: no binder lost; each agrees with README §§1.3, 1.4, 1.7 in generality (any field,
  any ring endomorphism `σ`, any sesquilinear `H`). The four names are the only backticked names of
  this roadmap in the README, and all four are declared.
- **Padding probe:** none of the three theorems follows from one tactic or one library lemma
  (`exteriorPower.instIsPerfPairWedgePairing` gives uniqueness only after `⋀²` of a semilinear map
  is built; Mathlib's `HodgeStar.lean` states the square identity in its documentation without
  proof; Tau Ceti's `Orientation.barHodgeStar_barHodgeStar` is the positive definite real case).
  No padding found.
- **Headline theorems:** IP23 Theorems 1, 3.2, 12.4 and Propositions 5.3, 5.6–5.7, 8.1–8.2, 9.5,
  10.1, 11.6, Remark 11.10. Statable at the pins and stated: 5.3 and the point-level content of 5.6.
  The rest are named in the module docstring with the missing carriers; no stand-in is used.
- **Targets read:** 75 of 75 (every line of the README, 2819 lines).
- **Checks tested:** 75 Check blocks read, each with at least three Checks; the numerical ones
  recomputed (table above); one inaccurate (R03).
- **Locators verified:** 68. IP23: the printed page of all 60 numbered statements cited (Remarks 2.2,
  3.1; Theorems 3.2, 12.4; Propositions 5.1–5.15, 8.1–8.2, 9.5, 10.1, 11.2–11.9, 12.2–12.3, A.1, A.14;
  Lemmas 6.1–6.2, 9.1–9.8, 10.2–10.8, 11.1, 11.3; Corollaries 6.3, 11.7; Definition 5.2;
  Example 5.14), and the text at IP23 lines 822, 840, 984–1033, 1168–1184, 1248–1293, 1715, 2168,
  2176–2184, 2345, 2720–2760, 3072–3128, 4133–4148, 4538–4564. FM06: Theorems 5.6–5.7 (p. 20), §6.2
  (p. 25), §5.2 (line 791, p. 18). Mil17: Lemma 5.13 and footnote 40 (p. 57), Theorem 5.26 and
  Remark 5.27 (p. 64), Theorem 5.28 (p. 65). Wal85: Lemma I.1 (p. 123), §I.2 (p. 124), §II.1 and its
  remark (pp. 147–148).
- **Sibling citations checked:** every cited section heading and every cited declaration name, at
  the open heads of MetaplecticAutomorphicForms (35 sections, 14 names), GL2AutomorphicRepresentationsAndTransfer
  (12 sections), ShimuraVarieties (11 sections, 7 names), ShimuraData (5, 2 names), AutomorphicBundles
  (6, 7 names), AutomorphicFormsOnReductiveGroups (6), AutomorphicSpectralTheory (3, 1 name),
  AutomorphicLFunctionsAndLocalFactors (1), MotivesAndAlgebraicCycles (6), PadicHodgeTheory (4),
  SelmerIwasawaCohomology (2), GeometryOfNumbersAndQuadraticArithmetic (1, 1 name),
  ArithmeticGaloisRepresentations (1, 1 name), EndoscopicTransferAndUnitaryTraceComparison (1); and on
  main of ArithmeticLocallySymmetricSpaces (5), ComplexKahlerGeometry (2), ClassFieldTheory (5 layers,
  7 names), GlobalNumberFields (6 layers, 5 names), ReductiveGroups (2), ReductiveGroupsPartII (2),
  RepresentationTheory (2), EtaleCohomologyFoundations (4), ComplexComparisonPartII (1),
  AlgebraicTopology (2), PadicPeriodRings (1), AdelicAlgebraicGroups (2), OrthogonalSpinGroups. All
  exist. The contents were read, and agree with what the README says of them, for
  MetaplecticAutomorphicForms §§3.4, 3.23, 3.24, 3.28, 3.32a–3.36, 5.6, 6.13–6.15, GL2 §§R16.1.8,
  R16.4.5, R16.6.3, R17.3.1, R17.3.5–R17.3.8, R17.4.2, R17.4.13, R17.4.16, ShimuraVarieties §§1.3, 8.3,
  8.5, ShimuraData §§3.10, 4.9, AutomorphicBundles §0.1, AutomorphicFormsOnReductiveGroups §5.4,
  MotivesAndAlgebraicCycles §7.15, PadicHodgeTheory §§3.1, 3.3, 7.2, SelmerIwasawaCohomology §4.9,
  AutomorphicSpectralTheory §4.7, AutomorphicLFunctionsAndLocalFactors §AL.3.6.3 and
  EndoscopicTransferAndUnitaryTraceComparison §1.8. The 8 leads of the worker's `citations.md` are
  names of ShimuraVarieties and of this roadmap; each was found at its owner.
- **Pinned declarations checked (20):** Mathlib `exteriorPower.wedgePairing`, `pairingDual`,
  `pairingDual_ιMulti_ιMulti`, `instIsPerfPairWedgePairing`, `hodgeStar`, `isUnit_apply_topVector`,
  `Module.Basis.topVector`, `LinearMap.BilinForm.exteriorPower`, `MvPolynomial.funext`,
  `groupCohomology.H1ofAutOnUnitsUnique`; Tau Ceti `LinearMap.map_exteriorPower_finrank_eq_det_smul`,
  `Module.Basis.exteriorPowerTopEquiv`, `TauCeti.QuaternionAlgebra.normMulEquiv`, `rescaleJEquiv`,
  `tensorAlgEquivTensorMatrix`, `TauCeti.BrauerGroup.quaternionClass_mul`, `TauCeti.symPowerRep`,
  `Orientation.barHodgeStar`, `barHodgeStar_barHodgeStar`, `TauCeti.Hodge.HodgeStructureOn` with
  `tateTwist` and `internalHom`. The claim that `L` is the inverse of `exteriorPower.hodgeStar` for
  `σ = id` was checked against the definition at the pin (`B^{(l)}(⋆x, y) = vol(x∧y)`).
- **Gaps:** the 8 slugs of `design/plan.json` are the 8 stated under "Exact supplier contracts", each
  with a named supplier and section that exists. Six are not raised; two are R01 and R02.
- **Ownership:** no other roadmap on main or open states the operator `L`, the exceptional maps, the
  restriction formulas, the theta class or the end theorems (searched by object: Matsushima for
  `K_h`, quaternion embedding criterion, order-two Brauer classes, ramification classification). The
  worker's `overlaps.md` lists no shared roadmap, no second copy and no dropped id; the closest
  roadmap, MetaplecticAutomorphicForms, is cited for everything it owns. No declaration of
  `Suggested.lean` has the fully qualified name of a declaration of a roadmap read.
- **Policy:** no pull-request number, process narrative, `lemma` declaration, `set_option` or
  algorithm in the README or the Lean file; every target has a locator.

## Not verifiable

- No Lean elaboration was run in this pass; the elaborated types are those the worker recorded.
- The statements the README takes from sources not in the cache (Vogan–Zuckerman, Bloch–Kato,
  Yamana's theorems on degenerate principal series used inside IP23 Lemma 9.7) are cited only
  through IP23 or a supplier roadmap and were not opened.
- FM06, §6.2: the constant `2^{q/2}(−i/4π)^{q+ℓ}` was not located character by character in the
  extraction (the display is broken across lines); the factor `2^{nq/2}` relative to Kudla–Millson
  was read at FM06 line 791.
- Mil17 and Wal85 were checked at their locators' pages only; the mathematical content of Wal85
  §II.1 behind gap:quaternionic-rational-model was not re-derived.
- Ownership was checked against the roadmaps on main and the open heads reachable through the
  `roadmaps` tool; the suppliers named above that are not among the 229 listed checkouts were read
  through `roadmaps show`.

Source independence: 16 passages compared with 2 sources (IP23 13, FM06 3), none shared beyond formulas and hypothesis lists the mathematics forces; largest share IP23, 104 of 119 locators; contents compared with IP23: not one to one (Layer 0 ↔ §§2–3, Layers 1–2 ↔ §5, Layer 3 ↔ §§6–7, Layer 4 ↔ §8, Layer 5 ↔ §4 moved after §8, Layer 6 ↔ §9, Layer 7 ↔ §10, Layers 8–9 ↔ §11, Layer 10 ↔ §12), the order of Layers 6–10 forced by their Dependencies lines (each needs all earlier layers); Mil17 and Wal85 read at the cited pages only.

## Source issues

- **Misprint** in IP23 at §3.2, printed page 19 (line 822): the source says the isotypic component is concentrated in degree `2d`; it should be degree `d`, the dimension of the quaternionic Shimura variety; affects nothing.
- **Error** in IP23 at Proposition 8.2, printed page 55 (line 2345): the source says the compact contraction carries a factor `(−1)^ℓ`; it should have no sign, since the negative definite pairing and the negative-coordinate Fock rule (8.2) each contribute `(−1)^ℓ`; affects nothing (the application has `ℓ` even).
- **Gap** in IP23 at the proof of Theorem 12.4, printed page 99 (lines 4559–4560): the source says the Galois group acts trivially on the components of the exterior Shimura variety, without proof; it should restrict the component class to the Galois-invariant subspace; affects the proof.
- **Gap** in IP23 at §4.3, printed page 24 (lines 1029–1031): the source says a character of the norm-one idele classes of `E` is evaluated at `(t₁t₂)⁻¹α`, which need not have norm one; it should use a character of the idele classes of `E` trivial on those of `F`; affects nothing.
- **Gap** in IP23 at §10.2, printed page 66, with Proposition A.14, printed page 113: the source says the Weil representations have the Appendix A compatibilities assuming only `Σ ≠ Σ_∞`, while A.14 assumes a real place split in both algebras; it should treat `Σ = ∅` separately; affects the proof.

## For the human reviewers

- **Scope.** The roadmap plans the main theorem of one refereed article, IP23 (Forum of Mathematics, Pi, 2023), which supplies 104 of the 119 source locators in `packages/HodgeClassesForJacquetLanglands/README.md`; the layer order follows the article's sections except Layer 5.
- **Scope.** The all-`ℓ` end theorem (§10.8) is conditional on a hypothesis the roadmap does not prove (the degree-`2d` case of Kottwitz's conjecture, §9.2), as in IP23, Theorem 3.2(ii).
- **Not tested.** Mil17 and Wal85 were opened only at the cited pages; their tables of contents were not compared with the README (7 and 5 locators).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "14accbdb5bf4296b975b63aef1a82dc9057f2b9b", "job": "RT-HodgeClassesForJacquetLanglands~1a", "model": "fable", "worker": "chris-x88"} -->
