Verdict: design
Name: FourierDeligneTransform
Base: none
Owner: none

## Scope

No roadmap on main, no open roadmap pull request and no package on the board owns the ℓ-adic Fourier–Deligne transform, kernel transforms, or the Artin–Schreier and Kummer sheaves. The roadmaps nearby state this boundary themselves. EtaleCohomologyFoundations, as revised in its open pull request #1891, assigns "kernel transforms, the Artin–Schreier and Kummer sheaves and the Fourier–Deligne transform" to a downstream consumer called FourierDeligneTransform. CohomologicalPointCounting (#196) lists Fourier–Deligne transforms among its non-goals. CharacterSumsOverFiniteFields (#1712) defines no sheaf and leaves the Kummer and Artin–Schreier sheaves to another owner. CongruenceSpectralGap (#1504) §4.2b consumes an "additive-character-sheaf" contract that no roadmap supplies today. So this is a new roadmap: `design`, under the suggested name.

**What this roadmap owns.** It owns the transform layer and nothing that needs a weight. In detail:

1. Kernel transforms between compactifiable schemes over a base. This covers their composition law, base change and the sheaf–function dictionary for their trace functions.
2. Character sheaves of smooth connected commutative group schemes over a finite field, built from the Lang torsor. This includes the Artin–Schreier sheaves `ℒ_ψ(f)` and the Kummer sheaves `ℒ_χ(g)`, with their tensor, pullback, base-extension and trace laws and their vanishing cohomology.
3. The Fourier–Deligne transform on a vector bundle over any base in characteristic `p`. The headline results are:
   - `FT_! ≅ FT_*`;
   - inversion as explicit data;
   - commutation with Verdier duality;
   - functoriality in the base and in linear maps;
   - external products, additive convolution and Plancherel;
   - the trace-function identity;
   - Frobenius compatibility, so that every Frobenius descent datum is carried along.

   The coefficients are torsion first. Adic and `ℚ̄_ℓ` coefficients come by realization.
4. Perverse `t`-exactness over a field, and the resulting autoequivalence of perverse sheaves.
5. The transform on the affine line:
   - the three types of simple perverse sheaves and how the transform exchanges them;
   - Fourier sheaves;
   - the transform of Kummer sheaves, which yields Gauss-sum lines;
   - the local monodromy of the transform (rank formulas, lisse locus, vanishing cycles at finite points and at `∞'`, and the specialization sequence at `0'`);
   - the definitions of the three local Fourier transforms, with their tame computation.

The roadmap supplies the transform-level inputs of Laumon's proof of the curve estimate (Weil II (3.2.3)). It does not own the estimate.

**What it does not own.**

