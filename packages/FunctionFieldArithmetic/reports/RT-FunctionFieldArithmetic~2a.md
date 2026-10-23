<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/142#issuecomment-6372113937 -->
Red team round 2 pass a (codex) of 2812784

Verdict: needs_changes

1. **F01** (P1) Generalized Picard and ramified reciprocity targets duplicate an earlier supplier

   **Location:** packages/FunctionFieldArithmetic/README.md:138–144: “AL.3 supplies the zero-modulus comparison. The added geometry belongs here.” Also §§4.5–4.10.

   **Claim:** No earlier roadmap owns the positive-modulus Picard objects, Lang covers and conductor comparison.

   **Witness:** TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2436–2442, AL.3 “Ramified rank-one curve reciprocity”, constructs generalized Picard torsors, Abel/Lang maps, the ray quotient, finite-cover comparison and least conductor for every effective modulus.

   **Exact repair text:** Replace the ownership claim by: “AutomorphicLFunctionsAndLocalFactors AL.3, Ramified rank-one curve reciprocity, supplies the finite-field generalized Picard objects, ray-class comparison, Abel and Lang maps, and finite-character dictionary with least modulus. RelativeJacobiansAndIntegralCurveModels §§1.3–1.5 supplies the finite-flat rigidified Picard sheaf, unit sequence, smooth algebraic-space representability and universal rigidified family. Section 4.6 specializes those objects and proves its additional scheme and structure assertions; §4.7 proves Rosenlicht's fixed-modulus universal property. Sections 4.8–4.10 import the finite-field construction and supply only comparisons or extensions not already stated there.” Replace the duplicated construction/classification targets and their proof plans by that exact supplier citation; retain explicitly new arbitrary-finite-abelian-group and perfect-field extensions with the supplied objects.

   **Additional ownership witness:** TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md:267–317, §§1.3–1.5, already supplies finite-flat rigidification and its smooth representing algebraic space over general bases. This supplier also precedes this roadmap; the perfect-field specialization must not rebuild those objects. Its rigidification O→L is the inverse of this package's L→O, so explicitly invert the trivialization.

   **Repair test:** For ℙ¹ with modulus 2[∞], both packages construct Jₘ=𝔾ₐ, the Lang cover y^q−y=t and least conductor 2[∞]. After the repair this finite-field construction has one owner, including q=2; the all-perfect-fields universal property remains an extension here.

2. **F02** (P1) Fixing the central character does not give a subtorus

   **Location:** packages/FunctionFieldArithmetic/README.md:2213–2215: “restrict to its subtorus trivial on Z_{H_n}(𝔸)”.

   **Claim:** The unramified characters preserving a fixed central character form a complex subtorus.

   **Witness:** Take the split H₁=GL₂ and P=M=G. The degree lattice is ℤ; scalar ideles have determinant degree 2d. Its fixed-centre character group is {z:z²=1}=μ₂, with two components.

   **Exact repair text:** “When the central character is fixed, use the full closed diagonalizable subgroup 𝒯_M^{H_n} of characters trivial on the image of Z_{H_n}(𝔸). It need not be connected. Retain all components; state rational continuation and common-denominator identities on each component, using its coordinate ring.” Add the Check: “For split H₁=GL₂ and P=G, 𝒯_G^G=μ₂; the degree-parity twist z=−1 has trivial central restriction and must not be discarded.”

   **Repair test:** Both z=1 and z=−1 satisfy z^(2d)=1 for every central degree d, whereas the identity-component subtorus contains only 1. TauCetiRoadmap/AutomorphicSpectralTheory/README.md:1103–1113 explicitly retains these components. This is a new error in the r1a F10 repair.

3. **F03** (P2) The reduced-basis headline is statable but absent

   **Location:** packages/FunctionFieldArithmetic/README.md:443–448: “for every divisor D ... for every r ∈ ℤ ... is a k-basis”. packages/FunctionFieldArithmetic/Suggested.lean:10–17 omits this headline entirely.

   **Claim:** The acceptance file covers its statable headlines, leaving only the listed unavailable carriers.

   **Witness:** TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean:87 provides riemannRochSpace; TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean:247 provides poles. Mathlib provides RatFunc, FiniteDimensional, LinearIndependent, Submodule.span and integer scalar multiples. No new geometric carrier is needed.

   **Exact repair text:** Add the §1.2 existence-and-uniqueness headline below, its declaration name to the README, and a Layer 1 comment. It uses native carriers, and the finite index subtype merely spells out the displayed basis. Retain all-field and inseparable generality. This proposed signature is source-checked, not elaborated in this read-only pass.

   ```lean
   /-- Reduced bases simultaneously describe all pole shifts of a divisor (README 1.2). -/
   theorem riemannRoch_reducedBasis
       {k F : Type*} [Field k] [Field F] [Algebra k F]
       [Algebra (RatFunc k) F] [IsScalarTower k (RatFunc k) F]
       [FiniteDimensional (RatFunc k) F]
       (hF : IsFunctionField k F) (D : Divisor k F) (x : Fˣ)
       (hx : (x : F) = algebraMap (RatFunc k) F RatFunc.X) :
       ∃! d : Fin (Module.finrank (RatFunc k) F) → ℤ,
         Antitone d ∧
           ∃ v : Fin (Module.finrank (RatFunc k) F) → F,
             LinearIndependent (RatFunc k) v ∧
             ∀ r : ℤ,
               let w := fun a : {a : Fin (Module.finrank (RatFunc k) F) × ℕ //
                   (a.2 : ℤ) ≤ d a.1 + r} =>
                 (x : F) ^ a.val.2 * v a.val.1
               LinearIndependent k w ∧
                 Submodule.span k (Set.range w) =
                   riemannRochSpace (D + r • Divisor.poles hF x) := by
     sorry
   ```

   **Repair test:** For k(t), x=t, D=0, d=(0), v=(1), the index is empty for r=−1 and {0,1,2} for r=2, giving respectively 0 and span(1,t,t²). For the elliptic example, d=(0,−2), v=(1,y), r=2 gives span(1,x,x²,y). The basis witnesses are chosen before r, as the README requires; the dimensions for all r recover the unique sorted invariants.

4. **F04** (P3) A torus Levi can have a nontrivial ambient Weyl sum

   **Location:** packages/FunctionFieldArithmetic/README.md:2259: “For a torus Levi with no proper parabolic the Weyl sum has one term”.

   **Claim:** Being a torus Levi makes the Eisenstein construction the identity.

   **Witness:** The Levi M=GL₁×GL₁ of the Borel in split H₁=GL₂ has no proper parabolic, but its ambient Weyl group has two elements. packages/FunctionFieldArithmetic/README.md:2261–2263 itself gives the two-term constant term.

   **Exact repair text:** “For P=G, there is one Eisenstein summand, the identity intertwiner and E(f)=f; the denominator can be 1. A torus Levi of a proper parabolic need not have this property: the Borel of split H₁=GL₂ has two Weyl terms.”

   **Repair test:** P=G gives the singleton coset space and E=f. For GL₂'s Borel, the two terms at generic s retain the exponents s and −s. This distinguishes the ambient group from its Levi.

5. **F05** (P3) The two polynomial examples are acceptance-test padding

   **Location:** packages/FunctionFieldArithmetic/Suggested.lean:172–186: the two examples with q=5, g=1 and N₁=9 or 8.

   **Claim:** These belong in the acceptance file as nontrivial tests.

   **Witness:** Unfolding IsLPolynomialData at g=1 leaves P₀=1, deg P≤2, P₂=5 and P₁=N₁−6. The examples evaluate 3=3 and 3≠2; they exactly mirror packages/FunctionFieldArithmetic/README.md:1629–1631.

   **Exact repair text:** Delete both examples and their docstrings from Suggested.lean. Keep the three discriminating polynomial Checks in README §5.6; keep IsLPolynomialData.unique and lPolynomial_isLPolynomialData as the general headline assertions.

   **Repair test:** The remaining acceptance theorem still determines every genus-g polynomial from g counts, including the example's unique polynomial. Removing these concrete calculations loses no general theorem or required definition.

6. **F06** (P2) The constant extension has the wrong local degree in the proof

   **Location:** packages/FunctionFieldArithmetic/README.md:301–302: “acts on the unramified extension of degree r”.

   **Claim:** A global constant extension of degree r induces an unramified local field extension of degree r at every place.

   **Witness:** Over 𝔽₂(t), take r=2 and the degree-two place t²+t+1. Its residue field already is 𝔽₄. The constant extension splits into two completion factors, each of local degree 1, not 2.

   **Exact repair text:** “At a place of degree d_v, the constant extension has gcd(r,d_v) completion factors, each unramified of degree r/gcd(r,d_v). Local arithmetic Frobenius restricts to φ^(d_v) on 𝔽_(q^r). Multiplicativity and triviality on principal ideles give the global formula.” Add the Check “For r=d_v=2 the local degree is 1 and φ²=1; for r=3,d_v=2 the local degree is 3 and φ² has order 3.”

   **Repair test:** The two instances give respectively 2 factors of degree 1 and 1 factor of degree 3, with total dimension r in both cases. The stated global reciprocity formula is unchanged.

7. **F07** (P2) The new Witt Hilbert 90 headline is statable but omitted

   **Location:** packages/FunctionFieldArithmetic/README.md:653–660: “Witt-vector additive Hilbert 90”. packages/FunctionFieldArithmetic/Suggested.lean:10–17 neither states nor identifies this headline separately.

   **Claim:** The newly added deep prerequisite has no native acceptance signature.

   **Witness:** Mathlib/RingTheory/WittVector/Truncated.lean:62, :74, :78 gives native truncated Witt vectors, constructors and coordinates. Coefficientwise application of a field automorphism and a finite sum define both maps; finite Galois automorphisms already exist.

   **Exact repair text:** Add a headline theorem, named in the README, for every prime p, fields F,L of characteristic p, finite-dimensional Galois F-algebra L, generator σ of Gal(L/F), and n≥0: “With σ_W acting coefficientwise, i_W induced by F→L, and T_W(a)=Σ_τ τ_W(a), ker(1−σ_W)=range(i_W), range(1−σ_W)=ker(T_W), and range(T_W)=range(i_W).” Use real coefficientwise definitions on TruncatedWittVector and Witt addition, and an explicit finite-dimensional/Galois/generator context. This is the exactness headline, not three routine Check declarations.

   **Repair test:** For n=0 all sets are {0}. For L=F, 1−σ=0 and T_W=id. For a degree-p Artin–Schreier extension at n=1, T_W(1)=0 but T_W(−y^(p−1))=1, including p=2. This tests the essential surjectivity and excludes coordinatewise trace at larger Witt length.

8. **F08** (P3) README code formatting advertises undeclared acceptance names

   **Location:** packages/FunctionFieldArithmetic/README.md:404 “Define `chartIdeals D`”; :509 “Define `divisorLattice D := ...`”; :1529 “Define `lPolynomial F := ...`”.

   **Claim:** Backticked names of this roadmap denote declarations in Suggested.lean.

   **Witness:** The complete 15-declaration acceptance file has none of chartIdeals, divisorLattice, lPolynomial, rayAbel, HasRayModulus, rayLangCover or automorphicFunctions. They are planned README interfaces, not pinned external declarations.

   **Exact repair text:** Render planned interface names and their explanatory intended signatures as ordinary mathematical prose, reserving code formatting of this roadmap's own names for its actual acceptance declarations. For example: “Associate to D the two chart ideals D_fin and D_∞”; “Let A(D) be the divisor lattice”; “Write L_F=(1−T)(1−qT)Z_F.” Apply the same change to the other undeclared proposed interfaces. Do not add an API catalogue to Suggested.lean.

   **Repair test:** For D=2∞ the two ideals and their inverse intersection still give span{1,t,t²}; on P¹, L_F=1. Only the misleading declaration-name formatting is removed.

9. **F09** (P3) The module docstring omits unavailable headline theorems

   **Location:** packages/FunctionFieldArithmetic/Suggested.lean:12–17: “The other headline theorems are not statable at the pins”.

   **Claim:** The ensuing inventory identifies each omitted headline and its missing carrier.

   **Witness:** packages/FunctionFieldArithmetic/README.md:1669–1679 states the finite-coefficient cohomological L-function identity; §6.7 states Yu's nonvanishing theorem. Neither theorem is named in the module docstring, and neither has an acceptance declaration.

   **Exact repair text:** Add: “The finite-coefficient cohomological L-function identity (§5.7) lacks constructible étale sheaves with derived compact-support cohomology and Frobenius. Yu's degree-zero nonvanishing theorem (§6.7) lacks the adelic cuspidal automorphic representation and Whittaker interfaces.” Reconcile the full headline inventory below with the module docstring; name every remaining unavailable headline and its precise missing carrier. Add the statable theorems in S03 and S07 rather than calling them unavailable.

   **Repair test:** The §5.7 rank-one sheaf on ℙ¹ has L=1/((1−T)(1−qT)); the §6.7 n=2,g=2 shift is +2−2=0. The new inventory names these actual geometric/automorphic assertions without substituting free scalar identities.

## Earlier findings, verified individually

