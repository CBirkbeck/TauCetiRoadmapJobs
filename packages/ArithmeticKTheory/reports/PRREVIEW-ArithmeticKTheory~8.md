# Review of ArithmeticKTheory (pull request #1418 at a58ed88)

**Verdict:** needs changes

This is a full re-review: 751 lines of the folder changed since e627510. The previous review's R02 (§8.8 tables) and R03 (docstring) are repaired. Its R01 is superseded. That block was deleted in one commit and restored in the next as part of a new block in §7.5, which now plans the suspension homomorphisms, the stable stems, Freudenthal on spheres, composition products, η⁴=0 and π₄ˢ=0. That is R01 below, and it is blocking. K₄(ℤ), the only target here that consumes the block, needs only the odd-primary part π₄(S)⊗ℤ[1/2]=0.

The gate passes and the dependency check reports 0 problems. `Suggested.lean` elaborates with exactly four `sorry` warnings. All fifteen seeded targets were checked against their sources, and the adversarial table is below.

## R01 (P2) — §7.5 re-plans HomotopySpheres' stable stems and fourth stem, which no target here needs

**Location.**
- `TauCetiRoadmap/ArithmeticKTheory/README.md` lines 71–80: “Section 7.5 owns the suspension homomorphisms on the homotopy groups of spheres, the stable stems as their sequential colimit with its composition products, the Freudenthal stable range on spheres …”.
- The block at lines 4001–4217.
- `Suggested.lean` lines 91–99, `subsingleton_homotopyGroup_sphere_add_four`.

**Claim.** Arithmetic K-theory owns these objects because §7.5 uses the fourth stem for K₄(ℤ).