- **Weights.** DeligneWeightsAndPurity owns weights, ι-purity, ι-reality, Weil sheaves, Deligne's purity criterion (WII (1.5.1)), the local monodromy weight bounds (WII (1.8.1), (1.8.4)) and the curve estimate itself. The estimate "`H¹_c(U_k̄, ℱ)` has ι-weights `≤ w + 1` for `ℱ` lisse and ι-pure of weight `w` on a smooth curve" is DeligneWeightsAndPurity §6.5 (with §§6.2–6.4). Under the route decision of design issue TauCetiRoadmap#1888, DeligneWeightsAndPurity Layer 6 replaces its square-improvement proof by Laumon's argument (LAU87 §4.4, LAU87 lines 2613–2657), consuming this roadmap. The statement that the transform on the line preserves ι-purity, by Plancherel and the purity criterion, belongs to that layer. Here it would plan DeligneWeightsAndPurity §6.5 a second time.
- **Weights in higher rank.** The weight statements for complexes on vector bundles of rank `r` (KL85 Théorème (2.2.1), Scholie (2.3.1)) consume DeligneWeightsAndPurity §8. They belong to a continuation of this roadmap ordered after DeligneWeightsAndPurity.
- **Into the continuation.** The full stationary-phase theorem for local Fourier transforms (LAU87 Théorème (2.4.3) for wild modules, with ranks, slopes and the equivalences; ESDE §§7.4–7.5), the product formula for local constants (LAU87 §3) and relative perversity over a base (KL85 §1.2) also go to that continuation. The filed target asked for local Fourier transforms to be "stated as targets, not proved here". This roadmap defines them and proves the tame case. The general theorem is the continuation's first target.
- **Six operations and their inputs.** EtaleCohomologyFoundations owns the six operations, Tate twists, local acyclicity, duality, the perverse `t`-structure, realization and Frobenius. It also owns the construction of a rank-one lisse sheaf from a torsor and a character (§F.0.3 as revised in #1891); this roadmap applies that construction to Lang torsors. InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 owns the trace formula. LefschetzPencilsAndVanishingCycles §§0.2–0.8 owns nearby cycles. ArithmeticGaloisRepresentations §§3.1 and 3.7 owns Swan conductors and the local Artin–Schreier calculations. ReductiveGroupsPartII §RG2.3.7 owns Lang's theorem.
- **Neighbouring transforms and sheaves.** CongruenceSpectralGap §4.2b owns Kloosterman sheaves and multiplicative convolution on `𝔾_m`. SheafConvolutionOnAbelianVarieties owns convolution on abelian varieties and the D-module/Fourier–Mukai transform (the transform of LAU96, §§3 and 7, is coherent rather than ℓ-adic, and is not owned here). CharacterSumsOverFiniteFields owns Gauss, Jacobi and Kloosterman sums as numbers.

**Merge-order placement and the cycle it breaks.** The filed target has this roadmap consume DeligneWeightsAndPurity §§0 and 5 and supply DeligneWeightsAndPurity §§6–7. At roadmap granularity that is a cycle. It is broken by moving ownership: the weight half of the filed target moves into DeligneWeightsAndPurity Layer 6. This matches what #1888 says about that layer ("square improvement becomes Laumon's argument"). This roadmap keeps every weight-free statement.

The roadmap goes after its last supplier in `merge-order/ORDER.txt`, LefschetzPencilsAndVanishingCycles (line 52), and before DeligneWeightsAndPurity (line 78). Its other ordered suppliers are ArithmeticGaloisRepresentations (line 42) and InverseGaloisAndArithmeticFundamentalGroups (line 44). This placement needs one further move: the perverse-exactness theorems for affine and smooth morphisms must be supplied before DeligneWeightsAndPurity (Risk 1).

**Generality, corrections to the filed wording.**

- **Base.** The kernel `ℒ_ψ⟨x, y⟩` exists only over `𝔽_p`. The transform's base is therefore any scheme `S` over `𝔽_p`, with `ℓ ≠ p` coefficients (KL85, Appendice 2.4, KL85 line 442), not "any base with ℓ invertible". Kernel transforms keep the wider base: any qcqs scheme on which the coefficient order is invertible. For transforms whose source and target are compactifiable schemes `X`, `Y` over `S`, the filed restriction to vector bundles is dropped.
- **Group.** Character sheaves need `G` smooth and connected. The Lang map of a non-connected group is not surjective (ReductiveGroupsPartII §RG2.3.7 records the constant group `ℤ/2`). The filed "finite-type group scheme" is a special case only once connectedness is added.
- **Coefficients.** The torsion coefficients are finite rings `Λ` in which `p` is invertible, with an additive character `ψ : 𝔽_p → Λ^×` such that `ψ(1) − 1` is a unit. This is the nondegeneracy that makes `RΓ_c(𝔸¹, ℒ_ψ) = 0`; for a local `Λ` of residue characteristic `ℓ ≠ p` it is the nontriviality of KL85 lines 442–446.
- **Inversion normalization.** With the shift `[r]` on both transforms, inversion reads `FT^{E^∨}_ψ ∘ FT^E_ψ ≅ [−1]^*(−r)` (LAU87 Théorème (1.2.2.1), LAU87 line 401), equivalently `FT_{ψ⁻¹} ∘ FT_ψ ≅ id(−r)`. The filed `(−1)^*(−r)[−2r]` carries a spurious shift.
- **Weight 0.** Character sheaves are stated weight-free: monodromy factors through a finite group, and Frobenius traces are roots of unity. "Pure of weight 0" is then a DeligneWeightsAndPurity §0.1 consequence.
- **Locators.** Laumon's proof of Deligne's theorem is LAU87 §4, pp. 203–208 (LAU87 lines 2488–2657), not §3; §3 is the product formula. The Katz–Laumon paper is *Transformation de Fourier et majoration de sommes exponentielles*, Publ. Math. IHÉS 62 (1985), 145–202. Brylinski's chapter on the transform is Ch. IX (BRY86 line 43).

## Final targets

Throughout, `Λ` is a torsion coefficient ring as in Generality, `D(X, Λ)` is the derived category of étale `Λ`-sheaves of EtaleCohomologyFoundations, and `Rf_!` is its canonical lower shriek on compactifiable morphisms. Adic statements are realizations through EtaleCohomologyFoundations §F.4.

**T1. Kernel transforms.**

- **Setting.** Let `S` be qcqs, `N` invertible on `S` with `NΛ = 0`, and `X`, `Y`, `Z` separated finitely presented compactifiable `S`-schemes. For `𝒦` in `D(X ×_S Y, Λ)` and an integer `a`, define `Φ_𝒦(K) = Rp_{Y!}(p_X^*K ⊗ 𝒦)[a]`.
- **Composition.** Construct the composition isomorphism `Φ_{𝒦'} ∘ Φ_𝒦 ≅ Φ_{𝒦' ∘ 𝒦}`, where `𝒦' ∘ 𝒦 = Rp_{XZ!}(p_{XY}^*𝒦 ⊗ p_{YZ}^*𝒦')` with the summed shift. It must be associative and unital (the unit kernel is `Δ_!Λ`), coherent with the composition and base-change isomorphisms of the six-operation structure, and compatible with base change along every `S' → S`.
- **Constructibility.** For Noetherian `S` and `𝒦` in `D^b_ctf`, `Φ_𝒦` preserves `D^b_ctf`.
- **Trace functions.** Over `S = Spec 𝔽_q` with descended `K` and `𝒦`, for every `n ≥ 1` and `y ∈ Y(𝔽_{qⁿ})`, `t_{Φ_𝒦 K}(y) = (−1)^a Σ_{x ∈ X(𝔽_{qⁿ})} t_K(x) t_𝒦(x, y)`.
- Locators: LAU87 (1.1.1.1)–(1.1.1.4), LAU87 lines 248–262; LAU87 Théorème (1.2.1.2), LAU87 line 389; BRY86 Ch. IX.

**T2. Character sheaves from the Lang torsor.**

- **Setting.** Let `G` be a smooth connected commutative group scheme of finite type over `𝔽_q`. Prove that the Lang map `L(x) = x − F(x)` (written additively) is a finite étale `G(𝔽_q)`-torsor. For a character `χ : G(𝔽_q) → Λ^×`, define `ℒ_χ` as the contracted product of that torsor with `χ⁻¹`, and prove it equal to the `χ`-isotypic part of `L_*Λ`.
- **Basic laws.** `ℒ_χ` is lisse of rank one with finite monodromy. It carries a rigidification at the origin and a multiplicativity `m^*ℒ_χ ≅ pr₁^*ℒ_χ ⊗ pr₂^*ℒ_χ` compatible with it. Prove `ℒ_χ ⊗ ℒ_χ' ≅ ℒ_{χχ'}`, `ℒ_χ^∨ ≅ ℒ_{χ⁻¹}`, and `ℒ_χ|_{G ⊗ 𝔽_{qⁿ}} ≅ ℒ_{χ ∘ N_{𝔽_{qⁿ}/𝔽_q}}`.
- **Trace.** Geometric Frobenius at `x ∈ G(𝔽_{qⁿ})` has trace `χ(N_{𝔽_{qⁿ}/𝔽_q}(x))`.
- **Vanishing.** `RΓ_c(G_k̄, ℒ_χ) = RΓ(G_k̄, ℒ_χ) = 0` whenever the elements `χ(g) − 1` generate the unit ideal.
- **Pullbacks.** For every `𝔽_q`-scheme `X` and `f : X → G`, put `ℒ_χ(f) = f^*ℒ_χ`, and prove `ℒ_χ(f + g) ≅ ℒ_χ(f) ⊗ ℒ_χ(g)`.
- **Artin–Schreier and Kummer cases.** The cases are `G = 𝔾_a`, giving the Artin–Schreier sheaves `ℒ_ψ` with `ℒ_ψ(af) ≅ ℒ_{ψ(a·)}(f)`, and `G = 𝔾_m`, giving the Kummer sheaves. Over an arbitrary field `k` containing `μ_N`, with `N` invertible, also define the Kummer sheaves of characters of `μ_N(k)`.
- **Local behaviour.** For a polynomial `f` of degree `d` prime to `p`, `ℒ_ψ(f)` is lisse on `𝔸¹` and totally wild at `∞`, with single break `d` and Swan conductor `d`. Its `H²_c` vanishes for nontrivial `ψ`, and `H¹_c` has rank `d − 1`. The local break is imported from ArithmeticGaloisRepresentations §3.7.
- Locators: LAU87 Exemple (1.1.3) and (1.1.3.1)–(1.1.3.7), LAU87 lines 299–367; KATZ01 Lecture II, KATZ01 lines 421–458; SGA45-ST (uncertified, by locator).

**T3. The Fourier–Deligne transform on a vector bundle.**

- **Setting.** Let `S` be a qcqs scheme over `𝔽_p`, `E` a finite locally free `𝒪_S`-module of rank `r`, `V(E)` and `V(E^∨)` the geometric bundles with pairing `⟨ , ⟩ : V(E) ×_S V(E^∨) → 𝔾_{a,S}`, and `ψ` nondegenerate. Define `FT_ψ(K) = Rpr'_!(pr^*K ⊗ ⟨ , ⟩^*ℒ_ψ)[r]` and its `*`-variant (LAU87 Définition (1.2.1.1), LAU87 line 378; KL85 (2.1.1)–(2.1.2), KL85 lines 376–377).
- **(a) `FT_! ≅ FT_*`.** First, local acyclicity at infinity: the projection `ℙ¹_S ×_S 𝔸¹_S → ℙ¹_S` is universally strongly locally acyclic relative to the extension by zero of `ℒ_ψ(xy)` (KL85 Théorème (2.4.4), KL85 line 567; LAU87 Théorème (1.3.1.2), LAU87 line 526). Second, the forget-supports map `FT_{ψ,!} → FT_{ψ,*}` is an isomorphism on all of `D(V(E), Λ)` (KL85 Théorème (2.4.1), KL85 line 447; LAU87 Théorème (1.3.1.1), LAU87 line 521).
- **(b) Inversion as data.** Give an explicit isomorphism `FT^{E^∨}_ψ ∘ FT^E_ψ ≅ [−1]^*(−r)`. This includes the computation `FT(π^*L[r]) ≅ σ'_*L(−r)` for `L` on `S`, with `σ'` the zero section of `V(E^∨)`. Hence `FT_ψ` is an equivalence with quasi-inverse `[−1]^*FT^{E^∨}_ψ(r)` (LAU87 (1.2.2.1)–(1.2.2.3), LAU87 lines 401–434).
- **(c) Duality.** Relative to `S`, `D(FT_ψ K) ≅ FT_{ψ⁻¹}(D K)(r)`, together with the bifunctorial form with `π'^!L` (LAU87 (1.3.2.1)–(1.3.2.2), LAU87 lines 553–565; KL85 Corollaire (2.1.5)(ii), KL85 line 390).
- **(d) Functoriality.**
  - Base change along every `S' → S` (LAU87 (1.2.2.9), (1.2.3.5); KL85 (2.1.5)(i)).
  - For a linear map `f : E₁ → E₂` of ranks `r₁`, `r₂`: `FT(Rf_!K) ≅ f^{∨*}FT(K)[r₁ − r₂]` (LAU87 (1.2.2.4), LAU87 line 435), with the zero-section corollary (1.2.2.5).
  - External products.
  - Additive convolution `K₁ * K₂ = Rs_!(K₁ ⊠ K₂)` with `FT(K₁ * K₂) ≅ FT K₁ ⊗ FT K₂[−r]`.
  - Plancherel: `Rπ'_!(FT K₁ ⊗ FT K₂) ≅ Rπ_!(K₁ ⊗ [−1]^*K₂)(−r)` (LAU87 (1.2.2.6)–(1.2.2.8), LAU87 lines 452–471).
  - Translation, sub-bundles and orthogonals, and linear group actions (LAU87 (1.2.3.1)–(1.2.3.4)).
- **(e) Coefficients.** Preservation of `D^b_ctf` over Noetherian `S`, and compatibility with change of `Λ`. The adic and `ℚ̄_ℓ` transforms are realizations, with (a)–(d) transported rather than re-proved.
- **(f) Trace and Frobenius.** For `S` over `𝔽_q` and descended `K`, for every `n`, `t_{FT_ψ K} = (−1)^r` times the finite Fourier transform of `t_K` for `ψ ∘ Tr_{𝔽_{qⁿ}/𝔽_p}` (LAU87 Théorème (1.2.1.2), LAU87 lines 383–391). The Plancherel identity of trace functions follows. Construct a canonical isomorphism `FT ∘ F^* ≅ F^* ∘ FT` for the `q`-Frobenius, compatible with composition. With it, the transform carries every Frobenius descent datum, and DeligneWeightsAndPurity §5.2 obtains the transform of a Weil complex.

**T4. Perverse `t`-exactness.**

- Over a field `k` of characteristic `p`, with finite-field, `E` or `ℚ̄_ℓ` coefficients, `FT_ψ` is `t`-exact for the middle perversity.
- It induces an equivalence `Perv(V(E)) → Perv(V(E^∨))` with the quasi-inverse of T3(b), and it sends simple objects to simple objects (LAU87 Théorème (1.3.2.3), Corollaire (1.3.2.4), LAU87 lines 566–577; KL85 Corollaire (2.1.5)(iii)).
- For integral coefficients, the design decides how the transform treats the two perversities `p` and `p⁺` of EtaleCohomologyFoundations §F.8.

**T5. The transform on the affine line.** Here `S = Spec k`, `r = 1`, and the coordinates are `x` and `x'`.

- **(a) Types.** Prove that the transform exchanges the punctual type with the type `ℒ_ψ(x s') ⊗ (constant)`, and preserves the type of irreducible middle extensions with no `ℒ_ψ(a x)` subquotient. Give the explicit formulas (LAU87 Théorème (1.4.2.1), LAU87 lines 609–638).
- **(b) Fourier sheaves.** Define elementary and Fourier sheaves and the naive transform `NFT_ψ = R¹pr'_!(pr^* · ⊗ ℒ_ψ(xx'))`. Prove that `NFT_ψ` sends (irreducible) Fourier sheaves to (irreducible) Fourier sheaves, with the inversion formula (ESDE (7.3.3)–(7.3.6) and Théorème (7.3.8), ESDE lines 7235–7300). Prove that the transform preserves the class of lisse sheaves on `𝔸¹` with all `∞`-breaks `> 1`, from T5(d) and involutivity, without stationary phase (ESDE §7.8 Class (1), ESDE line 7877; used by KATZ01 Lecture IV Step 1, KATZ01 lines 888–893). The break correspondence recorded there needs stationary phase and goes to the continuation.
- **(c) Kummer transform.** For a nontrivial Kummer `ℒ_χ` on `𝔾_m`: `j_!ℒ_χ = Rj_*ℒ_χ`, and `FT(j_!ℒ_χ[1]) ≅ j'_!ℒ_{χ⁻¹}[1] ⊗ G(χ, ψ)`. Here `G(χ, ψ) = H¹_c(𝔾_{m,k̄}, ℒ_χ ⊗ ℒ_ψ)` is the only nonzero cohomology and has rank one. Over `𝔽_q`, Frobenius acts on it by minus the Gauss sum (LAU87 (1.4.3.1)–(1.4.3.2), LAU87 lines 643–678).
- **(d) Local monodromy of the transform.** For perverse `K` on `𝔸¹` with lisse locus `U` and generic sheaf `F`, prove:
  - the generic-rank and stalk-rank formulas of the transform;
  - the lisse locus, in particular `U' = 𝔸¹ − {0'}` when `F_∞` is nonzero with all slopes `< 1`, and `U' = 𝔸¹` when all slopes are `> 1`;
  - the vanishing-cycle descriptions at finite points and at `∞'`;
  - at `0'`, the exact sequence that identifies the invariants with `RΓ_c` and the cokernel with the local term at `(∞, 0')`.

  Locators: LAU87 (2.3.1.1)–(2.3.3.1), LAU87 lines 924–1041. The specialization sequence at `0'` for `F` unramified at `∞` is LAU87 line 2623.
- **(e) Local Fourier transforms.** Define `F^{(0,∞')}`, `F^{(∞,0')}` and `F^{(∞,∞')}` on representations of the Galois group of a henselian trait of equal characteristic `p` by vanishing cycles (LAU87 Définition (2.4.2.3), LAU87 line 1091). Prove their exactness and concentration in one degree (LAU87 (2.4.2.2)), and their values on the trivial module and on nontrivial Kummer modules (LAU87 Proposition (2.5.3.1), LAU87 line 1170).

## Suppliers

On main:

- **EtaleCohomologyFoundations.**
  - §§G.1–G.3, 0.7–0.8 and F.2.4–F.2.7: compactifications, canonical `Rf_!`, base change, projection formula, Künneth.
  - §F.0.2 and §F.0.3: finite étale torsors, Tate twists, and, as revised in #1891, rank-one lisse sheaves from torsors and characters.
  - §F.1, §F.2.3 (local and universal local acyclicity) and §F.3a (henselian traits, tame character).
  - §F.3: finiteness and absolute affine vanishing.
  - §F.4: realization.
  - §§F.5–F.6: `f^!`, relative duality, smooth purity, and the six-operation structure of #1891.
  - §F.8: field perverse `t`-structure and intermediate extension.
  - §§F.10.1–F.10.3: Frobenius and perfect traces.
- **EnhancedDerivedSheaves** §§0.1–0.4: enhancement and tensor–Hom.
- **SchemeAndStackFoundations:** §0.3 relative Spec, §0.29 scheme Frobenius, §2.11 Artin–Schreier and Kummer torsors.
- **AlgebraicVectorBundles:** §L1A relative Spec and §L2B geometric vector bundles, duals.
- **ReductiveGroupsPartII** §RG2.3.7: Lang's theorem.
- **Mathlib:** `AddChar`, finite fields with traces and norms, the finite abelian Fourier analysis and orthogonality in `Analysis/Fourier/FiniteAbelian` and `Analysis/Fourier/ZMod`, `DerivedCategory`, `TStructure`.

Earlier in the merge order:

- **ArithmeticGaloisRepresentations** (#856, line 42), §3.1 (breaks and Swan conductors) and §3.7 (Artin–Schreier characters).
- **InverseGaloisAndArithmeticFundamentalGroups** (#850, line 44), §§IG.0.T2–IG.0.T3 (finite and rational trace formulas, applied fibrewise through proper base change). It also supplies the Euler characteristic of ℓ-torsion local systems on affine curves (finite-coefficient Grothendieck–Ogg–Shafarevich), for T5(d) at finite level.
- **LefschetzPencilsAndVanishingCycles** (#873, line 52), §§0.2–0.8 (nearby and vanishing cycles over henselian traits, the specialization sequence, change of trait) and §1.1 (local monodromy).

Needed but at present owned later: BBD 4.1.1–4.1.2 (perverse Artin vanishing for affine morphisms) and 4.2.5 (`f^*[d]` for smooth `f`). These are EtaleDualityAndPerverseSheaves §2.7 (#1040, line 96). T4 and the perverse parts of T5 need them before DeligneWeightsAndPurity; see Risk 1.

## Consumers

- **DeligneWeightsAndPurity** (#929). Its §5.2 lifts the transform to Weil complexes through T3(f). Its Layer 6, under the #1888 route, runs Laumon's argument (LAU87 §4.4) for its §§6.3–6.5 statement and for the ι-purity of the transform on the line. That argument consumes:
  - T3(b) and T3(f);
  - T4–T5(a) for the middle-extension and irreducibility step;
  - T5(d) for the lisse locus and the sequence at `0'`;
  - T5(e) for the tame local term;

  together with its own WII (1.5.1), (1.8.1) and (1.8.4) (WII lines 1085, 1500 and 1528). The Katz variant (KATZ01 Lectures II–IV) consumes T2, T5(b) and T3(f).
- **CongruenceSpectralGap** (#1504) §4.2b. Its "additive-character-sheaf" contract becomes T2 (Artin–Schreier sheaf, trace, tensor and base-extension laws, finite monodromy). Its Kloosterman realization uses T2 and the base change of T1.
- **CharacterSumsOverFiniteFields** (#1712). The trace-function reading it records but does not own (Gauss, Kummer, Artin–Schreier and Kloosterman sums as Frobenius traces) is T2 with T5(c).
- **HypergeometricMotives** (#1716), for hypergeometric sheaves through the transform and convolution; WeightsInEtaleCohomology (#1001), which #1888 points at this roadmap; SpringerResolutionAndCharacteristicCycles (#1828), for the Fourier transform on a Lie algebra as a vector bundle; SheafConvolutionOnAbelianVarieties (#1809), for the kernel-transform API of T1; and EtaleDualityAndPerverseSheaves Layer 5, for mixed perverse sheaves under the transform.
- **The continuation of this roadmap**, after DeligneWeightsAndPurity and EtaleDualityAndPerverseSheaves: stationary phase, local constants, relative perversity and the weight statements of KL85 (2.2.1).

## Sources

All in `packages/FourierDeligneTransform/sources.toml`.

| Key | Work | Locators used | Access |
| --- | --- | --- | --- |
| LAU87 | Laumon, *Transformation de Fourier, constantes d'équations fonctionnelles et conjecture de Weil*, Publ. Math. IHÉS 65 (1987) | §§1.1–1.4, 2.3–2.5, 4 | Numdam, open |
| KL85 | Katz–Laumon, *Transformation de Fourier et majoration de sommes exponentielles*, Publ. Math. IHÉS 62 (1985) | §1.2, §2.1, Appendice 2.4 ((2.4.1), (2.4.4)), (2.2.1) | Numdam, open |
| WII | Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980) | (1.5.1), (1.8.1), (1.8.4), (3.2.3) | Numdam, open |
| KATZ01 | Katz, *L-functions and monodromy: four lectures on Weil II*, Adv. Math. 160 (2001) | Lectures I, II, IV | author's page |
| ESDE | Katz, *Exponential Sums and Differential Equations*, Ann. of Math. Stud. 124 (1990) | §7.3, §7.8 | author's page (corrected manuscript) |
| BRY86 | Brylinski, *Transformations canoniques, …*, Astérisque 140–141 (1986) | Ch. IX–X | Numdam, open |
| LAU96 | Laumon, *Transformation de Fourier généralisée*, arXiv alg-geom/9603004 | §§0, 3, 7 (boundary only) | arXiv, open |
| SGA45-ST | Deligne, *Applications de la formule des traces aux sommes trigonométriques*, SGA 4½, LNM 569 | (4.3), (4.20) | paywalled, uncertified |
| KW01 | Kiehl–Weissauer, *Weil Conjectures, Perverse Sheaves and l-adic Fourier Transform*, Ergebnisse 42 | Ch. I, Ch. III | paywalled, uncertified |

Every final target has an open locator in LAU87, KL85, ESDE or KATZ01. The two paywalled works are corroborating citations only. No text is missing.

## Risks

1. **Merge-order cycle.** Every Fourier-transform proof of the curve estimate in the literature passes through perverse `t`-exactness on the line and the classification of its simple perverse sheaves (LAU87 §4.4 uses (1.4.2.1)(ii). That rests, through (1.3.2.4), on the proof of (1.3.2.3) at LAU87 lines 570–575, which uses BBD 4.2.5, 4.1.2 and 4.1.1). The same holds for KATZ01 Lecture IV through ESDE §7.8. Those BBD theorems are owned by EtaleDualityAndPerverseSheaves §2.7, which sits after DeligneWeightsAndPurity because its Layer 5 needs weights.

   Recommended move: transfer BBD 4.1.1–4.1.2 and 4.2.5 into EtaleCohomologyFoundations §F.8. That section already owns the field perverse `t`-structure, the absolute affine vanishing and intermediate extension, and is being revised in #1891. EtaleDualityAndPerverseSheaves §2.7 would then import them. With the move, this roadmap sits between lines 52 and 78 as above.

   Without the move there are two choices. (a) Order this roadmap after EtaleDualityAndPerverseSheaves; DeligneWeightsAndPurity then keeps its square-improvement proof (§§6.1–6.3 at #929's head), and Laumon's argument has no home. (b) Keep the weight-free triangulated part (T1–T3, T5(c)–(e)) before DeligneWeightsAndPurity and move T4–T5(a)–(b) to the continuation; the #1888 route is then blocked until that continuation exists. Choosing is the maintainers' decision.
2. **DeligneWeightsAndPurity is not yet restructured.** #929's head still plans the curve estimate by square improvement and lists no Fourier input. Until the Layer 6 restructure of #1888 lands, the weight half of the filed target has no Fourier-based owner. This roadmap must not fill that gap by restating DeligneWeightsAndPurity §6.5.
3. **Dependence on an unmerged revision.** The torsor-and-character construction and the six-operation structure exist only in EtaleCohomologyFoundations #1891. On main, §F.0.3 has twists only.
4. **Grothendieck–Ogg–Shafarevich with rational coefficients is claimed twice and ordered late.** CongruenceSpectralGap §4.2b says it is the single owner. EtaleDualityAndPerverseSheaves §5.2 also claims it. Both come after this roadmap, and CongruenceSpectralGap consumes it. T5(d) must therefore be proved at finite level from InverseGaloisAndArithmeticFundamentalGroups and realized, never by importing the rational formula. The double claim should be settled by its owners.
5. **The "additive-character-sheaf" contract names the wrong supplier.** CongruenceSpectralGap §4.2b attributes it to DeligneWeightsAndPurity, which does not contain it. It must be redirected to T2 here.
6. **Hypotheses.** These must stay general: compactifiability for `Rf_!`, the Noetherian hypotheses only where `D^b_ctf` and constructibility are asserted, and the nondegeneracy of `ψ` over non-field torsion rings. Stating the transform only over a field or only for `ℚ̄_ℓ` would be a route-specific shortcut.
7. **Scale.** The local-monodromy statements T5(d)–(e) need a careful nearby-cycles API on products of traits with the line. The full stationary-phase theory is deliberately left out. If T5(e)'s tame computation proves to need Gabber–Katz canonical extensions (LAU87 (2.2.2.2)), that theorem must be owned somewhere first.
8. **Sources.** No source blocks the design. SGA 4½ and Kiehl–Weissauer are paywalled and recorded as uncertified. ESDE is cited from the author's corrected manuscript, whose chapter-local page numbers differ from the printed book's, so locators use statement numbers.