“a” and “b” identify the earlier passes. Locations below are at the reviewed head. Each quoted repaired passage is followed by a concrete verification; these are independent of the repair report's verdicts.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| a F01 — algorithms | Repaired | packages/FunctionFieldArithmetic/README.md:396 “stated as theorems”; :1632 “counts must be proved to equal the point counts”. Old §§1.3, 5.8, 5.9 and algorithm signatures are absent. Remaining reduced-basis reduction is a mathematical existence proof, with no executable/complexity deliverable. |
| a F02 — obsolete foundation contracts | Repaired | packages/FunctionFieldArithmetic/README.md:236 “SchemeAndStackFoundations §3.6”; :239 “§3.7 abelMaps_highDegree”; :243 “§1.1 ... ModularCurves Layer 0E”. These current main sections supply the stated ordinary objects and descent; the real conic keeps its Picard–Brauer obstruction. |
| a F03 — constant field in AS count | Repaired | packages/FunctionFieldArithmetic/README.md:784 “For k = 𝔽₃”; :786 “Over 𝔽₉ ... sixteen”. The equation y³−y=x² has 3/15 affine points, plus its one point at infinity, hence 4/16. |
| a F04 — cycles/reverse supplies | Repaired | packages/FunctionFieldArithmetic/README.md:2006 “definitions in §6.3 and ... theorem in §6.4”; :1060 lists §§4.1–4.4; :103 “Its §3.7 supplies”; :1866 “supplied complex theory has no dependence on Layer 6”. The earlier targets exist. The dependency check has zero problems; the former base-change/support cycle is gone. |
| a F05 — missing Euler product | Repaired | packages/FunctionFieldArithmetic/Suggested.lean:99 “theorem zeta_eulerProduct”. For ℙ¹/𝔽₂ its product has coefficients 1,3,7, equal to effective-divisor counts. The supplied elaborated signature retains finite exact constants and the coefficient topology. |
| a F06 — Lean Check mirrors | Repaired differently | packages/FunctionFieldArithmetic/README.md:712 “(t²+t, t²+t³)”; :708 nonzero class of 1; :1495 degree-two weighting; :1628 genus zero. These computations are correct. Omitting their routine Lean mirrors follows this round's binding no-padding rule. |
| a F07 — catalogue | Repaired | packages/FunctionFieldArithmetic/Suggested.lean:12 “other headline theorems are not statable at the pins”, followed by carrier explanations; the trailing name catalogue is gone. The independent missing-headline issue is S03. |
| a F08 — Witt Hilbert 90 | Repaired | packages/FunctionFieldArithmetic/README.md:653 “Witt-vector additive Hilbert 90”; :660 names the trace input. At length 1 for a degree-p AS extension Tr(1)=0 but Tr(−y^(p−1))=1; kw line 276 states the exact sequence. |
| a F09 — reduction theory | Repaired | packages/FunctionFieldArithmetic/README.md:1936 “function-field reduction”; :1943 gives the finite Siegel covering; :1947 finite quotient volume. morris1 lines 427, 439 and 497 provide these separate inputs. GL₁ modulo centre is one point; GL₂ bounded root heights leave finitely many integers. |
| a F10 — continuation prerequisites | Partly repaired | packages/FunctionFieldArithmetic/README.md:2217 “cuspidal Eisenstein rational continuation”; :2230 “unitary Levi discrete decomposition”; :2241 “discrete-data Eisenstein continuation”. Their dependency order is explicit. The new fixed-centre parameter assertion is false (S02); the torus-Levi Check also needs the qualification recorded in the fresh audit. |
| a F11 — Schmid–Witt pages | Repaired | packages/FunctionFieldArithmetic/README.md:956 and :1052 “Proposition 4.4 and proof, pp. 15–16”. kw line 739 starts the proposition; line 744 marks p.16; line 755 ends the proof. |
| a F12 — manifest | Repaired | sources.toml:1 “tauceti-roadmap-sources/v1”. It has 28 unique entries: 22 certified, five uncertified, one waived. SGA3 and Borel–Tits are included; no settled text was requested again. |
| a F13 — induction Check | Repaired | packages/FunctionFieldArithmetic/README.md:2328 “give the same section and Eisenstein series”. For split rank one q=4,s=0, both values are 1/2, while adding the normalization a second time gives 1/4. |
| a F14 — dyadic/local scope | Repaired | packages/FunctionFieldArithmetic/README.md:2433 “There is no characteristic or residue-characteristic restriction”. At residue q=2, split Gram π gives 1+T, inert Gram π gives 1−T; rank zero gives 1. The earlier density owner explicitly excludes base characteristic two but allows dyadic residue fields. |
| a F15 — false unramified existence | Repaired | packages/FunctionFieldArithmetic/README.md:2149 “exists if and only if ... trivial on ker(ν*)”; :2172 “existence with finite ramification”. For the displayed elliptic cover, the pulled-back divisor is principal but η(P−O)=−1. The spherical formulas explicitly assume unramified χ; the ramified formulas retain sections and level data. |
| a F16 — modulus descent | Repaired | packages/FunctionFieldArithmetic/README.md:1378 “with its specified ramification bound”; :1380 “cannot detect a decrease between two positive exponents”. y^p−y=t is étale on both identical opens but has conductor 2[∞], so only the larger ray quotient admits its character. |
| a F17 — central-character Check | Repaired | packages/FunctionFieldArithmetic/README.md:1885 “Over ℚ no nonzero constant ... over ℤ/4 ... (2,2)”. The equation a=−a has only 0 over ℚ and also 2 over ℤ/4, within the admissible degree-parity character's domain. |
| a F18 — determinant ownership | Repaired | packages/FunctionFieldArithmetic/README.md:253 names PadicMeasuresIwasawaAlgebras §5.1; :1637 “characteristic series ... scalar ... determinant line”. For [ℤ/4→²ℤ/4] with identity, the alternating chain determinant is 1 although neither cohomology module is projective. |
| b F01 — deprecated example | Repaired differently | packages/FunctionFieldArithmetic/Suggested.lean:46 now defines the operator and :62 states its classification; the Teichmüller example and deprecated coe_coe occurrence are deleted. No re-elaboration was run; the supplied signatures match the file. |
| b F02 — process narration | Repaired | packages/FunctionFieldArithmetic/README.md:44 “implemented by”; :205 “Tau Ceti also has”; :251 “roadmap contracts”. The cited commit hash and “now/current” narration are absent. |
| b F03 — title | Repaired differently | packages/FunctionFieldArithmetic/README.md:1 “function field arithmetic — algebraic curves, Part II”. The package's own name and its extension relationship are both stated, consistently with the binding Part II rule. |
| b F04 — duplicate constant coefficient | Repaired differently | packages/FunctionFieldArithmetic/README.md:1468 “the constant coefficient of the zeta series is one”. Both duplicate API labels and the routine Lean proof are deleted. The ℙ¹ value A₀=1 remains a README Check. |


## Acceptance signatures and headline inventory

All 190 lines of Suggested.lean and all 2764 README lines were read. The worker-supplied elaborated signatures were compared individually with the source; no Lean command was run. There are 15 named declarations (eight theorems, six definitions, one abbreviation) and two proved examples. No declaration lost a section binder. The definitions intentionally make sense beyond finite exact constants; the arithmetic theorems carry those additional hypotheses explicitly. Field assumptions exclude the zero ring and q=1; the purely polynomial predicate admits q=0 and q=1 and remains uniquely determining.

The headline inventory is: degree-one divisors; simultaneous reduced bases; additive adelic volume/Fourier comparison; Witt Hilbert 90 and Artin–Schreier–Witt classification; local existence and Schmid–Witt conductor theory; ray/Picard/Lang classification and least conductor; zeta Euler product, rationality/functional equation/class number and recovery; finite-coefficient L-functions; degree-sensitive quantitative Chebotarev; Harder finiteness; Yu nonvanishing; inducing-character obstruction/existence; general unitary Eisenstein continuation; Hermitian density interpolation and global Fourier coefficients. The docstring correctly identifies missing carriers for local reciprocity, ray geometry, automorphic modules and unitary sections/densities. S09 records the incomplete unavailable-headline inventory, and S03/S07 give two that are already statable with simple native definitions. No substitute for an unavailable theorem is recommended.

In the table, FF means fields k,F with Algebra k F, explicit hF:IsFunctionField k F, finite k and exact constants. W means prime p (Fact p.Prime), field F of characteristic p. All names have prefix TauCetiRoadmap.FunctionFieldArithmetic. Results marked “sound” refer to the typed statement, not a claim of proof completion.

| Declaration; section and actual context | Instances and computed values on both sides | Result; change |
|---|---|---|
| exists_divisor_degree_eq_one; 0; FF | F₂(t), D=∞: degree=1. Real pointless conic: degree image=2ℤ, excluded. A finite-field curve with places of degrees 2,3 gives deg(v₃−v₂)=3−2=1. | Sound; no change. |
| artinSchreierWitt; 3; W | natively Frob−id; at p=2, a=(t,0), first two coordinates=(t²+t,t²+t³); coordinatewise subtraction would have second coordinate 0. Over F_p, Frob=id so ℘=0. | Sound real definition. |
| aswQuotient; 3; W, n:ℕ | n=0: ker truncate=all, Q=0. F=F_p,n=1: Q=F_p, [1]≠0. Algebraically closed F: ℘ onto, Q=0. | Sound; finite truncation represented by sum of subgroups. |
| artinSchreierWitt_galois; 3; W, n:ℕ | F_p,n=2: Q=ℤ/p² and Hom_cont(Ẑ,ℤ/p²)=ℤ/p². n=0: 0≃0. Algebraically closed F: 0≃0. | Sound additive-equivalence existence; no silent finiteness/perfectness assumption. |
| effectiveDivisorCount; 5; fields, algebra only, n:ℕ | F₂(t): A₀=1,A₁=3,A₂=7. Infinite constants ℂ(t), n=1: infinite subtype, Nat.card=0; arithmetic uses finite k. | Sound total definition; junk value is guarded in theorems. |
| zeta; 5; fields, algebra only | F₂(t): 1+3T+7T²+15T³+…; coefficients equal A_n. Zero divisor contributes constant 1. | Sound real definition. |
| placeCount; 5; fields, algebra only | F₂(t): B₀=0,B₁=3,B₂=1,B₃=2. Degree-two irreducible contributes one place, not two. | Sound. |
| pointCount; 5; fields, algebra only | F₂(t): N₁=3,N₂=3+2=5,N₃=3+3·2=9; N₀=0 from Nat.divisors 0. N₀ is not a geometric count. | Sound; recurrences only use positive indices. |
| zeta_eulerProduct; 5; FF, explicit coefficient topology | F₂(t): (1−T)^−3(1−T²)^−1… gives A₀=1,A₁=3,A₂=6+1=7. Each degree is positive, so each factor has constant 1; coefficient n uses finitely many places of degree≤n. | Sound; no division by a zero unit. |
| zeta_logDeriv; 5; FF, r>0 | q=2, r=1: 1·3=3·1. r=2: 2·7=3·3+5·1=14. r=3: 3·15=3·7+5·3+9=45. | Sound; r−1−i only under i<r. |
| effectiveDivisorCount_of_large; 5; FF, 2g≤n+1 | P¹,q=2,g=0,n=0: (2−1)·1=1·(2¹−1)=1. Elliptic q=5,h=9,n=1:4·9=9·(5−1)=36. n=0,g=1 excluded (2≤1 false). | Sound, sharp range n≥2g−1. |
| zeta_rationality; 5; FF | P¹,q=2: L=1, degree0, lead1, L(1)=1. E/F₅ with N₁=9: L=1+3T+5T², symmetry 5=5·1, L(1)=9. Multiply Z by (1−T)(1−5T): coefficients 1,3,5,0…. | Sound, including genus zero. |
| IsLPolynomialData; 5; q,g:ℕ,N:ℕ→ℤ,P:ℤ[T] | g=0 forces P=1. q=5,g=1,N₁=9 gives P₁=3,P₂=5. Replacing N₁ by8 forces P₁=2. q=0,g=1,N₁=2 gives P=1+T. | Sound real predicate; inconsistent input may have no solution. |
| IsLPolynomialData.unique; 5; q,g,N arbitrary; two predicate hypotheses | g=2,q=2,N₁=3,N₂=5: a₁=0; 2a₂=N₂−1−q²=0, so P=1+4T⁴. Recurrence first determines a₁…a_g over ℤ; symmetry determines the rest. q=1 uses the same nonzero integer multipliers. | Sound nontrivial uniqueness, not one-lemma padding. |
| lPolynomial_isLPolynomialData; 5; FF and actual numerator identity | E above: A₁=9,A₂=54; a₁=9−6=3,a₂=54−6·9+5=5. Recurrence at r=1:3=9−1−5. | Sound comparison; numerator hypothesis ties P to the constructed zeta. |
| proved example at173; q=5,g=1,N₁=9 | Predicate reduces to a₀=1,a₁=3,a₂=5, 3=9−6. | Padding; delete, S05. |
| proved example at183; q=5,g=1,N₁=8 | Claimed polynomial has a₁=3 while required value is8−6=2. | Correct negative computation but padding; delete, S05. |

## Bold-target adversarial table

There are 12 mathematical bold targets in the numbered layers (excluding “Checks”, “Source correction”, and the adjective “rational”). Their individual computations are below.

| Bold target; README line | Instances; values compared | Result; change |
|---|---|---|
| Constant-field reciprocity;294 | r=3,d=2: degree2, Yu degree−2, arithmetic φ², geometric φ; r=d=2: φ²=1. | Global assertion sound; local proof repaired by S06. |
| Witt-vector additive Hilbert90;653 | n=0:0→0→0; identity extension: difference0, traceid. AS degree3:Tr(1)=0,Tr(−y²)=1. | Sound; add native headline S07. |
| characteristic series;1637 | [A] with u=a:1−aT; shift:(1−aT)^−1. [ℤ/4→²ℤ/4],u=id:(1−T)/(1−T)=1 though both cohomology groups are ℤ/2. | Sound; derived determinant is correctly imported. |
| function-field reduction;1936 | GL₁ modulo centre:one point, no roots; GL₂ diag(π^a,1):log_q modulus=−a, bounded interval permits finitely many a; anisotropic rank0:no roots but compact quotient. | Sound target, supplied reduction proof covers nonsplit groups. |
| unramified extension criterion;2148 | split:diagonal Pic injection, obstruction1; constant quadratic cover:η(D)=(−1)^degD extends by exact-constant degree. Displayed elliptic kernel class maps to0 but evaluates−1. | Sound iff; zero/even n gives1. |
| arithmetic obstruction evaluation;2156 | elliptic P−O:inert multiplicity1, split multiplicity−1; sign(−1)^1=−1. Principal divisors:product of Artin symbols=1. | Sound. |
| existence with finite ramification;2172 | split χ₀⊗χ₀^−1 restricts1; even n χ=1,S=∅; odd elliptic example admits an idele-class extension but no unramified one (−1≠1 obstruction). | Sound; embedding/closedness distinguishes idele classes from Pic. |
| cuspidal Eisenstein continuation;2217 | P=G:E=f,M=id,D=1; split GL₂ Borel:two Weyl terms, exponents ±s; fixed-centre P=G parameter μ₂ has2 components. | Subgroup correction S02; torus Check S04. |
| unitary Levi discrete decomposition;2230 | GL₁:each unitary character is a one-dimensional summand; GL₂ determinant character:constant term1≠0, residual rather than cuspidal. | Sound; no spherical-only restriction. |
| discrete-data continuation;2241 | Residual GL₂ character gives nonzero inducing vector, same vector via two residue presentations gives the same E; zero vector gives0 in both presentations. | Sound; finite-level common denominators required. |
| ramified local Fourier factor;2406 | Φ=0 gives0; 2Φ gives2W. Spherical unit line at s=0 gives L₁,v(0)^−1=1−η/q; q=3 inert gives4/3. | Sound linearity and nonzero normalizing control. |
| general coefficient formula with level data;2582 | α=1:character/norm factors1; double one section doubles both sides. Move a good place into S:old L_v^−1Den becomes new W_v, equal term for term. | Sound with rational nonsingular T and finite S. |

## README Check computations

Each row identifies the Check by its start line in packages/FunctionFieldArithmetic/README.md. These are independent calculations; “retain” means the displayed Check is true. All 178 Check bullets were tested. Four API bullets following the Hilbert-90 Checks are counted as API assertions, not Checks. Prime p, finite-field size q>1, finite modulus and smooth geometrically connected curve assumptions remain in force unless a negative control explicitly removes one.