**Witness: two owners.**
- At the HomotopySpheres head (#1287), README line 916, §3A.3, defines the suspension homomorphisms, the stable stem as their sequential colimit in `AddCommGrpCat`, composition products and graded commutativity. Its §3A.4 owns the sphere Freudenthal range, and its §9.2 states the same headline, `sphere_homotopyGroup_fourthStem` (its `Suggested.lean` line 177).
- On main, GeneralizedCohomology line 37 assigns stable sphere stems and Freudenthal to HomotopySpheres and says G2 “does not create a second … stable-stem owner”. Its line 395 adds “No new private stable-stem type is retained”.
- AlgebraicTopology line 132 also places stable homotopy with HomotopySpheres.
- `stableStemSphereSpectrumIso` (README lines 4069–4078) is proved through G2.5's identification of π_kS. G2.5 identifies π_kS with the stabilized sphere colimit of HomotopySpheres, not with the colimit built here, so the route needs an unowned comparison of the two colimits.
- If the 2-primary assembly stays, “η … is detected by α₁” (line 4166) is EllipticCohomology §E4.S item 1 (main, line 920).

**Witness: no target here needs the block.** k4_int_eq_zero (lines 4238–4247) uses only that the unit S[1/2]→K(ℤ)[1/2] is 4-connected. So K₄(ℤ)⊗ℤ[1/2] is a quotient of π₄(S)⊗ℤ[1/2]. The 2-part is handled separately by §6.4 (2-rank s+u−1=0). None of the following is used by any target of this roadmap:
- the stable-stem colimit and its composition product;
- the comparison isomorphism;
- the Freudenthal range;
- the unstable form;
- η⁴=0, π₄(S_(2))=0 and the d₃.

The brief's never-cite rule forbids citing HomotopySpheres. That makes this material a duplication to remove, not one to keep.

**Repair.** Own only the odd-primary vanishing.

README:
- Replace lines 71–80 with: “Section 7.5 owns the vanishing of π₄(S)⊗ℤ[1/2] for the sphere spectrum, which it uses for K₄(ℤ), and the low Adams–Novikov E₂-term of the sphere that proves it. It computes them with the Adams–Novikov spectral sequence of BordismFormalGroups F3–F4.”
- Delete the sphere supplier paragraphs at lines 208–219, 277–287, 297–302 and 558–569.
- Reduce lines 503–511 to G2.5/G2.7's transport of the Hurewicz theorem and G3 item 9's `spectrumPrimeLocalization`.
- Delete lines 4001–4097: sphereSuspensionHom, stableStem, compProduct, stableStemSphereSpectrumIso and their Checks.
- Replace lines 4098–4111 with “Prove sphereStemFour_odd: π₄(S_(p))=0 for every odd prime p, hence π₄(S)⊗ℤ[1/2]=0 (Ravenel, Theorem 4.4.1, Proposition 4.4.2 and Theorem A2.1.27)”.
- In sphereAdamsNovikovLowE2 keep the structure formulas, sparseness, the zero line, E₂^(1,2)=ℤ/2·α₁ and the stem-one clause. K3BlochGroups §4.9 consumes these. Delete the following:
  - “E₂^(2,6)=0; and E₂^(4,8)=ℤ/2 …” from the item at lines 4132–4133;
  - the (4,8) and (2,6) computations, from “In bidegree (4,8)” at line 4136 to “every cocycle bounds” at line 4142;
  - the stem-four clause at lines 4147–4148.
- Replace lines 4151–4185 with the odd-prime assembly (lines 4162–4164) followed by G3 item 9.
- Delete the Checks at lines 4193–4206 and 4210–4217.
- At line 4240, read “Since π₄(S)⊗ℤ[1/2]=0 by sphereStemFour_odd”.
- Trim the matching items at lines 4259–4266, 4300–4315 and 4444–4448, and delete the Hatcher reference (lines 5137–5142).

`Suggested.lean`:
- Delete lines 91–99 and the stable-stem clauses at lines 13–14 and 37–43.
- In the docstring, say that the odd-primary vanishing lacks homotopy groups of spectra and BP_*BP.
- Restore the Layer 7 heading at line 79.

Note for K3BlochGroups (#1430): its README lines 111 and 1367 read π₄S=0 and the d₃ from this section, in a Check only. That pull request has to repoint them, for example to Ravenel, the paragraph before Theorem 4.4.47.

**Tested on the refuting instance.**
- p=3: in stem 4 the only bidegree with s≥1 allowed by t≥4s is (1,5), and 4∤5. E₂^(0,4)=0 because d(v₁)=3[t₁]≠0, so π₄(S_(3))=0.
- p≥5: s(2p−3)≤4 forces s=0, so π₄(S_(p))=0.
- Hence K₄(ℤ)[1/2] is a quotient of 0, K₄(ℤ){2}=0 by §6.4, and k4_int_eq_zero is unchanged.

## R02 (P3) — names attributed to StableHomotopyKTheory §7.1 that it does not declare

**Location.** `README.md` lines 297–301: “Section 7.1 also supplies the Moore triangle … of `moore`, with first map m and boundary `moore.bockstein`; … `sphere_firstStems` … `mooreTwo_piTwo`”. The same names recur at lines 4095, 4155–4158 and 4311–4312.

**Claim.** These are StableHomotopyKTheory's declarations.

**Witness.** At #1227, the StableHomotopyKTheory README §7.1 states the content in prose: the triangle, η, π₁S=ℤ/2, π₂S=ℤ/2 and π₂(S/2)=ℤ/4. Neither its README nor its `Suggested.lean` contains any of the four names. The roadmap search over main and all 476 open heads finds them only in this README.

**Repair.**
- If R01 is applied, these lines go with it.
- Otherwise drop the backticks and write “StableHomotopyKTheory §7.1's Moore triangle, stable Hopf class η, first stems π₁S and π₂S, and π₂(S/2)=ℤ/4 with twice a lift of η equal to the image of η²”.

## R03 (P3) — Downstream consumers omit what K3BlochGroups takes from §7.5 and §8.10

**Location.** `README.md` lines 5085–5087: “K3BlochGroups is a downstream consumer of the degree-three rank and arithmetic torsion of Layers 3–5.”

**Witness.** At #1430, K3BlochGroups also consumes:
- §7.5's sphereAdamsNovikovLowE2: its README lines 111, 1356, 1369 and 1765;
- §8.10: its line 13.

The sentence that recorded the §7.5 consumption was deleted in the previous repair round and was not restored when the block returned.

**Repair.** Add after line 5087: “Its §4.9 consumes §7.5's sphereAdamsNovikovLowE2 at p=2 (sparseness, the zero line and E₂^(1,2)=ℤ/2·α₁), and its degree-three examples consume §8.10.”

## R04 (P3) — §6.6's Caputo control needs wild-kernel vanishing it does not state, and makes a class-group computation a target

**Location.**
- `README.md` lines 2648–2657: “they prove div K₂(F){3}=0. … The tame version of Moore's sequence gives K₂(O_F){3}≃ker(ℤ/9→ℤ/3)≃ℤ/3.”
- Lines 2669–2677: “Prove the sextic arithmetic description: F contains μ₃, has Pic(O_F[1/3]){3}≃ℤ/3 …”.

**Witness 1.** The tame Moore sequence (wildkernel Corollary 0.4, line 71) gives K₂(O_F){3}/WK₂(F){3}≅ker(μ₉→μ₃)=ℤ/3. To conclude K₂(O_F){3}≅ℤ/3, the step needs WK₂(F){3}=0. That is what Caputo actually proves (Proposition 4, caputo line 828, p. 16: the étale wild kernel's p-part is trivial), and it is stronger than the div statement quoted.

**Witness 2.** The class-group equality is unrouted. F has |Δ|=3·549⁴ (conductor–discriminant formula), so its Minkowski bound (4/π)³·6!/6⁶·√|Δ| is about 1.66×10⁴. Caputo obtains the value by machine computation (Example 2, caputo lines 856–859, p. 17). As a target this is a large computation, which the house rules exclude.

**Repair.**
- Replace “they prove div K₂(F){3}=0” with “Proposition 4 proves that the 3-part of the étale wild kernel WK^ét₂(F) vanishes, hence WK₂(F){3}=0 and div K₂(F){3}=0 (Remark 11(ii), p. 17)”.
- Replace the target sentences at lines 2669–2677 with a Check: “Caputo, Example 2, p. 17, gives (Cl^S_F)₃≅ℤ/3, one totally ramified prime over 3, and F(μ₉)/F nontrivial and split there.” Keep the order-10 computation, F_v=ℚ₃(μ₉) and the μ₂₇ degree argument as Check content.
- Delete “the sextic arithmetic description is a separate target of this subsection” from the *Needs:* line 2709.

**Tested.** With WK₂{3}=0, K₂(O_F){3}=ℤ/3 has exponent 3. Caputo Theorem 1 at i=n=1 gives a coefficient kernel ℤ/3, while div is 0, so the control still separates an annihilator from a stabilization modulus.

## R05 (P3) — §2.4 asserts odd-degree surjectivity in degree one

**Location.** `README.md` lines 976–977: “Odd-degree surjectivity comes from the next residue group being zero”.

**Witness.** At n=1 the next residue group is ⊕K₀(k(v))=⊕ℤ≠0, and K₁(ℤ)={±1}→K₁(ℚ)=ℚ^× is not onto. K-book (V.6.6), p. 409.

**Repair.** Read “For odd n≥3, surjectivity of K_n(R)→K_n(K) comes from the vanishing of K_(n−1)(k(v))”.

**Tested.**
- n=3: K₃(ℤ)=ℤ/48→K₃(ℚ)=ℤ/48 is onto (§8.10).
- n=1 is excluded.

## R06 (P3) — Ravenel and Hatcher are cited but not recorded in the manifest

**Location.** README References, lines 5124–5142 (Ravenel; Hatcher). Locators are at lines 4029, 4066, 4108–4110, 4194 and 4200.

**Witness.** `packages/ArithmeticKTheory/sources.toml` has 30 keys and none for either book. It has no entry for `mybooks/ravenel.pdf` or `hatcher/AT/AT.pdf`.

**Repair.** Record `ravenel`, the author's posted copy, `licence_class = "author-page"`, with locators Theorem A2.1.27, Theorem 4.4.1, Proposition 4.4.2 and Theorem 4.4.47, cited for §7.5. If any Hatcher citation survives R01, record `hatcher` the same way.

**Tested.** Both copies are legal author pages. They were fetched through the sources service into the review's scratch manifest only, and every locator checks (see Verified sound).

## Verified sound

### The previous review's findings

- **R01, the Adams–Novikov block.** Partly repaired, then superseded.
  - The block was deleted (1e449eaf) and restored with more around it (a58ed88).
  - Corollary 4.3.15 is now marked “modulo I₁” (line 5129). ✓
  - `ravenel` is still not in the manifest (R06).
  - The p=3 Check at line 4189 still does not cite EllipticCohomology §E4.S item 4 (main, line 954).
  - The ownership question is now R01.
- **R02, the §8.8 certificate tables.** Repaired.
  - Lines 4931–4948 read “For each of the eleven primes v of norm q≤33 listed below, prove … β̄:U/U₁→k(v)× is an isomorphism”, with the lattice-index theorem.
  - The norm-4 Check is kept (lines 4970–4978).
  - §8.9 reads “the finite residue steps are proved in §8.8 and the sign calculation in §8.9” (lines 5018–5019).
- **R03, the module docstring.** Repaired. `Suggested.lean` lines 28–32 name solomonTits, projectiveArithmeticDuality, projectiveSteinbergHomology_fg and curveSteinbergHomology_fg and say what they lack. All four names occur in README §3.2 (lines 1076, 1151, 1153 and 1231).

### Gate, dependency check, Lean

- **Gate**, rerun at this head: `gate ArithmeticKTheory: set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate file adds `build=0`.
- **Outside-folder diff:** empty.
- **Dependency check:** `depcheck: 243 roadmaps, 2457 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Never-cite list:** none of the never-cite roadmaps occurs in the README or `Suggested.lean`, HomotopySpheres included.
- **Elaboration:** `lake env lean Suggested.lean` runs in 6 s with exactly four `declaration uses 'sorry'` warnings, at lines 66, 72, 85 and 95.
- **`#check @name`** for all five declarations, run on a scratch copy, matches `signatures.md` and the README:
  - `sUnitSubmonoid` and the §1.1 theorems carry `[IsDedekindDomain R]`, `[IsFractionRing R F]` and an arbitrary S;
  - `regularPrime_dividedBernoulli_num` carries `Nat.Prime p`, `Odd p`, the class-number hypothesis and `1 ≤ k`;
  - the sphere theorem carries `finrank ℝ E = n+1`, `6 ≤ n`, `[Finite N]` and `Nat.card N = n+4`.
  - No binder is lost, and nothing changed.
- **One-tactic probes** (`first | simp | rfl | infer_instance | aesop | simp_all | exact …`) on a scratch copy close none of the four theorems. Neither pin has an S-integer localization criterion, a regular-prime Bernoulli statement or π_(n+4)(Sⁿ). Tau Ceti stops at `subsingleton_homotopyGroup_sphere_of_lt` and `homotopyGroupSphereAddEquiv`.

### Headline theorems

- **Stated:**
  - `integer_isLocalization_iff` and `integer_isLocalization_of_torsion_classGroup` (§1.1);
  - `regularPrime_dividedBernoulli_num` (§7.2);
  - `subsingleton_homotopyGroup_sphere_add_four`, whose ownership is R01.
- **Named in the docstring as not statable, with the missing carrier:**
  - Quillen finite generation and ranks;
  - Borel's comparison (no relative Lie algebra cohomology);
  - the §3.2 Steinberg theorems (no Tits building);
  - hermitian finiteness (no GW/L spectra);
  - the odd and even tables, wild kernels and Bott descent;
  - K₄(ℤ)=0, H₃(K(ℤ)), the order ratio and the Vandiver table;
  - the Gaussian and golden tame kernels.

  The pins have no Milnor K₂ or tame symbol (searched by object), so the tame kernels would need an ad hoc encoding.
- **Padding:** none.

### Adversarial pass

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| `integer_isLocalization_iff` | R a field; ℤ with S={(2)} and M=⟨2⟩, {1}, ⟨6⟩; 0∈M; S=Spec¹ | Field: S=∅ and every M of nonzero elements works; both sides true. ⟨2⟩: ℤ[1/2], and 2 meets (2); true and true. {1}: ℤ≠ℤ[1/2]; false and false. ⟨6⟩: 6 is not a unit of ℤ[1/2]; false and false. 0∈M: 0 is not a unit; false and false. S=Spec¹: integer=K and the monoid is R∖0. | Pass |
| `…of_torsion_classGroup` | ℤ[√−5], 𝔭=(2,1+√−5); non-torsion control | 𝔭²=(2), and 2 is an S-unit meeting 𝔭. ⇐ of the iff: the primes meeting M are exactly S, so M⁻¹R=⋂_(v∉S)R_v=O_S. | Pass |
| §1.2 | ℤ→ℤ[1/2]→ℤ[1/6]; ℤ[i,1/2] over ℤ[1/2]; an upstairs prime over 5 | (1/2)(1/3)=1/6. Basis 1,i. 1/(2+i)=(2−i)/5 is not integral over ℤ. | Pass |
| §2.4 | n=4, 3, 1 over ℤ | K₄(𝔽_p)=0 gives injectivity. n=3: K₂(𝔽_p)=0, so K₃(ℤ)↠K₃(ℚ). n=1: ⊕K₀(k(v))=⊕ℤ, and {±1}→ℚ^× is not onto. | R05 |
| §3.1 | Q₀; dim V=1; V=𝔽₂²; (0,V) added | Q₀ is terminal. dim 1: (0,0) and (V,V), incomparable. 𝔽₂²: 12 pairs minus (0,V) gives 11 = 2+3·3. With (0,V), every layer is ≤ it. | Pass |
| §3.5 | R=ℤ; Hℤ with trivial and sign C₂; m=0, 1 | L^s(ℤ)=ℤ,ℤ/2,0,Pic/2=0; L^q(ℤ)=ℤ,0,ℤ/2,0. Trivial action: H₀..₂=ℤ,ℤ/2,0. Sign action: ℤ/2,0,ℤ/2. Ranges n≤2m−2 and n≥2m−1 give n≤−2 and n≥−1 at m=0, n≤0 and n≥1 at m=1. Golden ⟨1⟩,⟨ε⟩: det((1,1),(1,−1))=−2. | Pass |
| §5.4 | KO mod 2; w=24, r=1; D₈; ℚ at n=3 and 5 | Orders 2,2,4,2,2,1,1,1 from UCT. The diagonal extension is ℤ/48. In D₈, (as)²=a·sas=1, so it splits and the abelian hypothesis is needed. K₃(ℚ)=ℤ/48; K₅(ℚ)=ℤ⊕ℤ/(w₃/2)=ℤ. | Pass |
| §6.2 | ℚ; ℚ(√7)[1/2] and [1/14]; ℚ(√34)[1/2] | ℚ: j=0, while étale H¹(ℤ,ℤ/2)=0 would give 1. ℚ(√7): 8±3√7>0 and 3±√7>0, so the image is the diagonal and j=1; √7 has signs (+,−), so j=0. ℚ(√34): N(5+√34)=−9, (5+√34)=𝔭₃² with signs (+,−); 6+√34 (norm 2) and 35+6√34 are (+,+); j=0. u−t: Pic⁺ has order 2 and Pic order 1 for ℚ(√7), so 1. | Pass |
| §6.6 | ℤ/4 with T=2A; ℤ/2^r; the 2-group x,yₙ; Caputo's field | T∩2A=T≠0=div. T∩2^νA=T for ν<r and 0 at ν=r. x↦1/2 and yₙ↦1/2^(n+1) respect 2ⁿyₙ=x. 3⁵≡−1 mod 61, so 3 has order 10. The tame quotient is ker(μ₉→μ₃)=ℤ/3, which needs WK₂{3}=0. Minkowski bound ≈1.66×10⁴. | R04 |
| §6.8 | ℚ, i=1, at ℓ=2 and ℓ=3 | ℓ=2: K⁺₂(ℤ){2}=0, \|D₁(ℚ₂){2}\|=2, \|D₁(ℚ){2}\|=2, so \|WK{2}\|·2=1·2. ℓ=3: all terms 1. Both give WK₂(ℚ)=0. | Pass |
| §6.9 | i mod 4, ℓ=2 | i odd: H²(C₂,ℤ₂)=ℤ/2 per real place. i even: the sign module gives continuous H²=0 but finite level ℤ/2. i≡3: K{2}↪H² with cokernel (ℤ/2)^(r₁), so WK≅Sha². i≡2: kernel of order 2^ρ. | Pass |
| `regularPrime_dividedBernoulli_num` | (5,1), (5,3), (5,5), (5,7), (5,63), (3,1); (37,16) and k=0 as controls | B₂/2=1/12≡3 and B₆/6=1/252≡3 mod 5; B₁₀/5=1/66; B₁₄/14=1/12, although 5\|15; B₁₂₆/63≡2·3=1. B₂/1=1/6 with v₃=−1. B₃₂ has numerator −37·208360028141 (p=37 is irregular). At k=0 the numerator of 0 is divisible. p=2 would also hold by von Staudt. | Pass |
| sphereAdamsNovikovLowE2 | p=2: (1,2), (2,6), (4,8); p=3, 5 in stem 4 | C^(1,2)=⟨[t₁]⟩ and d v₁=2[t₁], giving ℤ/2. C^(2,6) has rank 3; d=(2,2,−2)g; the cocycles c=a+b are hit by d[t₁³]=−3(e₂+e₃) and d[t₂]=e₁−e₂. C^(4,8)=⟨[t₁]⁴⟩ with coboundaries ±2. p=3: (1,5), 4∤5. p=5: 7s≤4 gives s=0. | Pass |
| η⁴=0 and its assembly | Moore action | i(η³)=(2ῆ)η=ῆ(2η)=0, so η³∈2π₃S and η⁴=x(2η)=0. η³=12ν=2·6ν, consistent with Hatcher p. 385. d_r into (4,8) with r odd and 4−r≥0 forces r=3. | Pass (math); ownership R01 |
| Stable-stem Checks | π₃(S²)→π₄(S³); f∘η₂ with deg f=2; n+k≤2n−2 | ℤ↠ℤ/2 (m=3=2n−1). H(f∘η₂)=4 against 2. n≥k+2. | Pass (math); ownership R01 |
| `subsingleton_homotopyGroup_sphere_add_four` | n=6, 5, 3, 4; ℓ^∞ norm on ℝ⁷ | Hatcher p. 339: π₁₀(S⁶)=0; π₉(S⁵)=ℤ/2, π₇(S³)=ℤ/2, π₈(S⁴)=ℤ/2². sphereHomeomorphOfFinrankEq covers any norm, and finrank 7 gives FiniteDimensional. | True; R01 |
| k4_int_eq_zero | odd part against 2-part | The cofiber of S[1/2]→K(ℤ)[1/2] has H̃_(≤4)=0, so π₄ is onto and only π₄S⊗ℤ[1/2] is needed. 2-rank s+u−1=1+0−1=0. | Pass; R01 |
| integerEvenKOrder | a=0, 2 | c₁=num(1/24)=1, so K₂=ℤ/2. c₆=num(B₁₂/24)=691=\|K₂₂(ℤ)\|. | Pass |
| §8.2 | p=2, 3; K₂(ℚ) | K₂(ℤ[1/2])=ℤ/2; K₂(ℤ[1/3])=ℤ/2⊕ℤ/2; K₄(ℤ[1/2])=ℤ/3. Residues at 2, 3, 5 have orders 1, 2, 4. | Pass |
| §8.6 | ℚ at (5), a=2; golden (2,2) at q=4; real n | (2,1) is in the lattice and (1,1) is not. (4+4)/2=4≤4 with residues 0. Volume of the radius-√n·t^(1/n) ball is (πn)^(n/2)t/Γ(n/2+1), equal to 2ⁿ√Δ·t/d_F. | Pass |
| §8.7 | the four golden bounds | 16d²=320/π²≈32.4; (20d)^(2/3)≈9.33; d³≈2.88; (2d)^(12/5)≈12.3. These equal Groenewegen's c_F terms (line 509, p. 1454) at ρ=1, n=2, d̃=√5. | Pass |
| §8.8 | q=4 relations; q=5 | ε³=2ε+1; all four relation identities hold; minors 6 and −3 give gcd 3. ε⁶−1=8ε+4=2·2ε³. At q=5, X²−X−1≡(X−3)², and 3 has order 4. | Pass |
| §8.10 | ℤ[i], ℤ | ℤ⊕ℤ/24 (r₂=1, w₂=24); ℤ/48. | Pass |
| §4.2–4.4 | ℓ=3 at i=6; ℚ(√−2); w₁₀(ℚ) | 3^(1+1)=9. a=3 and 2^(3+1−1)=8, matching the image ⟨3⟩ where 3²−1=8. w₁₀(ℚ)=8·3·11=264. | Pass |

### Sources opened (seeded sample)

| Target | Locator, cache line | Result |
| --- | --- | --- |
| 1.1 | kbook Ex. I.3.8 line 1742 (p. 29); I.3.5 line 1281 (p. 20, §I.3 pp. 18–30); VI.8.2 line 31296 (p. 513) | ✓ |
| 1.2 | kbook V.6.1 line 24317 (p. 406); V.6.6.3 line 24609 (p. 410) | ✓ |
| 2.4 | kbook (V.6.6) line 24544 (p. 409); V.6.8 line 24726 (p. 412) | ✓, with R05 |
| 3.1 | kahn §4.1 line 640 (p. 15); Def. 2.3.2 line 409 (p. 10); 4.2.4 and 4.2.6 lines 674–698 (p. 16); 4.3.2 line 719 (p. 17); kbook IV.6.8–6.9 lines 19050–19064 (p. 325); sun line 155 (p. 5) | ✓ |
| 3.5 | hermitian 2.3.1–2.3.2 lines 1881–1916 (pp. 41–42); 1.2.12 line 811 (p. 18); 1.3.9 line 1380 (p. 30); 2.3.18–2.3.19 lines 2250–2264 (p. 48); Cor. 8 line 214 (p. 5) | ✓; the README's “I finite” is automatic |
| 5.4 | kbook VI.3.1 line 28762 (p. 475); VI.9.4–9.5 lines 31663–31717 (p. 519); rognes-weibel 6.7 line 1650 (p. 32), proof line 1713 (p. 33), 6.9 line 1741 (pp. 33–34) | ✓ |
| 6.2 | kbook Def. 9.6.1 and (9.6.2) lines 31768–31789 (pp. 520–521) | ✓ |
| 6.6 | caputo Prop. 2 line 203 (p. 4); Thm 1 line 588 (pp. 12–14); Prop. 4 line 823 (p. 16); Ex. 2 line 847 (p. 17); wildkernel Cor. 4.6 line 402 (p. 13); banaszak (56)–(60) lines 768–780 (p. 17); Rem. 6.1 and Thm 6.4 lines 1409–1450 (p. 31); kbook V.6.8.2 line 24796 (p. 413) | ✓, with R04 |
| 6.8 | wildkernel Lemma 0.3 and Cor. 0.4 lines 58–72 (pp. 2–3); kbook VI.7.3–7.4 (p. 509) | ✓ |
| 6.9 | wildkernel (0.5)–(0.6) lines 89–96 (p. 3) | ✓ |
| 7.2 | sharifi Prop. 5.2.5 line 4230 (p. 134); Rem. 5.2.8–5.2.9 lines 4262–4267 (pp. 135–136); Cor. 4.4.4–4.4.5 line 3545 (p. 113); kbook VI.2.4.1 line 28561 (p. 472) | ✓ |
| 7.5 | ravenel (scratch fetch) 4.4.1–4.4.2 lines 6667–6681 (p. 130); 4.4.37 line 7270 (p. 143); Fig. 4.4.45 line 7320 (p. 144); 4.4.47 line 7390 (p. 145); A2.1.27 line 18302 (p. 350). hatcher (scratch fetch) Cor. 4.24 line 15686 (p. 360); table lines 14780–14790 (p. 339); Prop. 4.56 and η³=12ν lines 16741–16751 (p. 385); p. 387 line 16792; proof of 4.56 line 16817 (p. 388). kbook VI.10.1 line 32187 (p. 527); VI.10.9 line 32579 (p. 533); VI.10.1.3 line 32284 (p. 528); rognes-weibel Thm 7.11 line 2283 | ✓ |
| 8.2 | kbook III.6.5.1 line 13575 (p. 236); VI.2.1.2 line 28417 (p. 470); VI.8.1 line 31271 (p. 513); VI.8.3 line 31348 (p. 514) | ✓ |
| 8.7 | groenewegen Lemma 4 line 167 (p. 1446); Lemma 9 and Prop. 10 lines 333–348 (p. 1450); Prop. 13 line 484 (p. 1453); Thm 14 line 513 (PDF p. 12, journal p. 1454) | ✓ |
| 8.10 | kbook VI.2.4 line 28557 (p. 472); Ex. VI.8.5 line 31530 (p. 516); VI.9.5 (p. 519) | ✓ |

### Library declarations opened at the pins

- **Mathlib:**
  - `Topology/Category/TopCat/Sphere.lean:37` `TopCat.sphere`, which is `diskBoundary (n+1)` (a ULift of the Euclidean unit sphere);
  - `Topology/Homotopy/HomotopyGroup.lean:460` `HomotopyGroup.Pi`, `:550` `group` (needs `[DecidableEq N] [Nonempty N]`) and `:606` `commGroup` (needs `[Nontrivial N]`);
  - `Topology/Homeomorph/Lemmas.lean:273` `Homeomorph.ulift`;
  - `Analysis/Normed/Module/Connected.lean:204` `isPathConnected_sphere` (needs `1 < Module.rank ℝ E`);
  - `Algebra/Category/Grp/FilteredColimits.lean:213` and `CategoryTheory/Limits/Types/Filtered.lean:137` `isColimit_eq_iff`.
- **Tau Ceti:**
  - `Topology/Homotopy/HomotopyGroup/Map.lean:45` `HomotopyGroup.map` and `:169` `mapHom`;
  - `LoopSpace.lean:72` `congrEquiv`;
  - `Homeomorph.lean:78` `homeomorphEquiv`;
  - `BasepointChange.lean:352` `TauCeti.homotopyGroupEquivOfPath`;
  - `Analysis/Normed/Module/Ball/Homeomorph.lean:250` `TauCeti.sphereHomeomorphOfFinrankEq`;
  - `AlgebraicTopology/Sphere/HomotopyGroup.lean:66` `subsingleton_homotopyGroup_sphere_of_lt` and `:110` `homotopyGroupSphereAddEquiv`. The latter needs an inner-product space in `Type` and an orthonormal basis of `Fin (n+3)`.
  - The pin also has `AlgebraicTopology/Sphere/CubeQuotient.lean`, with `TauCeti.cubeQuotientHomeomorphSphere`, `GenLoop.toSphere` and `HomotopyGroup.sphereEquiv`. These are the pinned form of the cube-to-sphere passage that §7.5 takes from AlgebraicTopology's `coordinateCubeQuotientSphereHomeomorph`; this goes with R01.
  - The pin has no reduced-suspension homeomorphism ΣSⁿ≅Sⁿ⁺¹: `Topology/Sphere/Suspension.lean` is only the unreduced S²=ΣS¹. It has no Milnor K₂ and no tame symbol.

### Cross-roadmap citations resolved

- **On main:**
  - AlgebraicTopology Stage 4 item 4 (lines 543–580) declares `coordinateCubeQuotientSphereHomeomorph`, `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison`;
  - GeneralizedCohomology G2.4 (line 271), G2.5 (Freudenthal at line 326, π_nS at line 393) and G3 item 9 with `spectrumPrimeLocalization` (line 885);
  - BordismFormalGroups F3 (line 284) and F4 (line 329; bounded-below convergence);
  - EllipticCohomology §E4.S (line 913).
- **At #1227 (StableHomotopyKTheory):** §7.1 holds the Moore triangle, η, the first stems and π₂(S/2)=ℤ/4 in prose (R02 covers the names).
- **At #1287 (HomotopySpheres):** §§3A.3, 3A.4 and 9.2 (R01).
- **At #948 (StringOrientation):** S2.3 states π_(n+3)(Sⁿ)≅ℤ/24 directly through G2.5's Freudenthal theorem without a stable-stem carrier. That is the precedent for the repair.
- **At #1430 (K3BlochGroups):** lines 13, 111, 1356, 1367, 1369 and 1765 (R01, R03).
- **Declared gaps:** both declared gaps are unchanged, precise, and present in `design/plan.json` and in README lines 304 and 445.
- **Overlap report:** no pull request changes this roadmap and no cited id is dropped.
- **Ownership by object** over main and all 476 open heads: wild kernels, the Harris–Segal summand, K₄(ℤ), the golden and Gaussian tame kernels, Steinberg finiteness and the signature defect have no second owner. The stable stems and the fourth stem are R01.
- **Note for the worker:** the pull-request description still lists “HomotopySpheres Stage 9, item 2 (#284 or #1287)” among direct prerequisites, but the README no longer cites HomotopySpheres.

## Not verifiable

- Grayson, LNM 966 (`grayson-curve`): uncertified, cited by its page range.
- Waived texts (`harris-segal`, `mitchell`, `quillen`, `bass-tate`, `serre`, `groenewegen-preprint`): not read. In particular, Bass–Tate Appendix Proposition 1, pp. 430–431, cited in §§8.8–8.9, was not opened.
- The AINTLIB declaration names in §§7.1–7.3 (external repository): not opened. The §7.2 argument relies on the supplier's unrestricted statements, not on those signatures.
- Ravenel and Hatcher were read from the authors' posted copies, but they are not in the package manifest (R06).

## Source issues

- **Misprint** in ravenel at Theorem 4.4.47, printed page 145: the source says d₃(ᾱ_(4i+3))=ᾱ₁³ᾱ_(4i+3); it should be ᾱ₁³ᾱ_(4i+1), as the paragraph before it derives; affects nothing.
- **Misprint** in hermitian at proof of Corollary 1.2.12, printed page 18: the source says the map is injective when n≤2n−3; it should be n≤2m−3, the statement's range; affects nothing.
- **Misprint** in caputo at Example 2, printed page 17: the source says E is totally split at 3 in the construction for a general odd prime p; it should say at p; affects nothing.
- **Misprint** in kbook at Definition VI.9.6.1, printed page 520: the source says 0≤j(R)<r₁ for every R; it should say j(R)<r₁ when r₁>0, since j=0=r₁ for totally imaginary F; affects nothing.