| Check line | Instance and computed values | Result; change |
|---|---|---|
|312|d_v=2,q=3: valuation degree2, Yu degree−2, norm 1/9; unweighted value1 would be wrong.|Retain.|
|314|t on P¹: ord₀=1,ord∞=−1, degree1−1=0, Yu degree0.|Retain.|
|315|r=3,d=2: arithmetic φ², inverse φ; d=3 gives identity in both.|Retain; S06 corrects local proof.|
|344|q=2,g=1: q+1−2√q=3−2√2>0, integer N₁≥1. Degree2,3 places give signed divisor degree3−2=1 without requiring either degree1.|Retain.|
|347|P¹: residue field at∞=k, [k:k]=1.|Retain.|
|348|Real pointless conic: every closed-point degree2, divisor degree image2ℤ; 1∉2ℤ.|Retain.|
|372|P¹: Pic=ℤ, kernel degree=0, cardinal of trivial group1=h.|Retain.|
|373|P¹ minus degree2 point: affine class groupℤ/2, projective Cl⁰=0; removing∞ gives affine class group0.|Retain.|
|375|Real conic: actual line-bundle degrees2ℤ, Picard-scheme classesℤ, cokernelℤ/2.|Retain.|
|429|D=2∞: chart ideal at infinity is t^−2O∞; its inverse is t²O∞. Intersection with k[t] is span{1,t,t²}, dimension3. Reversing the original sign gives dimension0.|Retain.|
|432|D=−∞: polynomial with ord∞≥1 is0; dimension0. Reversed inequality admits1.|Retain.|
|435|Finite chart k[t] contains1,t,t²,…, dimension∞; imposing∞ bound2 leaves dimension3.|Retain.|
|476|D=m∞: m=−2 gives max(0,−1)=0; m=0 gives 1; m=2 gives 3.|Retain.|
|479|Elliptic x-pole divisor2∞: invariants(0,−2), r=0 basis{1}, r=1{1,x}, r=2{1,x,x²,y}; dimensions1,2,4.|Retain.|
|482|P¹,D=0,x=t²: invariants(0,−1), n=2, sum−1=1−2; x=t gives(0),n=1. Both give ℓ(0)=1.|Retain.|
|484|constant degree2,exact genus2: genus over k=3, sum deg D+2(1−2)−n=degD−2−n; substituting3 gives deg D−4−n.|Retain.|
|535|P¹,W=−2∞,D=−∞: ℓ(D)=0,i(D)=ℓ(−∞)=0; intersection{0}, quotient0. D=0 gives ℓ=1,i=0.|Retain.|
|537|Finite adeles alone: k[t] lies in intersection, infinite dimension; full integral lattice intersects in k, dimension1.|Retain.|
|540|d_v=2: adjoining one pole step multiplies lattice quotient cardinal by q²; q=2 gives 4, not2.|Retain.|
|572|P¹,dt: ord∞=−2, local integral volume q, others1; global volume q^(1−0)=q.|Retain.|
|574|n_v=2,q_v=4: volume4^−1=1/4, not4.|Retain.|
|575|dt→t dt: local ratios at0,∞ are q^−1/2,q^1/2; product1; global volume remains q.|Retain.|
|602|P¹,D=0,q=2: Fourier indicator is2·1_(A(−2∞)); value at0=volume(A(0))=2.|Retain.|
|603|volume(A(D))·volume(A(W−D))=q^(degD+1−g)q^(2g−2−degD+1−g)=1; double transform1_A(D).|Retain.|
|606|Over F₃, coset1+πO changes to2+πO under scalar2, so its indicator is not scalar invariant; all unshifted lattice indicators are.|Retain.|
|665|n=0: W₀=0, quotient0, kernel/image{0}, trace onto0.|Retain.|
|666|L=F: σ=id, difference0, trace id; quotient0.|Retain.|
|667|p=2: Tr(1)=0,Tr(−y)=1; p=3: sum(y+i)²=−1, so Tr(−y²)=1.|Retain.|
|706|n=0: Q₀=0, adjoining zero coordinates gives F.|Retain.|
|707|a=℘b: solution b already in F, extension degree1; F_p,n=1,a=1: ℘F_p=0, class order p, degree p.|Retain.|
|710|p=2,n=2,(t,0): ℘=(t²+t,t²+t³); false coordinatewise formula has second0.|Retain.|
|714|p=3,n=1: a and2a span the same line, degree3 field unchanged; characters χ and2χ differ whenχ=1.|Retain.|
|755|k=F₄,p=2,Tr(u)=1: β=[u] has Witt trace a unit inℤ₂; β=1 has trace2, not a generator.|Retain.|
|759|[T^−p]−[T^−1]=℘[T^−1], so both classes equal; allowed pole exponent1 notp.|Retain.|
|761|[1+T]−[1] reduces modulo T to0 in every coordinate; Henselian ℘ inversion yields class0, so integral class equals[1].|Retain.|
|784|F₃:y³−y=x² has3 affine points+∞=4; F₉ has15+∞=16. Different=(3−1)(2+1)=6,g=1,conductor3.|Retain; finite enumeration independently run.|
|788|p=2,m=1: 2g−2=−4+2=−2, g=0; t=1/(y²+y) gives rational function field.|Retain.|
|789|m=p: t^−p−t^−1=℘(t^−1); reduced pole1 givesg=0, while naive(p−1)(p−1)/2 need not even be integral.|Retain.|
|860|Q=2,m=1: degree(2−1)2⁰=1; m=2 degree2, wildly ramified.|Retain.|
|862|Q=3,m=2: degree(3−1)3=6, wild part3; m=1 degree2 tame.|Retain.|
|864|f(X+Y)=πX+πY+X^Q+Y^Q=f(X)+f(Y); formal groupX+Y, derivativeπ≠0.|Retain.|
|867|ord(x)=2: unramified degree2, ramified degree(Q−1)Q^(m−1), total2(Q−1)Q^(m−1). Norm subgroup degree2ℤ and unitsU^m.|Retain.|
|906|r=2: H=ord^−1(2ℤ), quotientℤ/2, unramified degree2; r=1 givesK.|Retain.|
|907|Q=3,m=2: K×/(π^ℤU²) has2·3=6 elements, matching LT degree6.|Retain.|
|908|℘y=T^−1: pairing with T=0, constants0, 1−aT gives−a; kernel contains U² and notU¹, quotient orderp.|Retain.|
|912|Arithmetic local Artin acts on LT torsion as[u^−1]; Yoshida's inverse acts as[u]. At u=2 mod5 these are3 and2.|Retain.|
|962|k=F₃,constant1: pairing with T=Tr1=1, with unit=0; T² gives 2.|Retain.|
|964|n=1:T^p pairs p·a=0 mod p; in pro-p completion its valuation is p∈ℤ_p, nonzero.|Retain.|
|966|In characteristic p ghost component1 is a₀^p+pa₁=a₀^p; a₁=0 or1 has same ghosts. Division byp cannot recover it.|Retain.|
|968|c_(pj+1)=p^j tends0, pole exponents pj+1 unbounded; at length n onlyj<n survive, finitely many poles.|Retain.|
|1009|constantβ: character kills all units, conductor 0; extension unramified even when class nonzero.|Retain.|
|1010|p=3,n=1,m=2,cunit: conductor1+2=3.|Retain.|
|1011|p=3,n=2,m=2: valuation1 coefficient gives 3; unit gives 1+2·3=7.|Retain.|
|1013|β+p[T^−m]: first ramified coefficient valuation1, inertia imagepℤ_p, quotientℤ/p; first layer unramified, length2 conductor m+1.|Retain; clamp prevents negative conductor bounds.|
|1066|P¹,m=0,r=3: ray degree quotientℤ/3, all degree characters conductor 0.|Retain.|
|1069|P¹: m=0 degree-zero order1; m=0+∞ orderq−1; m=2∞ orderq. Atq=2:1,1,2.|Retain.|
|1073|AS T^−1: [T^−1,1−aT)=−a, hence U¹ not killed and U² killed, conductor 2.|Retain.|
|1075|P¹,m=0 without degree quotient gives ℤ (infinite); modr gives r elements.|Retain.|
|1077|v=∞,π=t^−1: local coordinateπ↦T, so t↦T^−1; reversing gives wrong valuation−1 instead of1 forπ.|Retain.|
|1080|mod T²:(1+T)²=1+2T; p=2 gives 1, p=3 gives 1−T.|Retain.|
|1138|m=0: degree d component ordinary Pic^d; P¹ gives Spec k, J=0.|Retain; import ownership S01.|
|1140|m=rational P: units quotient G_m/G_m=1, so J_m=J and rigidified automorphism1.|Retain.|
|1142|P¹,m=0+∞: quotient(k×)²/k×≅k×; m=2∞:units1+bT with product b+c, henceG_a.|Retain.|
|1145|degree2 closed point splits into2geometric points, toric rank2−1=1; counting closed support would give 0.|Retain.|
|1148|real conic,m degree2: Pic_m¹(ℝ)=∅, while Pic¹_sheaf(ℝ) has 1 point; actual odd-degree line bundles do not exist.|Retain.|
|1200|P¹,m=0:J=0, a factored map to a commutative group torsor is constant; t toG_a has pole at∞ and is excluded.|Retain.|
|1203|c=2:(t−2)/(t−1) has rigidification(2,1), ratio2; inverse gives 1/2 (over F₅:3), so Abel mapc↦c.|Retain.|
|1207|c=1:1−T hasb=−1, coordinate−b=1; modulus∞ allows(t−1)/t but evaluated divisor1−0=1≠0. Modulus2∞ excludes it.|Retain.|
|1213|P¹,N=2,g=0: fibre dimension n−1: n=1 gives 0,n=2 gives 1. A¹ has connected étale AS cover of degree p.|Retain.|
|1217|g=1,N=1,n=1<threshold2: classP not in imageX−P; n=2 gives fibre dimension1−1=0 and surjectivity.|Retain.|
|1250|P¹,m=0: full ray groupℤ, degreezero0, degreeone singleton; h=1.|Retain.|
|1252|c=2 maps divisor[c]−[1] to2 (F₅); multiplicative inverse convention would give3.|Retain.|
|1255|unit1+bT has inverse1−bT mod T²; rigidification coefficient−b gives coordinate b. p=2 inverse has same sign but same equation.|Retain.|
|1258|degree3place−degree2place has degree1 and negative coefficient−1; no claim of effective or point representative.|Retain.|
|1314|P¹,m=0:A=0,Lang kernel1,cover degree1,one geometric component.|Retain.|
|1316|q=5,t=2:z⁵=2z,arithmetic multiplier2,geometric3; q=2:z=t,degree1 although J=G_m.|Retain.|
|1320|q=3,t=1:y³=y+1,arithmetic translation1,geometric2; q=2 equation y²−y=t has degree2.|Retain.|
|1324|d=2,b=1 in F₃: Frobenius value changes by−2=1; constant twist changes by+2=2, sum0.|Retain.|
|1327|F₉,t²=−1:Tr(t)=0,Tr(t−1)=−2=1; subtracting only one base class would give−1=2.|Retain.|
|1391|degree mod3: connected constant cover degree3,geometric components3,conductor 0. Zero maptoB=ℤ/3 gives 3 disjoint copies.|Retain.|
|1396|q=3:z²=t has conductor[0]+[∞],Swan0; q=2:z=t has conductor 0.|Retain.|
|1399|q=2:y²−y=t:group order2,geometric degree2,constant degree1,conductor 2∞; same openA¹ for moduli∞and2∞only latter works.|Retain.|
|1405|B=ℤ/4,θ=2deg: image order2,two connected components,each constant degree2; surjective geometric image would give one geometric component.|Retain.|
|1410|d=2,θ(b)=1 mod3: geometric change1,constant change2, sum0; totalθ(v)unchanged.|Retain.|
|1487|P¹/F₂:A₀,A₁,A₂=1,3,7; N₁,N₂=3,5; (1−T)^−1(1−2T)^−1 coefficients1,3,7.|Retain.|
|1489|degree2factor1/(1−T²)=1+T²+…; log derivative first contribution2T²; N₁contribution0,N₂contribution2.|Retain.|
|1492|effective degree0forces all effective coefficients0; exactly one empty divisor,A₀=1.|Retain.|
|1494|P¹/F₂:B₀=0,B₁=3,B₂=(4−2)/2=1; N₂=3+2=5.|Retain.|
|1521|q=2,n=0,1,2: (2^(n+1)−1)/(2−1)=1,3,7.|Retain.|
|1522|E/F₅,h=9:n=1 gives 9,n=2 gives 54. n=0excluded would give 0 although A₀=1.|Retain.|
|1524|real conic index2: odd degree class set empty; finite exact field degree imageℤremoves this obstruction.|Retain.|
|1553|g=0: degL=0,L₀=1,soL=1,h=L(1)=1.|Retain.|
|1554|q=5,N₁=9:L=1+3T+5T²,L(1)=9.|Retain.|
|1555|same ellipticLlead5 not 1; reversing characteristic polynomial X²+3X+5produces correct constant1.|Retain.|
|1579|E/F₅fibres2,0,2,2,2plus∞:N₁=9;α+β=−3,αβ=5,discriminant−11,absolute values√5.|Retain.|
|1581|P¹/F₂:N₁=3,N₂=5,N₃=9,all2^r+1; L=1.|Retain.|
|1582|unreversedX²+3X+5has constant5,not 1; reversed1+3T+5T²is required.|Retain.|
|1601|α²+β²=9−10=−1; N₂=25+1−(−1)=27; Lover F₂₅=1+T+25T².|Retain.|
|1603|r=1:L(T)=L(T); genus0products1=1.|Retain.|
|1605|r=2,g=1:L₂(T²)=1+T²+25T⁴=L(T)L(−T); L₂(T)would have wrong degree2 versus4.|Retain.|
|1628|g=0: degP≤0,P₀=1,empty count input⇒P=1.|Retain.|
|1629|q=5,g=1,N₁=9: a₁=9−6=3,a₂=5⇒1+3T+5T².|Retain.|
|1630|N₁=8requires a₁=2;1+3T+5T²fails3=2;1+2T+5T²satisfies it.|Retain.|
|1650|rank1,u=2: series1−2T; shift gives(1−2T)^−1=1+2T+4T²+… .|Retain.|
|1652|contractible[A→¹A],u=id:(1−T)/(1−T)=1.|Retain.|
|1654|[ℤ/4→²ℤ/4]:kernel={0,2},cokernelℤ/2,neither projective;chain series1.|Retain.|
|1703|P¹,q=3,Λ=F₂:L=1/(1−T)²=1/(1−T²),constant1 and T coefficient0;inverse cohomological determinant agrees.|Retain.|
|1704|nontrivial tame rank one inertia over field:invariants0,local det empty=1;unramified line gives(1−aT^d)^−1.|Retain.|
|1707|F₂identity on2-space:every power trace 0,det(1−TI)=(1−T)²=1+T²≠1,unlike zero dimensional space.|Retain.|
|1710|Λ=ℤ/4complex[Λ→²Λ]:chain characteristic1,cohomologiesℤ/2;forming ordinary free cohomology determinants is invalid.|Retain.|
|1714|a=3∈(ℤ/4)×,degree2:factor1/(1−3T²)=1+3T²+T⁴+…;coefficient T=0.|Retain.|
|1766|constant degree h=2:degree1Frobenius nontrivial,degree2identity;wrong coset count0exactly,correct coefficient card(C)/card(N)=1.|Retain.|
|1769|Identity F₂(t),r=1: count3, main3, error0≤√2+1. r=2: 2B₂=2, main5, error3≤6; the difference is exactly the three degree-one points.|Retain.|
|1772|geometric S₃extension:transposition class size 3,group 6,main coefficient1/2;identity class1/6. Constant quotient h=1.|Retain.|
|1837|idele net π_vat one place v→∞converges to1in additive adeles(sinceπ_v−1integral),but not in idele unit neighborhood∏O_v×.|Retain.|
|1840|G_m:degree C_K→ℤonto,soC_Knon compact;kernel degree compact.|Retain.|
|1843|F₃(t):K×∩∏O_v×=F₃×,cardinality2=q−1.|Retain.|
|1879|GL₁integral level without Ξ:Pic(P¹)=ℤ,infinite;functions allR^ℤ.|Retain.|
|1881|P¹,Ξdegree3generator:double cosetsℤ/3,functionsR³.|Retain.|
|1883|degree parity character,Ξdegree2:Q equation a=−a gives a=0;overℤ/4a=2works and constant vector(2,2)is nonzero.|Retain.|
|1922|torus proper parabolic set empty,cusp=all functions;P¹ without Ξ gives R^ℤinfinite,with degree 1 Ξ gives R.|Retain.|
|1924|GL₂constant f=1:probability average CT=1≠0,not cuspidal.|Retain.|
|1926|quotient size p:normalizing factor1/p does not exist in F_p;equation p·x=1has0=1.|Retain.|
|1928|Heisenberg p=2:card(H)=8,card(Γ)=card(J)=2;y stabilizer2or1,orbitsizes1or2in4cosets,weights1/4or1/2.|Retain;nonabelian control.|
|1958|G_m/full centre=one point;root set empty,bounded height condition is vacuous but compactness holds.|Retain.|
|1960|GL₂,diag(π^a,1):root absolute value q^−a,height−a;interval[−2,1]permits a=−1,0,1,2 only.|Retain.|
|1963|anisotropic semisimple:split rank0,root set empty;reduction theorem still requires and provides compact quotient.|Retain.|
|1994|without ΞGL₁/P¹functionsR^ℤ,even constant1has infinite support;degree 1 Ξreduces one support point.|Retain.|
|1998|finite quotient of sizeh:all basis indicator forms jointly supported on h points;bound h does not depend on coefficients or form.|Retain.|
|1999|torus,degree 1 Ξ:quotient Cl⁰cardinality h,cusp=R^h;P¹h=1 gives R,elliptic example h=9 gives R⁹.|Retain.|
|2031|finiteℤ[1/p]-module Heckeaction over Q has finite characteristic polynomial;rank1multiplier a∈ℤ[1/p]satisfies X−a=0.|Retain.|
|2032|degree character with valueπ(transcendental):Hecke uniformizer eigenvalueπ,cannot lie in any number field.|Retain.|
|2034|non flat kernel control:multiplicationℓ on ℤ[1/p]has kernel0;after mod ℓmap0has kernel F_ℓ. Flatness prevents this new kernel.|Retain as negative control,not a specific automorphic counterexample.|
|2073|degreecharacterz^deg,degree2uniformizer:Heckeeigenvaluez²;z=2 gives 4,geometric Artin character requires inversion.|Retain.|
|2075|GL₂,q_v=4:raw Satake4X₁+X₂,normalized2(X₁+X₂);atX₁=X₂=1these are5 and4.|Retain.|
|2081|P=G:N=1,δ=1,CT norm f=f;f(1)=2 gives 2on both sides.|Retain.|
|2083|ramified rank oneχ(u)=−1for some integral unit u:K-fixed vector would satisfy v=−v,over C forces v=0.|Retain.|
|2115|n=1:shift n(n−1)(g−1)=0;nonzero character at identity=1.|Retain.|
|2117|φ=0:φ(g)=0for all g;cannot witness nonvanishing.|Retain.|
|2118|n=2,g=2:correct Whittaker degree2,scalar degree−2,total0;wrong sign scalar+2 gives total4.|Retain.|
|2191|n=0or2:η^n=1,trivialχrestricts1;splitχ₀⊗χ₀^−1on(a,a)=1.|Retain.|
|2193|constant double cover:d=1inert gives degree1 over F_q²andχ=−1;d=2split gives 1+1=2 andχ=1.|Retain.|
|2196|E/F₃fibres1,0,0plus∞gives 2 points;quadratic x²+2x+2has discriminant2non square;ν*kernel class0butη=−1.|Retain.|
|2199|χ₁/χ₂onC_F=η^n/η^n=1;nontrivial unit value−1forces hyperspecial fixed vector0.|Retain.|
|2259|M=GL₁²in Borel GL₂is a torus,has no proper parabolic,but ambient Weyl groupS₂has 2 elements.|False;S04.|
|2261|q=4,s=1:first section4^−3/2=1/8;reflected exponent−s section at π has4^1/2=2 before intertwining constant.|Retain.|
|2264|GL₂determinant character on unipotent s=1,CT=1;mod centre constant function has finiteL²norm.|Retain.|
|2324|Φ(1)=1,2Φ(1)=2≠1;normalization eliminates rescaling.|Retain.|
|2325|n(b)in inducing unipotent:Φ(n(b),s)=Φ(1,s)=1.|Retain.|
|2327|q_v=4,n=1,s=0:normalizedδ^1/2χand unnormalized χ·abs(det)^1/2both give1/2;double normalization gives 1/4.|Retain.|
|2332|splitn=1constant term has identity/reflection terms,at parameters s and −s;retaining only identity loses the second term.|Retain.|
|2395|measure factor q^−n²(g−1):g=1 gives 1;g=0,n=2 givesq⁴.|Retain.|
|2396|T=0,n=1:constant term contains both Bruhat cells,soopen-cell Whittaker product alone is insufficient.|Retain.|
|2397|selfdual global measure already has quotient volume1;integralvolume measure has quotient q^(n²(g−1));using both corrections would square factor.|Retain.|
|2400|T=0,n=1:boths,−s constant terms;nonzero T kills the closed cell and permits factorization.|Retain.|
|2402|rationalα=t:product norm 1,index ᾱTαstill rational;αwith one componentπothers1has norm q_v^−1 and generally non rational transformed index.|Retain.|
|2422|Φ_v=0:integrand 0,integral 0,rational continuation 0;universal nonzero Euler factor cannot replace it.|Retain.|
|2424|Φ_v→2Φ_v:linear integral2W_v,and regular continuation2W_v.|Retain.|
|2426|unit line,n=1,s=0:Den=1,W=1−η/q;splitq=3 gives 2/3,inert gives 4/3.|Retain.|
|2485|self-dual L:L∨/L=0,type0,half length0,Den=1.|Retain.|
|2487|a=0,1,2:m=1,1−T,(1−T)(1−ηqT);q=2inert gives 1+T−2T²versus split1−3T+2T².|Retain.|
|2490|rank1Gramπ³:type1,length3 over extension,half length3;Gramπ^−1hasL not contained inL∨,quotient undefined.|Retain.|
|2493|split overlattice component lengths(1,0):total length1,half length1/2,exponent2ℓ′=1.|Retain.|
|2495|r=1:split1+T,inert1−T;r=2:split1+T+T²,inert1−T+T²;functional reciprocity matches(ηT)^r.|Retain.|
|2499|L=(O,πO),L′=(O,O):quotient length1,half length1/2,term T not T².|Retain.|
|2501|q=2split1+T,inert1−T;F₄×norm-one fibre3 elements;Tr(0),Tr(1),Tr(u),Tr(u+1)=0,0,1,1.|Retain.|
|2505|rank0:representation set one point,dimension0,density1;target m<n:generic embedding none,density0.|Retain.|
|2533|self-dual L,Den=1:W=L_n,v(s)^−1;rank0empty product1.|Retain.|
|2534|s=0:W=L_n,v(0)^−1Den(1,L)=raw rank n density;inert odd length line Den(1)=0.|Retain.|
|2536|s=j=1:correct T=q^−2interpolates rank n+2;incorrect q^−1interpolates n+1.|Retain.|
|2572|g_X=1:q^−n²(g−1)=1.|Retain.|
|2573|all selfdual lattices:every Den_v=1,global finite product1.|Retain.|
|2574|degree2place:localq_v=q²,substitution T²;rank1split Den=1+T²not 1+T.|Retain.|
|2576|n=1,g_X=2,geometric double cover:g_X′=3,degω_X′=4;twisted dual degree4−deg E versus−degE,shift4.|Retain.|
|2578|constant double cover,line exact degree1:base-k degree2,norm(q²)¹=q²;using degree1would give q.|Retain.|
|2607|χrestricted toC_F=η^n,kills norms:χ(α)χ(ᾱ)=1,henceχ(ᾱ)^−1=χ(α);S=∅gives spherical formula.|Retain.|
|2609|α=1:χ(1)=1,norm 1;doubling one local section doubles E_Tand the product.|Retain.|
|2611|movegoodvintoS:old factor L_n,v^−1Den_v=new W_v;all other factors identical.|Retain.|

## Section targets, definitions and API computations

This inventory covers the 42 numbered target sections, including their definitions and API equations. The detailed Checks above distinguish signs, converse directions, zero/boundary cases and plausible wrong models. These section rows additionally record cases not supplied as Checks, including purely inseparable polynomial subrings, nonreduced coefficients and nonabelian Frobenius classes. Generic prerequisites remain with their named owners; a theorem's source citation is not counted as a formal supplier.

| Section; target and context | Additional instance / values of constructions or formulas | Result; change |
|---|---|---|
|0.1; degree comparisons; finite exact constants|At degree2 place v, div(a)=[v] has degree2, norm q^−2, Yu degree−2; principal t has degree0. r=2 completion factor degree1 at v, not2.|S06; other conventions sound.|
|0.2; degree-one divisors|Degree image generated by2,3 contains3−2=1; this conclusion does not produce a positive divisor of degree1. Over ℝ-conic it is2ℤ.|Sound.|
|0.3; Cl⁰ and Pic⁰(k)|P¹:0≃0; elliptic E/F₅:both groups have9 elements. Real conic Pic classes2ℤ→ℤ has cokernelℤ/2.|Sound finite-field comparison, ordinary Picard objects imported.|
|1.1; chartIdeals, inverse intersection, pole/principal shifts; all k|P¹,x=t,D=0: ideal pair(O_fin,O∞); adding r∞ changes second ideal to t^−rO∞, inverse to t^rO∞. div(t) gives(tO_fin,tO∞). In characteristic2, x=t² still gives finite chart basis{1,t} overk[x] without separability.|Sound; S08 formatting.|
|1.2; reduced basis, uniqueness of invariants, dimension/sum; all k|P¹,x=t²,D=0: d=(0,−1), basis{1,t}; r≥0 dimensions(r+1)+r=2r+1=ℓ(2r∞). This works in characteristic2 where the extension is inseparable. d-sum−1=degD+1−2.|Sound mathematics; missing native headline S03.|
|2.1; A(D), compactness, intersection, H¹ quotient, indices|P¹,D=−2∞: dim quotient=ℓ(0)=1; D=−∞ gives0. D′−D=[v],d_v=2: quotient cardinalq². Full compact lattice vs omitted infinity gives finite/infinite intersection.|Sound comparison using AL additive adeles.|
|2.2; self-dual volume, quotient volume, differential rescaling|Local additive pairing from π^n dπ has O-volume q_v^−n/2. n=−2 givesq_v, n=2 gives1/q_v. Product quotient volume1; replacingωbyfω multiplies local volumes by abs(f)_v^1/2, global product1.|Sound supplied normalization.|
|2.3; annihilators, translated Fourier transform, inversion|For local ψ with conductorO, Fourier of1_(c+O) isψ(cy)1_O(y); positive kernel forces positive phase. Applying twice evaluates at−x. Characteristic2 makes reflection identity but q=3 distinguishes it.|Sound.|
|3.1; ℘, Q_n, topology, extension and character classification|F=F_p,n=2: Q₂=ℤ/p². Classp has order p and trivial projection Q₁, hence extension degree p; a unit has order p². Classes1 andu (u unit) generate same cyclic subgroup; classes(1,0),(0,1) in independent AS directions generate different degree-p fields.|Sound; S07 acceptance omission.|
|3.2; reduced Laurent representatives and vanishing criterion|At p=3, T^−6≡T^−2; positive-valuation Witt vectors are coboundaries; constant trace-zero class vanishes. A reduced nonzero unit coefficient at pole2 cannot be a coboundary; unbounded pole support is allowed when coefficients tend p-adically to0.|Sound general reduced representative, not an algorithm.|
|3.3; one-pole cover/Witt comparison|p=3,m=2: different6,g=1,conductor3; class ramified at0, split at∞. Adding independent constant1 leaves a degree3 diagonal subfield, whereas adjoining both classes gives degree9 with group(ℤ/3)².|Sound; no duplicate genus theorem.|
|4.1; LT group, torsion, field/norm, Artin comparison|Q=2,f=πX+X²: first nonzero torsion rootπ is already in K; m=2 gives degree2. Q=3,m=2 gives degree6. Unit u=2 mod5 acts as3 under arithmetic Artin; relative ord(x)=2 gives unramified degree2.|Sound all local fields; supplied FormalGroup does not imply commutativity, constructed group does.|
|4.2; existence/norm correspondence, injectivity|Norm subgroup K× gives trivial extension; ord^−1(2ℤ) gives unramified quadratic; π^ℤU² inF₂((π)) gives wild degree2. Intersection of all π^rℤU^m is{1}, so Artin kernel1.|Sound; ClassFieldTheory's equal-characteristic p-gap is filled here.|
|4.3; Schmid–Witt pairing, formula, norm kernels|n=1,p=3: [T^−1,1−T)=−1=2; [1,T)=1; [T^−1,T)=0. Class0 has full norm kernel; nonzero AS class gives index p kernel. Under coordinate change T↦aT residues and Artin pairing agree.|Sound arithmetic normalization.|
|4.4; conductors, upper filtration, discriminant|p=3,n=2,c₂ unit: conductor7; c₂ divisible by3once:3. x=β+3[T^−4]: inertia3ℤ₃ at r=1, unramified first layer; missing clamp would giveℤ₃. Constant-only extension has conductor0.|Sound with source corrections.|
|4.5; finite ray quotients, conductor bounds, coordinates|P¹,m=2∞,q=3: degree-zero groupF₃; adding degree mod2 gives order6. Character from T^−1killsU²but no tU¹. At∞,t↦T^−1; transformed differential dt↦−T^−2dT.|Finite-field ownership conflict S01; formulas sound.|
|4.6; rigidified Picard, unit sequence, dimension, base change|m=2∞ overk[ε]/ε²: rigidifications1+bT multiplybyb+c, preserving nilpotents. J_m dimension g+degm−1=1 forP¹. Single degree2point gives1-dimensional torus, not0. Empty modulus uses ordinary Pic.|S01 generic rigidification already owned; additional scheme/structure comparisons may remain.|
|4.7; Abel map, modulus predicate, high-degree fibres, universal property|OnP¹,modulus2∞,mapt toG_a: congruences mod T²annihilateevaluation, congruence mod T does not (div((t−1)/t) gives1). Abel fibre dim n−1; n=2 affine line not étale simply connected in char p.|Fixed-modulus universal property is the additional theorem here; import its geometric inputs.|
|4.8; ray-class/Picard rational-point isomorphism|P¹,m=2∞: divisor[c]−[0] gives coordinate c; unit1+bT gives inverse rigidification1−bT, coordinate b. Degreeone class exists without rationalpointassumption.|S01; arithmetic signs sound.|
|4.9; Lang pullback, deck group, connectedness, Frobenius|G_a/F₃:Lang(y)=y³−y; overt=1,φ(y)−y=1. G_m/F₅:Lang(z)=z⁴;t=2 givesφ(z)/z=2. Changing a byb changes degree-d value by−db.|S01; no inseparable Lang map (derivative−1).|
|4.10; arbitrary finite abelian torsors, constant twists, least modulus|B=ℤ/4,θ=2deg:2connected components,each constant degree2; θsurjective andθ(C⁰)=B gives geometric connectedness. q=2multiplicative Lang cover identity has least modulus0, additive cover has least modulus2∞.|S01; retain explicitly new finite-group formulation only.|
|5.1; effective counts, Euler product, divisor/log derivative, point counts|F₂(t),B₁=3,B₂=1,B₃=2 givesN₃=9,A₂=7; recurrence2·7=3²+5. Zero-degree place set empty, A₀=1, N₀total definition0not geometric pointcount.|Sound headline native.|
|5.2; large-degree counts|Elliptic q=5,h=9,n=1:each degree1class has dim1,hence(5−1)/(5−1)=1effective divisor; total9. n=0excluded and would incorrectly give0instead1.|Sound.|
|5.3; numerator, degree, functional equation, class number|E/F₅:L=1+3T+5T²; 5T²L(1/(5T))=L(T). L(1)=9,degree2,constant1. g=0:L=1satisfies all bounds.|Sound.|
|5.4; scheme/Jacobian identification|E/F₅:Frobenius characteristic polynomial X²+3X+5, reversal1+3T+5T²; actual complex roots absolute value√5. Both count9rational points.|Sound use of owner WeilConjectures and DWP.|
|5.5; constant extension|Degree2extension:α²+β²=−1,N₂=27; L₂(T²)=L(T)L(−T)=1+T²+25T⁴. OverF₅[u]/(u²−2),13affine x-values give2points,12give0,plus∞=27.|Sound.|
|5.6; polynomial-data predicate and uniqueness|g=2,q=2,N₁=3,N₂=5:Newton a₁=0,a₂=0,symmetry a₃=0,a₄=4,soP=1+4T⁴. No existence claimed for arbitrary N. q=1,g=0stillP=1.|Sound; delete two Lean mirrors S05.|
|5.7; characteristic series, finite local factors, cohomological L|Λ=F₂,identity rank2:traces0butdet1+T²; a logarithmic-derivative proof would fail. Λ=ℤ/4,[Λ→²Λ]has chain series1and non projective cohomology. Inertia-invariant stalk flatness is essential over rings.|Sound determinant route and projectivity hypotheses.|
|5.10; quantitative degree-Chebotarev|Identity P¹/F₂,r=1: count3, main3, error0≤√2+1. At r=2:2B₂=2, main5, error3≤6. Constant degree2: wrong parity count0. Geometric S₃: transposition proportion3/6, 3-cycle proportion2/6; normalize by the geometric group when constants grow.|Sound; r≥1 avoids division by0.|
|6.1; affine adelic points, topology/restricted product, discrete diagonal|G_m points embed intoA² via(x,x^−1), not merely A. Nonreducedα_p in char p has only identity over all field and adelicpoints; generic-groupdiscretenessdoesnotrequire smoothness. GL₁stabilizersizeq−1.|Sound finite-type affine scope; no non-quasi-separated objects admitted.|
|6.2; automorphic function and central-character modules|P¹/GL₁,Ξdegree2:quotient2points,R-module R². Admissibledegreeparityχconstant function over Q forced0,overℤ/4constant2survives. ZeroR gives zero module.|Sound all commutative coefficients at this definition.|
|6.3; probability constant terms, cuspidality, parabolic iteration|GL₂constant1averages1. Heisenberg F₂double quotient orbit weights1/4and1/2,not uniform; normalizing requires p invertible. Torus cusp condition empty; P=G constantterm identity.|Sound; raw and normalized operators distinguished.|
|6.4; reduction, uniform compact support, finite module, flat base change|GL₁/P¹ withΞdegree1:cuspR,uniform one support point. RemoveΞ:cuspR^ℤ and constant1not compactly supported. A finite-support kernel over Noetherian R is finite; tensor with flat S preserves kernel.|Sound; reduction input owned explicitly after repair.|
|6.5; models and algebraicity|Unramified degree character uniformizer value a∈Q has polynomial X−a; transcendental valueπcannot be over number field. Non flat modℓcan enlarge kernels0→F_ℓ.|Sound scope; no transcendental central character descent.|
|6.6; Hecke and Satake compatibility|GL₂,q=4:raw4X₁+X₂; normalized2(X₁+X₂), reflectingWeylinvariance. P=G:δ=1and CT identity. Square-root choice is explicit; no integral√q assumed.|Sound.|
|6.7; Yu nonvanishing|n=2,g=2:Whittaker diagonal has valuation degree−2,Yu degree+2; scalar power−1has Yu determinant degree−2;total0. n=1shift0; zerovectorcannotwitness.|Sound repaired sign and nonzero hypothesis.|
|7.1; obstruction, arithmetic sign and finite-ramification extension|E/F₃:Pic pullback kills P−O,butinertfibrePandsplitfibreOgiveη=−1. Even n removes obstruction. Constant cover extension character(−1)^exact degree works; finite-ramified extension uses closed idele-class image.|Sound; false source universal-existence claim excluded.|
|7.2; general/discrete continuation, induction and Siegel series|P=G denominator1; split GL₂fixed centreμ₂not connected; Borel has2Weyl terms. n=0trivial group,E=1. q=4,n=1,s=0section value1/2under both correct induction conventions.|S02,S04; other normalization sound.|
|7.3; global/local Fourier coefficients and covariance|Split local n=1, α=(π,1): norm q^−1, Jacobian q^−1, combined factor q^(s−1/2). Global rational α has product norm1; an adelic α need not preserve rational T. T=0 has an additional Bruhat cell.|Sound specified domains.|
|7.4; densities, interpolation, overlattices, functional equation|q=2,split Gramπ:Den=1+T;inert:1−T; both rank0give1. Denominator1−(ηq)^−(i+j)nonzero for i≥1. Split quotient component lengths(1,0)give half length1/2but exponent1.|Sound all-characteristic extension proof uses trace, not division by2.|
|7.5; local Whittaker–density identity|s=j=1 substitutes q^−2 and rank n+2; n=1selfdualcasegivesW=1−ηq^−3. At s=0,inert Gramπ hasDen(1)=0 andW=0.|Sound.|
|7.6; spherical and general global coefficients|g=0,n=1factor q;g=1factor1. Constant quadratic cover degree1overF_q²means base-k degree2,normq². AddinggoodvtoSreplacesL_v^−1Den_vbyidenticalW_v; doubling one flat section doubles both sides.|Sound at regular parameters; no spherical assumption for ramified data.|

## Auxiliary statement computations

These rows separate the named auxiliary statements that share a section in the preceding inventory. They inherit that section's hypotheses; “retain” records truth on the displayed instance, while the corresponding source and dependency qualifications still apply. Headline and acceptance declarations already have individual rows above.

| Statement; section | Computed instance | Result; change |
|---|---|---|
|degree_conventions(1);0.1|div(t)=[0]−[∞], degree1−1=0.|Retain.|
|degree_conventions(2);0.1|A degree-two uniformizer idele has divisor degree2, Yu degree−2, norm q^−2.|Retain.|
|degree_conventions(3);0.1|F₂(t)/F₂ has constant degree1 in both descriptions; F₄(t)/F₂ has degree2 and fails exactness in both.|Retain.|
|divisorClass_picardPoints;0.3|P¹ degree-zero classes and Jacobian points both have one element; E/F₅ both have9.|Retain.|
|chartIdeals;1.1|D=2∞ gives (k[t],t^−2O∞); D=−∞ gives (k[t],tO∞).|Retain mathematics; S08.|
|riemannRochSpace_eq_inf_chartIdeals;1.1|Inverse intersections for those two divisors have bases(1,t,t²) and empty, dimensions3 and0.|Retain.|
|chartIdeals_add;1.1|∞+∞ maps to t^−2O∞=(t^−1O∞)²; zero divisor maps to the two unit ideals.|Retain.|
|chartIdeals_add_poles;1.1|x=t,r=2: adding2∞ multiplies the infinity ideal by t^−2; adding2[0] multiplies the finite ideal by t².|Retain.|
|chartIdeals_principal;1.1|div(t) maps to (t k[t],tO∞), with the same generator t.|Retain.|
|exists_reducedBasis;1.2|Rank0: empty bases, invariant sum0. Rank1: M_fin=k[x], M∞=x²O∞ has v=1,d=2.|Retain general lattice existence.|
|reducedBasis_unique;1.2|Elliptic dimensions at r=0,1,2 are1,2,4; first differences1,1,2 recover thresholds0,2 and invariants0,−2.|Retain.|
|reducedBasis_shift;1.2|Elliptic D=0 invariants0,−2; adding poles(x) gives1,−1 and dimension2.|Retain.|
|reducedBasis_dim;1.2|At D=0, max(0,1)+max(0,−1)=1; at D+2poles(x),3+1=4.|Retain.|
|reducedBasis_sum;1.2|Elliptic n=2:0−2=0+1−1−2. Constant degree2, exact genus2 gives degD−2−n.|Retain.|
|reducedBasis_principal;1.2|D=0,f=t on P¹: L(−div t)=span(t); invariant0 unchanged, basis1 becomes t.|Retain.|
|divisorLattice;2.1|At a coefficient D_v=−1, the local lattice is πO and contains0, excludes1.|Retain; S08.|
|divisorLattice_isCompactOpen;2.1|D=0 gives the product of integral rings; adding one pole replaces O_v by π^−1O_v, a finite union of q_v open cosets.|Retain.|
|divisorLattice_inter_diagonal;2.1|On P¹,D=0, both sides are k, dimension1; D=−∞ gives{0}, dimension0.|Retain.|
|divisorLattice_quotient;2.1|On P¹,D=−2∞ the quotient dimension and ℓ(W−D)=ℓ(0) are1; D=−∞ gives0.|Retain.|
|divisorLattice_mono;2.1|0≤[v] gives O_v⊆π^−1O_v; reversed inclusion fails on π^−1.|Retain.|
|divisorLattice_add;2.1|Multiplication by t at v=0 sends O_v to tO_v=A(−div t)_v; at∞ it sends O∞ to π∞^−1O∞.|Retain.|
|divisorLattice_index;2.1|One degree-two pole step at q=2 has quotient F₄, index4=2².|Retain.|
|selfDual_local_volume;2.2|n_v=2,q_v=4: volume1/4 and annihilator volume4, product1.|Retain.|
|selfDual_global_volumes;2.2|P¹,D=m∞: volume q^(m+1); m=0 givesq, quotient volume1.|Retain.|
|selfDual_change_differential;2.2|dt→t dt changes volumes at0,∞ by q^−1/2 and q^1/2; product1.|Retain.|
|selfDual_annihilator_local;2.2|ω=π²dπ gives annihilator π^−2O; pairing O with π^−3 produces a possible nonzero residue.|Retain.|
|selfDual_integralVolume_ratio;2.2|g=0 gives ratioq; g=1 gives1, agreeing with degree of the canonical divisor.|Retain.|
|fourier_indicator_divisorLattice;2.3|P¹/F₂,D=0 gives transform2 times the indicator of A(−2∞); at0 both sides2.|Retain.|
|translated Fourier identity;2.3|For a conductor-O character, translating1_O by c multiplies its transform by ψ(cb); the inverse convention gives ψ(−cb). Over F₃ these differ when cb=1.|Retain positive phase.|
|testFunctions_span_translates;2.3|Indicator of1+πO over F₃ changes under scalar2, whereas every unshifted lattice indicator is scalar invariant.|Retain; translations necessary.|
|Witt trace truncation;3.1|Degree-p extension at n=1 has trace(−y^(p−1))=1; truncating any n=2 trace to n=1 gives that same additive trace.|Retain; S07 adds exactness headline.|
|ASW additivity;3.1|p=2,n=2, ℘(t,0)=(t²+t,t²+t³); Witt subtraction, rather than coordinate subtraction, supplies t³.|Retain.|
|ASW field classification;3.1|Nonzero a and2a over p=3 span the same subgroup and give the same cubic field; independent a,b give distinct degree3 subfields in a degree9 compositum.|Retain.|
|ASW functoriality/localization;3.1|The class t^−1 over F_p(t) has conductor2 at0 and trivial local class at∞, where it has positive valuation.|Retain.|
|ASW infinite duality;3.1|For F_p, Q_n=ℤ/p^n and Q∞=ℤ_p; Hom_cont(Ẑ,ℤ_p)=ℤ_p. Algebraically closed F gives0 on both sides.|Retain specified topologies.|
|aswReduced_exists_unique;3.2|At p=3, T^−6 reduces to T^−2; a nonzero coefficient at reduced pole2 cannot be removed. Integral positive-valuation vectors reduce to0.|Retain.|
|aswReduced_class;3.2|β+p[T^−m] reassembles a constant first layer and a ramified second layer; setting both coefficients0 gives class0.|Retain.|
|aswReduced_unramified;3.2|β alone gives an unramified degree-p first layer; T^−1 gives conductor2, so fails the zero-pole-coefficient condition.|Retain both directions.|
|aswReduced_primitive;3.2|x=β+p[T^−m]: n₀=0,n_c=1, first layer unramified degreep, subsequent step ramified degreep. x=pβ gives degrees1,p at lengths1,2.|Retain.|
|aswReduced_changeUniformizer;3.2|T′=aT sends T^−1 to a(T′)^−1, so the equation and extension are unchanged after substitution.|Retain.|
|artinSchreier_onePole_comparison;3.3|p=3,m=2: genus1, different6, conductor3; p=2,m=1: genus0, different2, conductor2.|Retain.|
|LubinTate.formalGroup;4.1|In equal characteristic, f=πX+X^Q is additive and F_f(X,Y)=X+Y.|Retain.|
|LubinTate.smul;4.1|Linear coefficients of [a]∘[b] and [ab] both ab; [π]=f has linear coefficientπ.|Retain.|
|LubinTate torsion carrier;4.1|Q=2,m=0 gives{0}; m=1 for πX+X² gives{0,π}, cardinal2.|Retain.|
|lubinTate_torsion;4.1|Q=3,m=2: torsion cardinal9, primitive elements6, field degree6, Galois units cardinal6.|Retain.|
|LubinTate.formalGroup_isComm;4.1|For the additive example X+Y=Y+X; a bare Mathlib FormalGroup does not impose this axiom.|Retain construction-specific claim.|
|LubinTate.smul_apply_linear;4.1|[0] has coefficient0, [1] has1, [π] hasπ; no division by π is asserted.|Retain.|
|LubinTate.iso_of_series;4.1|For f=g the tangent-one commuting isomorphism is identity; a scalar [u] with u≠1 has derivativeu and is excluded.|Retain uniqueness normalization.|
|LubinTate.torsion_equiv;4.1|Q=2,m=1: the module has2 elements, matching O/π; m=2 has4.|Retain.|
|LubinTate.field_degree;4.1|Q=2,m=1 gives1, m=2 gives2; Q=3,m=2 gives6.|Retain m≥1.|
|LubinTate.field_galois;4.1|Q=3,m=1: both the Galois group and residue units are cyclic of order2.|Retain.|
|LubinTate.norm_uniformizer;4.1|Q=3,m=1, α²=−π: norm α=−α²=π. Q=2,m=1 is the identity extension.|Retain sign.|
|LubinTate.relative;4.1|ord(x)=2,Q=3,m=2: unramified degree2, ramified degree6, total12, norm degrees2ℤ.|Retain tied unramified degree.|
|localKroneckerWeber;4.2|The quadratic unramified extension lies in K^ur; the degree2 wild LT extension over F₂((π)) lies in K_π; their intersection is K.|Retain.|
|local abelian existence;4.2|H=K× gives degree1; H=π^ℤU² over F₂((π)) gives index2 and the wild quadratic field.|Retain.|
|injective_artinMap_all;4.2|A nonzero valuation is detected modulo some r; a nontrivial unit has a first nonzero jet detected modulo U^m. Intersection kernel={1}.|Retain.|
|lubinTate_artin;4.2|u=2 mod5 acts on torsion by multiplication3, while π acts trivially on torsion and by arithmetic Frobenius on K^ur.|Retain.|
|schmidWitt;4.3|At n=1,p=3, [1,T)=1 and [T^−1,1−T)=−1=2.|Retain.|
|schmidWitt_perfect;4.3|T^p is killed at length1 but represents nonzero valuationp in the pro-p completion; hence only the finite quotient pairs perfectly at length1.|Retain.|
|schmidWitt_characterization;4.3|For constant1, [1,T)=Tr(1); for T^−1, [T^−1,T)=0. Replacing the whole pairing by its negative fails the first law at p=3.|Retain.|
|schmidWitt_formula;4.3|T^−1dlog(1−aT) has residue−a; 1·dlog T has residue1. Tr over F₃ preserves both.|Retain.|
|schmidWitt_normGroup;4.3|B=0 has annihilator K× and trivial field; B generated by T^−1 has index-p annihilator and degree-p field.|Retain.|
|aswConductor_eq;4.4|p=3,n=2,pole2: unit coefficient gives7; valuation1 coefficient gives3; no poles gives0.|Retain.|
|aswUpperRamification;4.4|x=β+3[T^−4], r=1: v(c)=1 and clamp0 give bound1, inertia3ℤ₃; unclamped logarithm gives bound0.|Retain corrected clamp.|
|aswConductor_compositum;4.4|Length-one pole1 and pole2 at p=3 have exponents2,3; the compositum exponent is max(2,3)=3.|Retain.|
|aswConductor_lengthOne;4.4|Largest reduced pole2 gives3; a constant-only nonzero class gives0, not1.|Retain.|
|rayIdeleClassGroup;4.5|P¹,m=0 givesℤ; m=2∞ over F₃ has degree-zero subgroup F₃ and degree quotientℤ.|S01 ownership; values sound.|
|rayIdeleClassGroup_degree_exact;4.5|P¹,m=2∞: kernel of degree has3 elements and degree imageℤ; quotient by2a has6 elements.|S01.|
|RayCharacterData;4.5|P¹,m=0,r=3: quotientℤ/3, a chosen faithful cubic character has image3; replacing it by the trivial character has image1.|Retain explicit quotient isomorphism.|
|rayCharacterData_conductor;4.5|The additive character T^−1 has least exponent2; the degree character has exponent0.|Retain.|
|rayCharacterData_sound;4.5|A character of the six-element quotient above has image order dividing6; no infinite-image degree character is admitted.|Retain.|
|rayCharacterData_conductor_minimal;4.5|T^−1 kills U², while [T^−1,1−T)=−1≠0 detects U¹.|Retain.|
|rayCharacterData_unramified;4.5|Constantβ kills every unit and has exponent0; a nontrivial tame character kills U¹ but not O× and has exponent1.|Retain both directions.|
|rayCharacterData_constantValue;4.5|θ=degree mod3 gives θ(a)=1; replacing a by degree-zero b+a changes that value by θ(b), which is0 for this character.|Retain with chosen splitting.|
|schmidWitt_localCoordinates;4.5|At∞, t↦T^−1; dt↦−T^−2dT. The residue and conductor remain unchanged.|Retain.|
|schmidWitt_changeParameter;4.5|T′=aT gives residue of T^−1dlog(1−bT) equal to−b in both coordinates.|Retain.|
|localCoordinates_truncation;4.5|Modulo T², (1+T)²=1 in characteristic2 and1−T in characteristic3; the truncated coordinate ring preserves each product.|Retain.|
|rigidifiedPicardFunctor;4.6|Over k[ε]/ε² and m=2∞, rigidifications1+bT form the full additive group including b=ε; every rigidified scalar automorphism is1.|S01 generic owner.|
|generalizedPicard;4.6|P¹,m=2∞: each component is an affine-line torsor, dimension1; empty modulus gives a point in each degree.|S01.|
|generalizedJacobian;4.6|P¹: m=0 gives0, m=0+∞ gives G_m, m=2∞ gives G_a.|S01.|
|generalizedPicard_representable;4.6|For m=2∞, g+N−1=0+2−1=1; for m=0 the dimension isg=0, not−1.|S01.|
|generalizedPicard_tensor;4.6|Rigidifications(1+bT)(1+cT)=1+(b+c)T; inverse1−bT; unit1.|S01.|
|generalizedPicard_torsor;4.6|On the additive component, the action isomorphism sends (b,c) to(b+c,c), inverse(d,c)=(d−c,c).|S01.|
|generalizedPicard_baseChange;4.6|A degree-two reduced modulus splits into two geometric points, giving torus rank1 over the splitting field; dimension remains1.|S01.|
|generalizedPicard_forgetModulus;4.6|On P¹ the map for2∞→∞ sends G_a to0; 3∞→2∞→∞ composes to the same zero map.|S01.|
|generalizedJacobian_linearPart;4.6|For2∞, (k[T]/T²)×/k×=1+Tk≃G_a; for0+∞ it is(k×)²/k×≃G_m.|S01.|
|rayAbel;4.7|On P¹ with2∞ and coordinate−b for1+bT, c maps to c; with0+∞, c maps to c in G_m.|S01 finite-field owner; signs sound.|
|rayAbel_baseChange;4.7|c=2∈F₅ maps to2 before and after F₂₅ base change; its inverse convention would give3.|S01.|
|rayAbel_forgetModulus;4.7|For2∞→∞ the coordinate c is forgotten, giving the single ordinary degree-one class.|S01.|
|rayAbel_symmetricPower;4.7|For2∞ the pair{c,d} maps to c+d in degree2; n=0 gives0, n=1 gives c.|Retain.|
|rayAbel_affineBundle;4.7|P¹,N=2: n=1 fibre dimension0, n=2 dimension1. Elliptic N=1,n=1 falls below threshold2 and misses the removed point's class.|Retain bound.|
|HasRayModulus;4.7|The map t:A¹→G_a kills principal relations congruent1 mod2∞; the modulus∞ relation div((t−1)/t) evaluates1 and is not killed.|Retain fixed-modulus extension.|
|rayAbel_rosenlicht;4.7|For t:A¹→G_a and2∞ the factor is identity; the zero homomorphism would give constant0 and fails at t=1.|Retain unique factorization.|
|HasRayModulus.baseChange;4.7|The preceding nonzero evaluation1 remains1 after any algebraically closed extension; the modulus2∞ relation remains0.|Retain.|
|HasRayModulus.comp;4.7|Composing t with multiplication2 changes evaluations1→2; in characteristic2 it becomes0 and admits smaller modulus0.|Retain; no converse claimed.|
|HasRayModulus.mono;4.7|Congruence1 mod3∞ implies1 mod2∞, so every relation killed for2∞ is killed for3∞; the converse modulus∞ fails.|Retain direction.|
|rayAbel_rosenlicht_unique;4.7|An additive map factoring t and agreeing on every c must send c to c; scalar2 fails at1 in characteristic3.|Retain.|
|rayPicard_comparison;4.8|For P¹,mod2∞, a degree-zero divisor[c]−[0] maps to c; addition of divisors corresponds to addition of coordinates.|S01.|
|rayPicard_degreeZero;4.8|P¹/F₃,mod2∞: both groups have3 elements and c↦c.|S01.|
|rayPicard_degreeOne;4.8|Over F₃ the chosen degree-one fibre is a torsor with3 points; a class v₃−v₂ still has degree1 without being effective.|S01.|
|rayPicard_localUnits;4.8|Unit1+bT has inverse rigidification1−bT, giving coordinate b, whereas the direct boundary has coordinate−b.|S01; inversion retained.|
|rayLangCover;4.9|For2∞ it is y^q−y=t; for0+∞ it is z^(q−1)=t.|S01.|
|rayLangCover_equation;4.9|At q=3,t=1, y³−y=1; arithmetic Frobenius translates y by1.|S01.|
|rayLangCover_isTorsor;4.9|The additive Lang polynomial has derivative−1 and q roots per geometric fibre; its translations by F_q act simply transitively.|S01.|
|rayLangCover_trivialKernel;4.9|P¹,m=0 gives group0 and identity cover; q=2 multiplicative Lang also has kernel1 and identity cover.|S01.|
|rayLangCover_forgetModulus;4.9|For2∞→∞ the additive q-sheeted cover maps to the identity cover via the base coordinate.|S01.|
|rayLangCover_frobenius;4.9|At q=3,d=2, sum x+x³ is the trace; changing a by1 subtracts2, rather than1.|S01.|
|ideleClasses_away_dense;4.9|Over F₃(t), S={0,∞}, the jet1+t mod t² is matched by f=1+t. Dividing gives residual jet1; the remaining zero at−1 is outside S.|Retain finite-precision calculation.|
|rayLangCover_artin;4.9|On a degree-zero class b, b−0a=b; on a, a−1a=0. Thus the image contains all of A.|S01.|
|rayLangCover_geometricallyConnected;4.9|For y³−y=t, degree-zero Artin image is all F₃, constant quotient0, geometric components1.|S01.|
|finiteRayLangCover;4.10|B=ℤ/4,θ=2deg: two connected components, each the constant quadratic cover.|S01 scope qualification.|
|finiteRayLangCover_map;4.10|Push θ=degree mod4 toℤ/2 gives degree mod2; the constant degree4 cover pushes to degree2.|Retain.|
|finiteRayLangCover_generic;4.10|The generic character of the constant degree3 cover sends a degree-one uniformizer to1 mod3.|Retain.|
|finiteRayLangCover_forgetModulus;4.10|A degree character kills all units, so construction at2∞ and at0 gives the same constant cover.|Retain.|
|finiteRayLangCover_choiceIndependent;4.10|At d=2,B=ℤ/3, changing the origin by b with θ(b)=1 changes the geometric part by−2 and the constant part by+2, total0.|Retain isomorphism class, not unique isomorphism.|
|finiteRayLangCover_classifies;4.10|Zero θ toℤ/3 gives three trivial copies; surjective degree mod3 gives one connected constant cubic cover.|Retain disconnected case.|
|finiteRayLangCover_connected;4.10|θ=2deg intoℤ/4 has image2 and index2, hence two components; θ=deg has image4 and one component.|Retain iff.|
|finiteRayLangCover_geometricallyConnected;4.10|A constant cubic cover has θ(C⁰)=0 and three geometric components; additive Lang has full geometric image and one.|Retain iff.|
|finiteRayLangCover_normGroup;4.10|Constant cubic extension has norm degrees3ℤ and class index3, matching kernel(degree mod3).|Retain.|
|rayLangCover_conductor;4.10|Tame z²=t over F₃ has exponent1; additive y²−y=t over F₂ has exponent2; degree characters have0.|Retain.|
|rayLangCover_modulusFactor;4.10|The additive quadratic character factors through C_(2∞), not C_∞; the underlying open curve is A¹ in both cases.|Retain corrected iff.|
|pointCount_eq;5.1|F₂(t),r=2: three rational places plus two points from the degree-two place give5 points over F₄.|Retain.|
|counting API constant extension;5.1|For P¹/F₂,r=2,s=3: N₂ over F₈=8²+1=65=N₆ over F₂.|Retain.|
|counting API Möbius inversion;5.1|r=2 over F₂:2B₂=N₂−N₁=5−3=2; r=3 gives3B₃=9−3=6.|Retain.|
|effectiveDivisorCount_eq;5.2|Elliptic q=5,n=0: the trivial class contributes1, the other eight classes0, total1. At n=1 all9 classes contribute1.|Retain.|
|lPolynomial;5.3|P¹ numerator1; E/F₅ numerator1+3T+5T².|Retain mathematics; S08 formatting.|
|zeta_eq_schemeZeta;5.4|On P¹/F₂, both closed-point products have coefficients1,3,7; both numerators1.|Retain supplied comparison.|
|Jacobian/Frobenius comparison;5.4|E/F₅ has characteristic X²+3X+5, reversed1+3T+5T²; value at1 is9 on both sides.|Retain.|
|Weil count consequence;5.4|E/F₅: N₁−6=3, and3≤2√5; P¹ discrepancy0 with genus0.|Retain supplied bound.|
|lPolynomial_constantExtension;5.5|E/F₅,r=2: L₂(T²)=1+T²+25T⁴=L(T)L(−T).|Retain.|
|zeta_constantExtension;5.5|P¹/F₂,r=2: both sides equal1/((1−T²)(1−4T²)).|Retain.|
|recovery of h and all counts;5.6|q=5,g=1,N₁=9 determines a₁=3,a₂=5,h=9; recurrence gives N₂=27.|Retain.|
|characteristic series representative independence;5.7|Adding the identity contractible complex multiplies by(1−T)/(1−T)=1.|Retain imported determinant bridge.|
|characteristic series base change;5.7|1−3T overℤ reduces to1−T over F₂, the characteristic series of multiplication1.|Retain.|
|characteristic series triangle multiplicativity;5.7|Two rank-one factors with eigenvalues2,3 give(1−2T)(1−3T)=1−5T+6T², matching their direct sum.|Retain.|
|characteristic series shift;5.7|Shift of eigenvalue2 gives(1−2T)^−1, product with the unshifted complex1.|Retain.|
|localEulerFactorFinite;5.7|Inertia-invariant rank0 gives1; an unramified rank-one eigenvalue3 overℤ/4 gives1−3T.|Retain projective stalk requirement.|
|localEulerFactorFinite_field;5.7|The preceding polynomial modulo2 becomes1−T, the ordinary one-dimensional field determinant.|Retain.|
|localEulerFactorFinite_unramified;5.7|Inertia identity leaves all of V; eigenvalues1,1 over F₂ give(1−T)²=1+T².|Retain.|
|localEulerFactorFinite_liftIndependent;5.7|Over F₅, inertia diag(1,−1) fixes e₁; lifts diag(2,3) and diag(2,−3) both induce2 on that line, hence factor1−2T.|Retain.|
|localEulerFactorFinite_constantCoeff;5.7|At T=0 the matrix is identity, determinant1 in every commutative coefficient ring.|Retain README API only.|
|lFunction_cohomological;5.7|P¹,q=3,Λ=F₂: both sides1/(1−T²). Trace of rank2 identity is0 but its determinant1+T², excluding a traces-only proof.|Retain; S09 inventory.|
|lFunction_cohomological_projective;5.7|Over a field, P¹ has H⁰ eigenvalue1, H² eigenvalueq and H¹=0, giving the two inverse factors.|Retain projectivity.|
|frobeniusPlaceCount;5.10|Identity extension over F₂(t) gives B₁=3,B₂=1; only unramified degree-r places enter.|Retain.|
|frobeniusPlaceCount_constant_congruence;5.10|Constant quadratic extension: identity class has count0 in odd degrees; nonidentity has count0 in even degrees.|Retain.|
|degree_sensitive_chebotarev;5.10|Identity F₂(t),r=2: absolute discrepancy3, bound(2·2)+2=6.|Retain.|
|adelicPoints;6.1|G_a gives additive adeles; G_m gives pairs(a,a^−1), so both coordinates are controlled.|Retain.|
|adelicPoints_restrictedProduct;6.1|For G_m, outside S an integral point means both a_v and a_v^−1 integral, exactly O_v×.|Retain finite-type flat model.|
|adelicPoints_diagonal_discrete;6.1|For G_a, K∩(all integral with one positive valuation)=0; for G_m the corresponding neighborhood of1 meets K× only at1.|Retain.|
|adelicPoints_finite_stabilizer;6.1|For G_m/F₃(t), integral stabilizer F₃× has2 elements; for the trivial group it has1.|Retain.|
|adelicPoints_map;6.1|Multiplication-by2 on G_a sends a to2a and preserves addition; in characteristic2 it is the zero map.|Retain.|
|adelicPoints_locallyCompact;6.1|At integral level the product of local compact integral-point sets is compact; G_a has the compact open product of O_v.|Retain.|
|adelicPoints_prod;6.1|For G_a² the two constructions both consist of pairs of adeles with coordinatewise addition.|Retain.|
|adelicPoints_Gm;6.1|Uniformizers moving through places approach1 additively but never enter the idele neighborhood product O_v×.|Retain inverse-aware topology.|
|adelicPoints_Ga;6.1|The coordinate algebra K[X] homomorphism is determined by one arbitrary adele a; addition is a+b.|Retain.|
|automorphicFunctions;6.2|GL₁/P¹ and Ξ of degree3 gives R³; without Ξ it gives R^ℤ.|Retain; S08.|
|eval;6.2|At the first of three cosets, evaluation of(1,2,3)+(3,2,1) is4=1+3.|Retain.|
|levelChange;6.2|Pullback along a surjection from six cosets to three sends(a,b,c) to repeated values; zero pullback forces a=b=c=0.|Retain injective.|
|heckeAction;6.2|For GL₁, a uniformizer shifts the degree function by1; two shifts give degree+2.|Retain right-convolution convention.|
|baseChange;6.2|On three cosets, R³⊗_R S≃S³; on infinite cosets no unrestricted product/tensor isomorphism is claimed.|Retain finite-support qualification.|
|gl1;6.2|P¹ integral level identifies the double cosets withℤ; Ξ degree3 givesℤ/3 on both descriptions.|Retain.|
|complex automorphic comparison;6.2|At one level coset, both function-space descriptions evaluate f at the same representative; degree-parity central action multiplies by−1 in both.|Retain supplied smooth comparison.|
|constantTerm;6.3|For GL₂ and f=1, normalized quotient mass1 gives CT=1. Heisenberg double-coset weights1/4 and1/2 sum with multiplicity to1.|Retain.|
|cuspFunctions;6.3|For a torus there are no proper parabolics, so all functions are cuspidal; GL₂ constant1 fails because CT=1.|Retain.|
|constantTerm_linear;6.3|CT(2·1+3·1)=5=2CT(1)+3CT(1).|Retain.|
|constantTerm_complex;6.3|A coset with weight1/4 contributes a/4 to both the integral and finite sum.|Retain.|
|constantTerm_refine;6.3|A coset of mass1/2 splitting into two equal cosets gives1/4+1/4=1/2.|Retain.|
|mem_cuspFunctions_iff;6.3|GL₂ has one standard maximal proper parabolic; f=0 has CT0 and f=1 has CT1. Torus has empty intersection and the whole module.|Retain both directions.|
|cuspFunctions_hecke;6.3|CT(f)=0 implies CT(T_h f)=T_(S*h)0=0; for h=identity this returns f.|Retain with §6.6 compatibility.|
|cuspFunctions_compactSupport;6.4|GL₁/P¹ with Ξ degree1 has a single support point for every coefficient ring and every form; deleting Ξ admits constant1 on allℤ.|Retain uniform quantifiers.|
|cuspFunctions finite generation;6.4|Support of h points embeds the module into R^h; for the torus it is R^h itself. For P¹,h=1.|Retain Noetherian hypothesis.|
|cuspFunctions flat base change;6.4|A kernel of multiplicationℓ overℤ[1/p] stays0 overℚ; moduloℓ the new kernel F_ℓ illustrates the excluded nonflat case.|Retain.|
|cuspFunctions_integralModel;6.5|For GL₁/P¹ with Ξ degree1, R⊗_R C=C, matching the cusp module over C.|Retain embedding gives domain and flat scalar extension.|
|heckeEigenvalue_algebraic;6.5|A rational Hecke matrix has algebraic eigenvalues; the rank-one matrix(a) has eigenvaluea and polynomial X−a. A transcendental degree character is excluded.|Retain.|
|heckeAction_unramified_cusp;6.6|CT=0 transforms to T_(S*h)0=0; at GL₁ the action is the degree translation already computed.|Retain.|
|raw Satake compatibility;6.6|GL₂,q=4: raw transform4X₁+X₂; δ(diag(π,1))=1/4, giving normalized coefficients2,2.|Retain.|
|normalizedConstantTerm;6.6|At diag(π,1), q=4, CT=1 is multiplied by δ^−1/2=2.|Retain.|
|normalizedConstantTerm_hecke;6.6|The preceding raw coefficients4,1 become2,2 after multiplication by δ^1/2 on the two diagonal cosets.|Retain.|
|normalizedConstantTerm_one;6.6|δ(1)=1, so CT^n(f)(1)=CT(f)(1), including value2.|Retain README API only.|
|normalizedConstantTerm_rightTranslate;6.6|m=diag(π,1),q=4: δ(m)^1/2=1/2; CT^n(R_m1)(1)=1=(1/2)CT^n(1)(m).|Retain.|
|normalizedConstantTerm_transitive;6.6|For GL₃, diag(π,1,1) has δ_B=q^−2; block parabolic(2,1) and its GL₂ Borel each contribute q^−1, product q^−2.|Retain.|
|satake_gl1_reciprocity;6.6|χ(a)=2^degree(a), degree2 uniformizer gives eigenvalue4; geometric Frobenius character is its inverse1/4.|Retain one inversion.|
|cuspForm_exists_degreeZero_ne_zero;6.7|n=2,g=2: Yu determinant degree2 and scalar correction−2 sum0; the zero form has value0 everywhere and is excluded.|Retain; S09 inventory.|
|spherical section;7.2|Φ(1)=1 whereas 2Φ(1)=2; the normalization excludes rescaling.|Retain.|
|flat local sections;7.2|A nontrivial character on the stabilizer would force value1=χ(u), impossible; conductor-level stabilizer with χ=1 admits the supported section.|Retain.|
|Siegel Eisenstein series;7.2|n=0 gives one coset and E=Φ(1)=1; a proper GL₂ Borel has multiple cosets.|Retain.|
|siegelEisenstein_converges;7.2|n=1 requires Re(s)>1/2; s=1 lies in the convergence range, s=0 does not. No convergence claim at s=0.|Retain stated open range.|
|siegelEisenstein_rational;7.2|Replacing s by s+2πi/log q leaves q^−s unchanged, hence the rational continuation unchanged.|Retain.|
|section_one;7.2|Spherical Φ(1,s)=1 for every s; the zero flat section has value0 and is not spherical-normalized.|Retain.|
|section_parabolic;7.2|Split n=1,q=4,s=0, determinant norm1/4: section multiplier(1/4)^(1/2)=1/2.|Retain.|
|section_unipotent;7.2|n(b) has determinant multiplier1, hence Φ(n(b),s)=Φ(1,s); values1 or0 according to the chosen section.|Retain.|
|siegelEisenstein_leftInvariant;7.2|Left multiplication by γ₀ permutes the coset sum γ↦γγ₀; at γ₀=1 the permutation is identity.|Retain.|
|section_degree;7.2|Yu degree−1,q=4,n=1,s=0 gives4^−1/2=1/2, the same norm multiplier.|Retain section-only statement.|
|global Fourier coefficient;7.3|A constant function1 has coefficient1 at T=0 and0 at a nontrivial character T, by quotient-character orthogonality.|Retain rational index.|
|local Whittaker integral;7.3|Φ=0 gives integral0; scaling Φ by2 scales the integral by2.|Retain arbitrary local index.|
|fourierExpansion;7.3|For the constant function1 the expansion has only its T=0 coefficient1; a single character is recovered from its one nonzero coefficient.|Retain positive-kernel indexing.|
|fourierCoefficient_rationalLevi;7.3|Global rational α=t has norm1 by product formula; the transformed rational index is t̄Tt and no scalar factor remains.|Retain rational domain.|
|whittaker_levi;7.3|Split n=1,α=(π,1): norm q^−1, Jacobian q^−1, factor q^(s−1/2). At q=4,s=0 it is1/2.|Retain.|
|fourierCoefficient_factor;7.3|g_X=0,n=1 gives measure factorq; g_X=1 gives1. T=0 has a second Bruhat contribution and is excluded.|Retain nonsingular restriction.|
|Hermitian dual lattice;7.4|Split L=(O,πO) has L∨=(π^−1O,O), each component paired in its own ambient line.|Retain corrected indices.|
|representation density;7.4|Rank0 density1; m<n generic embeddings absent and density0. At a split unit line with q=3, density2/3.|Retain.|
|densityPolynomial;7.4|a=0 gives1; a=1 gives1−T; a=2 gives(1−T)(1−ηqT).|Retain.|
|densityType;7.4|Self-dual L has type0; rank-one Gramπ³ has type1, not3.|Retain.|
|densityHalfLength;7.4|Split torsion lengths(1,0) give1/2; Hermitian discriminant lengths(1,1) give1.|Retain rational half-length.|
|hermitianDensity_split(1);7.4|n=1,j=0: normalization density1−η/q; q=2 gives1/2 split and3/2 inert.|Retain all characteristics.|
|hermitianDensity_split(2);7.4|Rank-one Gramπ gives polynomial1+T split and1−T inert; at T=1 these are2 and0.|Retain.|
|hermitianDensity_split(3);7.4|Split Gramπ: original lattice contributes1−T, its two self-dual overlattices contributeT each, total1+T.|Retain finite sum and integer exponents.|
|den_selfDual;7.4|Only overlattice L itself is integral inside L∨=L; term T⁰m(0;T)=1.|Retain README API only.|
|den_depends_on_torsion;7.4|Every self-dual lattice has zero torsion quotient and polynomial1; split rank-one discriminant(κ,κ) gives1+T.|Retain Hermitian pairing retained.|
|den_functionalEquation;7.4|Split1+T=T(1+1/T); inert1−T=−T(1−1/T). Rank0 gives1=1.|Retain.|
|whittaker_eq_density;7.5|Self-dual rank1 at s=1 gives1−ηq^−3; at s=0 inert Gramπ gives0 because Den(1)=0.|Retain rank n+2j interpolation.|
|global density product;7.6|One bad degree-two split place with local1+T contributes1+T² globally; all other self-dual places contribute1.|Retain finite product.|
|fyz_globalCoefficient;7.6|g_X=1,deg E=0,all self-dual gives χ(det E)L_n(s)^−1; at χ=1 the other scalar factors equal1.|Retain spherical hypotheses.|
|general coefficient change of frame;7.6|At one bad place, rescaling the section by2 doubles its W factor and E; moving a good place into S replaces L_v^−1Den_v by the identical W_v.|Retain simultaneous level data.|

## Supplier and ownership audit

The main checkout and both pinned dependency revisions were verified before searching. Cross-roadmap resolution reported no missing roadmap or Lean name; its external-library check was unavailable, so pinned files were read directly. Object searches used the roadmap tool (open heads plus main), the board packages, active and completed main roadmaps, and the 26 specifically supplied sibling heads (52 README/Lean files). The broad search also located RelativeJacobiansAndIntegralCurveModels. No duplicate fully qualified name among this package's 15 declarations was found. The supplied siblings' Witt, K-theory, density, determinant and Eisenstein occurrences concern different objects, or explicitly consume the generic owners recorded below.

| Supplier group checked | Exact section/declaration and scope resolution |
|---|---|
|ArithmeticGaloisDuality|§R02.3.2 function-field places/ideles and class formation: finite exact constants, degree surjectivity, compact degree-zero classes, finite Artin norm quotients and arithmetic constant-field projection. Completing ℤ to Ẑ is required and retained.|
|AutomorphicLFunctionsAndLocalFactors|AL.3 Curve additive analysis supplies completed adeles, residue character, volume and Poisson; rank-one unramified AND ramified reciprocity supply the Picard/Lang dictionaries. The latter is the drift/duplication S01. Whittaker expansion, factorization and nonzero-conductor spherical normalization match the Yu proof.|
|ArithmeticGaloisRepresentations|§2.5 inertia-invariant Euler polynomial and lift independence; §3.7 reduced AS pole break m, Swan m, Artin m+1, different(p−1)(m+1); §5.13 arithmetic Frobenius, finite-cover counts and recognition; §1.8 Brauer–Nesbitt. The package's finite-ring determinant extension retains projective invariants.|
|DeligneWeightsAndPurity|§1.6 curve/Jacobian Weil estimate, §1.9 base extension, §3.7 finiteCover_degreeChebotarev. The last exists in its current README; this package adds an explicit error bound, not a second proof of its qualitative density theorem.|
|WeilConjectures|WC.1 curve_zeta_numerator_without_rh and WC.5 extension_count_recurrence both occur in the current README. No missing-name finding is warranted.|
|SchemeAndStackFoundations|§1.1 fpqc quasi-coherent descent; §§2.11,2.16 Hilbert90/Tsen inputs; §3.3 duality; §3.6 picardComponent and Picard–Brauer obstruction; §3.7 abelMaps_highDegree with Brauer–Severi descent; §5.11 Weil bound. The real conic obstruction is not suppressed.|
|JacobianChallenge|Layers A–C line bundles, coherent curve cohomology and pushforward/base change; D ordinary Picard representation and Brauer obstruction. No positive-modulus representability is inferred merely from ordinary rational Picard points.|
|ModularCurves|Layer0E explicitly supplies effective faithfully flat descent of affine schemes, sections and morphisms; projective descent additionally requires descended polarization. Only the affine case is used here.|
|AutomorphicSpectralTheory|§§1.11–1.13,2.15–2.16,4.11–4.17 are the everywhere-unramified GLₙ branch. Its fixed-centre character groups explicitly retain disconnected components, confirming S02. It is not a supplier for the new general unitary continuation.|
|ClassFieldTheory|Layers1–7 class formations/local reciprocity; Layer8 excludes equal-characteristic p-primary existence and the scope excludes Lubin–Tate and ASW theory. Layer4 here fills that gap without replanning supplied reciprocity.|
|LocalFieldsRamification|Layer3 upper/lower filtrations, Herbrand and Hasse–Arf. The local-field hypotheses used here are within that contract; no good-residue-characteristic restriction is introduced.|
|ReductiveGroupsPartII|RG2.0 point topology; RG2.0a restriction of scalars along finite locally free maps; RG2.3.7 Lang for smooth connected groups, including unipotent groups; RG2.3–RG2.4 parabolics/relative roots and decompositions.|
|SmoothRepresentationsOfLocalGroups|SR.2.1–SR.2.3 smooth/parabolic induction and Whittaker functionals; SR.4.1 Satake and parabolic restriction with specified square roots; SR.4.4 unramified unitary groups. Modulus scales by δ, not δ^−1; the package's normalized CT uses δ^−1/2.|
|AdelicAlgebraicGroups|AA.0 countable, second-countable locally compact restricted-product Haar theory is reusable. Its Layer1 adelic algebraic groups are number-field specific, so the function-field comparison in §6.1 belongs here.|
|GeometryOfNumbersAndQuadraticArithmetic|§3.2 includes inert unramified Hermitian densities when char(F)≠2, including residue characteristic2. This roadmap owns the split and equal-characteristic2 extensions; it does not narrow to odd residue characteristic.|
|EtaleCohomologyFoundations|F.2.5 compact support for separated finite-type schemes; F.3 finite invertible coefficients and finite Tor amplitude give perfect cohomology; F.10.2 geometric/arithmetic Frobenius comparison; F.10.3 projective traces and determinant comparisons. Flat j_*ρ makes the application valid.|
|PadicMeasuresIwasawaAlgebras|§5.1 detLine, detLine_quasiIso, detLine_shortExact, detLine_baseChange, detLine_shift, detLine_acyclic apply over commutative rings to perfect complexes. §5.7 here adds the endomorphism characteristic-series bridge.|
|AlgebraicCurves|Layer0 intrinsic/chosen-generator comparison; Layer2 finite normalization explicitly includes inseparable extensions; Layers3–4 divisors/RR; Layers5,9 completions/expansions; Layers6–8 extensions/ramification/constants; Layer10 AS curves; Layer12 curve/function-field dictionary.|
|MetaplecticAutomorphicForms|Its local Weil/Schrödinger interface and Fourier model are used only in Layer7's odd-characteristic global setting. The independent local-density extension to characteristic2 in §7.4 does not invoke an unavailable characteristic2 Weil representation.|
|RelativeJacobiansAndIntegralCurveModels|§§1.3–1.5 finite-flat rigidification, unit sequence, smooth algebraic-space representation and universal family. Positive modulus of a smooth proper connected field curve satisfies universal injectivity; invert the supplied O→L trivialization to compare the package's convention. S01.|

Twenty supplier groups are enumerated above. The supplier-section checks distinguish a statement in an owner's README from an implemented pinned theorem; no planned declaration was treated as a current import. No declared supplier gap exists in this package. The ownership moves in S01 point only to earlier suppliers. The newly owned work remains the function-field comparison, fixed-modulus universal property where not already supplied, explicit quantitative bound, integral coefficient extensions and split/characteristic2 local density extensions.

Pinned checks include Mathlib/RingTheory/FormalGroup/Basic.lean:56 and :74 (commutativity is separate), Mathlib/RingTheory/Trace/Basic.lean:518 (finite-dimensional AND separable), Mathlib/RingTheory/WittVector/Truncated.lean:62 and :286 (native finite vectors and ring truncation), and Mathlib/Algebra/Category/Grp/Injective.lean:54 (divisible abelian groups injective). TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean:87 and TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean:247 support S03. The function-field, divisor-degree, effective-divisor finiteness, class-number, differential-degree, completion and Hopf-point names in the supplier contracts occur at the pins. Native rigidifiedPicardFunctor in TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66 is section-rigidified; it is not by itself the arbitrary-modulus construction. Existing Artin–Schreier ramification modules were searched by object; §3.3 correctly imports their underlying curve theory and adds the Witt comparison.

The prescribed read-only dependency check returned:

```text
depcheck: 27 roadmaps, 243 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line and no moved line. The internal order is now Hilbert90→ASW, reduction→Harder support→flat coefficient base change, and cuspidal continuation→residual discrete decomposition→discrete-data continuation. The repaired base-change/support cycle did not recur. This mechanical result does not excuse the ownership duplication S01.

## Source locator audit

Seventy-five locator units are grouped below; each unit is a named theorem, proposition, lemma, equation pair or section span listed in the second column. All 22 certified source extractions were consulted, using their recorded legal copies. This verifies the displayed claims and locators, not every line of every cited source's proof. The six settled inaccessible/waived works remain separately marked below.

| Source | Locator units resolved; source lines | Units; qualification |
|---|---|---|
|yu|§2.2.1 (yu line 366); §2.2.3 (yu line 388); Lemma5.3.3/proof (yu line 1934, line 2024)|3; two source errors corrected in the package.|
|kw|Proposition3.1 (kw line 276); Theorems3.2,3.4 (kw line 280, line 362); Propositions4.3,4.4 (kw line 722, line 739); Theorem4.7 (kw line 886); Theorem4.12 (kw line 1135); Lemma4.13 (kw line 1169); Proposition4.14 (kw line 1184)|9; clamp and proof-sign issues recorded below.|
|kosters|Theorem1.1, Corollary1.2, Lemmas1.3–1.4 (kosters line 66, line 81, line 92, line 144)|4; rational-place subscript corrected; nonabelian classes and constant enlargement retained.|
|yoshida|Lemma3.4; Proposition3.5; Corollary3.7; Proposition4.4; Definition4.10; Definition5.3; Proposition5.4; Proposition5.10; Theorem5.15; Corollary5.16; Theorem6.11; Theorem6.15; Proposition8.1 (yoshida line 245, line 264, line 293, line 331, line 430, line 466, line 471, line 572, line 637, line 651, line 854, line 905, line 1049)|13; geometric convention inverted once; auxiliary source slips below.|
|parshin|§2.1 (parshin line 283); §2.2 (parshin line 363)|2; three source issues corrected in the package.|
|milne|TheoremA.7 and proof (milne line 4947); LemmaA.10 (milne line 5072); PropositionA.11 (milne line 5107)|3; source's more general reduced Galois group is not silently equated with the whole group outside finite constants.|
|conrad_geom|§2 (conrad_geom line 48); Theorem3.2 (conrad_geom line 157)|2; perfect-field hypothesis and torsor form retained. Additional error in nearby Theorem3.1 below.|
|russell|Theorems3.24–3.25 (russell line 1669, line 1684)|2; §3.3 works over algebraically closed k for convenience. Package separately proves/descent-extends its perfect-field universal property.|
|conrad_adelic|Proposition2.1, Example2.3, Theorem3.6 (conrad_adelic line 53, line 115, line 281)|3; finite-type affine hypotheses retained; infinite product is not a disjoint union of spectra.|
|bhkt|Propositions8.1–8.2 (bhkt line 1574, line 1593)|2; original Noetherian subring-of-C hypothesis is distinguished from the package's separately proved coefficient extension.|
|ciubotaru_harris|Proposition3.1, Lemma3.2 (ciubotaru_harris line 390, line 412)|2; field/model scope retained.|
|abdurrahman_venkatesh|§3.2 equations(3.1),(3.2) (abdurrahman_venkatesh line 1184, line 1194)|2; geometric Frobenius and inertia invariants, not a power-trace-only argument.|
|stacks|Tag03UZ, Theorem64.20.1 (stacks line 1138)|1; finite flat coefficient sheaf, finite-type scheme; proof explicitly omitted there.|
|fyz|§2.1/Remark2.1 (fyz line 344, line 383); §2.2 equations(2.1)–(2.4); Definition2.2 (fyz line 481); Theorem2.3 (fyz line 509); Remarks2.4–2.6 (fyz line 582); Lemma2.7 (fyz line 615); Theorem2.8 (fyz line 673)|7; ramified-character and characteristic2 extensions are the package's additional proofs, not source theorems.|
|li_zhang|Theorem3.5.1 (li_zhang line 688)|1; unramified inert case and interpolation; source note at line 695 corrects the KR derivative factor.|
|kudla_rapoport|Proposition10.1 (kudla_rapoport line 1719)|1; mixed-characteristic local identity used through the explicitly stated transfer argument, not asserted as an equal-characteristic theorem in that source.|
|borel_tits|Theorem3.17 (borel_tits line 1109)|1; relative-root vector quotient input.|
|morris1|§4 reduction (morris1 line 427, line 439, line 497); §§5.3–5.6 (morris1 line 529); p.134 Theorem4.8 (morris1 line 1612); rational continuation pp.160–168, ending §§3.3–3.4 (morris1 line 2785)|4; non-split reductive scope and componentwise rationality checked.|
|morris2|§5.5 theorem (morris2 line 1300); §6.5 (morris2 line 1980); §6.6 lemma (morris2 line 2008)|3; general discrete-data continuation follows the residual construction.|
|guignard_published|§4.7; Proposition4.8; Lemma4.9; Propositions4.11,4.12; Remark4.13; Proposition4.14 (guignard_published line 737, line 747, line 751, line 794, line 803, line 825, line 830)|7; printed pp.1317–1321, not PDF page numbers.|
|harder|§§1.1–1.2 (harder line 128, line 211; support proof line 239–280)|2; deep-cusp equality CT(f)(g)=f(g) is coefficient-independent; general reductive reduction also supplied by Morris.|
|sga3|ExposéXXVI, Proposition2.1 (sga3 line 240)|1; filtration by smooth characteristic subgroups and vector quotients; all characteristics.|
## Verified sound

Read all 2764 README lines and all 190 Suggested.lean lines, both repository rule files, both preceding reviews and their repair report. Verified 22 earlier findings individually: 21 are repaired (including deletions required by this round's acceptance-file policy); one is partly repaired, with its new errors identified in S02/S04. None was settled as not actionable.

The recorded computations cover 15 named Lean declarations and two proved examples; 12 bold mathematical targets; all 42 numbered target sections; 214 separately indexed auxiliary statements; and all 178 README Check bullets. Four Hilbert-90 API bullets are not miscounted as Checks. The acceptance-signature table records each variable/instance context and numerical or algebraic boundary values. There are no lost section binders in the supplied elaborated types. The surviving admitted statements were not found false; S03/S07 concern omissions and S05 concerns padding.

Resolved 75 source-locator units in 22 legally cached texts. Checked 20 named supplier groups against their current sections, including current open heads where appropriate, and searched all 26 supplied sibling checkouts (52 README/Lean files) by object. Checked the pinned Mathlib and Tau Ceti carriers and declarations identified above. The native degree-one-place statements over algebraically closed constants do not subsume the finite-field degree-one-divisor headline. The quantitative Chebotarev constant-field coefficient, additive/Witt signs, genus-zero formulas, finite-ring determinant distinction, and split/inert density normalizations passed the displayed controls.

The dependency checker reports 27 roadmaps, 243 edges and zero problems. The original pull-request diff contains six files, all under packages/FunctionFieldArithmetic: README.md, Suggested.lean, metadata.toml, reports/FIX-RT-FunctionFieldArithmetic~1.md, review.json, and sources.toml. Suggested.lean uses one import Mathlib followed by the used pinned Tau Ceti module, has eight admitted theorems and no admitted data, lemma command or set_option. No Lean build, git mutation, package-source edit or external write was performed. The nine findings comprise two P1, three P2 and four P3 findings.

## Not verifiable

- rosen: Chapter 5, pp. 45–46, Theorems 5.9–5.10. Its manifest status is settled uncertified; the text was not available legally in this run. Mathematical formulas were independently tested, but these printed locators are not certified.
- goss: §1.1, Example 1.1.1 and Proposition 1.1.2, p. 1. Settled uncertified; Witt formulas were checked using native operations and the available kw source instead of claiming to read this text.
- stichtenoth: §5.1, Lemma 5.1.1, Definition 5.1.2 and Proposition 5.1.3, pp. 185–186. Settled uncertified; no new request was made.
- hess: Lemma 1, Corollaries 3–4, Theorem 7, Proposition 9 and Corollary 11, in the cited author-manuscript pagination. Settled uncertified; the reduced-basis mathematics was checked, but the source wording, proof details and pagination remain uncertified.
- sga4half: Théorème 2.2. Settled uncertified. Stacks Tag 03UZ states the relevant theorem but omits its proof and refers to this text; a full source-proof certification is therefore unavailable.
- roquette: equation (4), p. 22, §4.3.3, pp. 25–28, and §8.1. Settled waived. No source text or locator certification is claimed.
- Lean elaboration was prohibited by the read-only brief. The worker's supplied elaborated signatures were compared with all 15 declarations; no fresh #check or build was run. The proposed S03 signature and definitions required by S07 still need elaboration by the repair worker. No successful elaboration or completed proof is claimed for a proposed repair.
- FunctionFieldArithmeticPartII and LubinTateFormalModulesAndQuasiCanonicalLifts occur in the merge-order/design context, but the roadmap tool returned no readable main/open folder for them. No unseen declaration was treated as a supplier, no ownership conclusion relies on their absent text, and their absence is not a finding.

All cited works already have manifest keys. No unsettled new missing source was identified and no settled source was requested again.

## Source issues

“Nothing” below means no remaining effect on this package: the head already corrects the issue or does not use the affected nearby assertion. These are source errata, not additional package findings.

- **Error** in parshin at §2.1, printed p. 7, parshin line 298: the source says unshifted divisor-lattice indicators span all compactly supported locally constant functions; it should be their translates span that space; affects nothing.
- **Misprint** in parshin at §2.2, printed p. 9, parshin line 368: the source says the adelic unit-circle pairing sums the local character values; it should be the product of those values, equivalently the character of the summed residues; affects nothing.
- **Error** in parshin at §2.2, printed p. 9, parshin line 375: the source says a finite field's additive group embeds in the complex units using a root of order q; it should be a nontrivial additive character obtained from the prime-field trace, without injectivity; affects nothing.
- **Error** in yu at Lemma 5.3.3, printed p. 36, yu line 1934: the source says every vector of the unramified cuspidal representation has a nonzero degree-zero value; it should be a nonzero spherical vector in the stated argument; affects nothing.
- **Misprint** in yu at Lemma 5.3.3 proof, printed pp. 37–38, yu line 2024: the source says the Whittaker diagonal has negative Yu degree and uses a positive scalar correction; it should be degree n(n−1)(g−1) and scalar exponent −(n−1)(g−1); affects nothing.
- **Misprint** in kw at Theorem 3.2(i) proof, printed p. 7, kw line 299: the source says the relation α−σα=1 permits substitution σα=α+1; it should be σα=α−1, so the Frobenius-minus-identity calculation cancels both constant terms; affects nothing.
- **Error** in kw at Theorem 4.12, printed pp. 21–22, kw line 1135: the source says the unit-filtration image uses the possibly negative ceiling of log_p(r/i); it should be the maximum of that ceiling and zero; affects nothing.
- **Error** in kw at Proposition 4.14, printed pp. 22–23, kw line 1189: the source says the ramification bound adds the unclamped logarithmic ceiling to each coefficient valuation; it should be the coefficient valuation plus max(0,ceil(log_p(r/i))); affects nothing.
- **Misprint** in kosters at Corollary 1.2, printed p. 2, kosters line 84: the source says the finite-field estimate sums over all places; it should be a sum over rational places, as in its proof; affects nothing.
- **Error** in fyz at Remark 2.1, printed pp. 8–9, fyz line 383: the source says every quadratic cover admits the required everywhere-unramified inducing character, including odd rank; it should be existence exactly when the quadratic character's nth power kills the Picard-pullback kernel; affects nothing.
- **Error** in fyz at equation (2.1), printed p. 9, fyz line 420: the source says global Fourier covariance applies to every adelic Levi matrix; it should be restricted to rational matrices globally, with arbitrary adelic covariance handled by local nonsingular Whittaker factors; affects nothing.
- **Misprint** in fyz at §2.4 after equation (2.5) and Remark 2.5, printed pp. 11–12, fyz line 505: the source says dual and quotient lattices from opposite split components form the displayed inclusions and quotients; it should be each dual and quotient in the same component under the definition at fyz line 462; affects nothing.
- **Misprint** in fyz at Theorem 2.3 proof, printed p. 11, fyz line 538: the source says every saturation summand uses the reduction of the original lattice in its embedding count; it should be the reduction of that summand's overlattice; affects nothing.
- **Misprint** in fyz at Remark 2.4, printed p. 12, fyz line 588: the source says the density summand uses the type of the isotropic submodule; it should be the type of its orthogonal quotient Q′⊥/Q′; affects nothing.
- **Error** in conrad_geom at Theorem 3.1, printed p. 4, conrad_geom line 155: the source says every geometrically connected abelian cover remains geometrically connected after pullback along an arbitrary map to the group torsor; it should be asserted for the canonical generalized Abel map, or require surjective monodromy for the cover; affects nothing.
- **Misprint** in kudla_rapoport at Proposition 9.3(i), printed p. 34, and its proof, printed p. 38, kudla_rapoport line 1589: the source says the derivative factor is log p; it should be log(p²), as explicitly noted in li_zhang line 695; affects nothing.
- **Misprint** in yoshida at Corollary 6.13(iii), printed p. 432, yoshida line 877: the source says the divisibility bound (q−1)q^(m−1) applies also at m=0; it should be restricted to integers m≥1; affects nothing.
- **Error** in yoshida at Lemma 8.2(i), printed p. 436, yoshida line 1052: the source says every domain algebra and nonunit α have nonzero derivative f′(α); it should be a domain algebra in which the image of π is nonzero; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "28127849c53b8721daf1b2586bab1cabe957b423", "job": "RT-FunctionFieldArithmetic~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
