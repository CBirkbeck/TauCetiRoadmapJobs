<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6871506934 -->
Red team round 1 pass b (claude) of ef909e4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) README 5.3 (Stacks Lemma 24.13 for a filtered complex) is statable at the pins, and is neither stated nor named in the module docstring

   **Location.** `packages/SpectralSequencesAndConvergence/Suggested.lean:19–63` (module docstring) and
   `README.md:15–18` ("convergence of the spectral sequence of a filtered complex in the finite,
   cohomologically bounded and exhaustive-bounded-below cases") with `README.md:1275–1286` (target 5.3).

   **Claim.** The docstring lists what is stated and what is not statable. 5.4 and 7.5 are named as not
   statable; 5.3 appears in neither list, and only its spectral-object form (4.4) is stated.

   **Witness.** Every carrier of 5.3 is at the pins or in the file: `CochainComplex.spectralObject`,
   `CochainComplex.filtrationFunctor` (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:147, 304`),
   `HomologicalComplex.homologyMap`, and this file's `HasConvergenceBounds`. README 5.3's own route
   is exactly this statement.

   **Repair.** Add to `Suggested.lean`, in `## Layer 5`, before the Euler theorem (not elaborated in
   this pass, which runs no Lean; check it with `#check @name`):

   ```lean
   /-- **Convergence under cohomological boundedness** (README 5.3; Stacks, Tag 0BK5, Lemma 24.13, in
   one degree). Let `F` be an increasing filtration of a cochain complex `K`. If `H^n(F i)` and
   `H^{n+1}(F i)` vanish for every `i ≤ a`, and `H^n(F j) ⟶ H^n(K)` is an isomorphism for every
   `j ≥ b`, then the spectral object of `F` has convergence bounds `a`, `b` in degree `n`; so
   `convergence_of_hasConvergenceBounds` applies to the spectral sequence of `F`. -/
   theorem hasConvergenceBounds_spectralObject_filtration {C : Type u} [Category.{v} C] [Abelian C]
       {K : CochainComplex C ℤ} (F : ℤ → Subobject K) (hF : Monotone F) (n a b : ℤ)
       (hbot : ∀ i : ℤ, i ≤ a → IsZero ((F i : CochainComplex C ℤ).homology n) ∧
         IsZero ((F i : CochainComplex C ℤ).homology (n + 1)))
       (htop : ∀ j : ℤ, b ≤ j → IsIso (HomologicalComplex.homologyMap (F j).arrow n)) :
       HasConvergenceBounds
         (CochainComplex.spectralObject (CochainComplex.filtrationFunctor F hF)) n a b := by
     sorry
   ```

   Add the docstring bullet "the convergence bounds of the spectral object of a filtered complex
   whose stages have vanishing `H^n`, `H^{n+1}` below a bound and compute `H^n(K)` above a bound
   (README 5.3, Stacks Lemma 24.13)", and in README 5.3 after "and 4.4 applies." the sentence
   "Against the pins this reads `hasConvergenceBounds_spectralObject_filtration`: with `G` in Tau
   Ceti's increasing indexing, vanishing of `H^n(G_i)`, `H^{n+1}(G_i)` for `i ≤ a` and
   `H^n(G_j) → H^n(K)` an isomorphism for `j ≥ b` give `HasConvergenceBounds` of the spectral object
   in degree `n`."

   **Tested.** `K = (ℤ →(×2) ℤ)`, `n = 1`, `a = −2`, `b = 0`: `F_i = 0` for `i ≤ −2` (both
   cohomologies `0`), `F_j = K` for `j ≥ 0` (identity on `H^1 = ℤ/2`); conclusion is README 4.4's
   first Check. `K = ℤ` in degree `0`, `F ≡ ⊥`, `n = 0`: `htop` fails (`0 → ℤ`), as README 4.4's
   second Check requires. `b = −1` in the first example: `H^1(F_{−1}) = ℤ → ℤ/2` is not an
   isomorphism, hypothesis fails, as it must.

2. **F02** (P3) `EInfty` is attributed to the wrong Tau Ceti file

   **Location.** `README.md:273–276`: "`abutment`, `abutmentFiltration`, …, `EInfty`,
   `EInftyIsoCokernel`, … (`SpectralObject/Abutment.lean`), and `spectralSequencePageXIsoEInfty` and
   `coe_le_coe_add_one` (`SpectralObject/Stabilization.lean`)".

   **Witness.** At the pin `EInfty` is declared at
   `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:45`; `Abutment.lean` imports that file
   and declares `EInftyIsoCokernel` at line 92.

   **Repair.** Move the name: "`abutment`, `abutmentFiltration`, `abutmentFiltrationι`,
   `abutmentFiltrationMap`, `EInftyIsoCokernel`, `isZero_abutmentFiltration`,
   `isIso_abutmentFiltrationι` (`SpectralObject/Abutment.lean`), and `EInfty`,
   `spectralSequencePageXIsoEInfty` and `coe_le_coe_add_one` (`SpectralObject/Stabilization.lean`)".

3. **F03** (P3) `CochainComplex.spectralObjectHIsoCokernel` is used by 5.3 but absent from the supplier contracts

   **Location.** `README.md:1282–1286` (route and `*Needs:*` of 5.3) against `README.md:287–302`
   (the Tau Ceti filtered-complex contract).

   **Witness.** The declaration exists
   (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:224`, for `f : i ⟶ j`
   with `F.map f` a monomorphism: `H^n(f) ≅ H^n(coker (F.map f))`); the contract list names seventeen
   `CochainComplex.*` declarations and not this one.

   **Repair.** In the contract bullet, after "`CochainComplex.spectralSequenceFirstPageXIsoCokernel`"
   insert "`CochainComplex.spectralObjectHIsoCokernel` (for a monomorphism `F.map f`,
   `H^n(f) ≅ H^n(coker F.map f)`; with `f : ⊥ ⟶ i` this is `H^n(G_i)`)", keeping the file
   `SpectralSequence/Filtered/SpectralObject.lean`.

4. **F04** (P3) 3.3 has one discriminating Check

   **Location.** `README.md:750–756`: "The identity of a converging structure is a morphism." and
   "`(0, 0)` is a morphism from any converging structure to the zero one."

   **Claim / witness.** Both hold for any definition of morphism that contains identities and zero
   (they also hold if the compatibility with `β` is dropped), so they do not discriminate; only the
   `−1` Check does. The definition needs three.

   **Repair.** Replace the first and third Checks by:

   - "*`f` does not determine `h`.* For the `ℓ`-adic structure of 3.2 (`E_1^{p,−p} = ℤ/ℓ` for
     `p ≥ 0`, zero differentials, abutment `ℤ`), let `f` be multiplication by `2` on every page. On
     `gr^p ℤ = ℓ^p ℤ/ℓ^{p+1} ℤ ≅ ℤ/ℓ` multiplication by an integer `u` on `ℤ` induces `u mod ℓ`. So
     `(f, 2)` and `(f, 2 + ℓ)` are both morphisms, and `(f, 3)` is not (`3 ≢ 2 mod ℓ`)."
   - "*Weak convergence does not constrain `h`.* For the zero spectral sequence weakly converging in
     `{0}` to `ℤ` with the constant filtration (3.2, third Check), every endomorphism of `ℤ`
     together with `f = 0` is a morphism, since every graded piece is `0`; this is why 3.5 needs
     separation."

   Computed: `gr^p(2 + ℓ) = 2 + ℓ ≡ 2`, `gr^p(3) = 3`, `E_∞(f) = 2`; `3 − 2 = 1` is a unit mod every
   `ℓ`. In the second, `gr^p = ℤ/ℤ = 0` for all `p`.

5. **F05** (P3) a reference that no target cites, and a chapter no target uses

   **Location.** `README.md:1874` ("cartan-eilenberg1956: … Ch. XV (uncertified)"),
   `README.md:1871` ("mccleary2001 … Ch. 2 and 3"), `sources.toml` (`cartan-eilenberg1956`,
   `cited_for = ["References"]`; `mccleary2001`, `locator = "Ch. 2, Ch. 3"`).

   **Witness.** `cartan-eilenberg1956` occurs once in the README, in the References list; no target
   carries it. `mccleary2001` is cited once in the body, at 3.6, for Ch. 2.

   **Repair.** Cite it where it is the primary source: in 3.2, after "helle-rognes2024 line 94–98,
   Definition 2.7" add "(which attributes the definition to cartan-eilenberg1956 Ch. XV §2,
   uncertified)" (helle-rognes2024 line 94 gives that attribution), and set
   `cited_for = ["3.2"]`, `locator = "Ch. XV §2"` in `sources.toml`. Change the References entry of
   `mccleary2001` to "Ch. 2" and its manifest locator to `"Ch. 2"`, `cited_for = ["3.6"]`.

One P2 (a statable headline that `Suggested.lean` neither states nor names) and four P3. No false
statement was found: every Lean declaration and every README target was instantiated (table
below) and none failed. No finding of an earlier repair report is re-raised (none was marked
`not actionable in this package`).

## Adversarial pass: record

Notation: `K₂ = (ℤ →(×2) ℤ)` in degrees `0, 1`, `G_t = K₂` (`t ≥ 0`), `K₂^1` (`t = −1`), `0`
(`t ≤ −2`). `Kℓ` = the filtered complex of 1.4's last Check.

### `Suggested.lean` (11 declarations; context: no `variable` block, every binder is in the signature)

| Declaration (line) | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `BidegreeAssignment` (81) | cohomological `(p,q)↦(p,p+q)`, `e=0`; classical `(p,q)↦(−q−1,p+q)`, `e=1`; wrong `(p,q)↦(q,p+q)`; `(p,p)` | rel `(p,q)→(p+r,q+1−r)`: `Δdeg=1`, `Δfil=r`; classical `Δfil=r−1`; wrong model `Δfil=1−r` (no fixed `e`); `(p,p)` not injective | determines its object |
| `dFrom_eq_zero_of_boundedBelow` (99) | first quadrant `β(n)=n+1`, `e=0`, `pq=(1,0)`; no relation at `pq`; zero sequence | target `(fil+r−e, deg+1)`, zero iff `r ≥ β(deg+1)−fil+e = 2−1 = 1`; `dFrom = 0` when `c.next` is not related | true |
| `dTo_eq_zero_of_boundedAbove` (111) | first quadrant `α(n)=−1`, `pq=(1,0)`; `Kℓ` at `(0,0)` | source `(fil−r+e, deg−1)`, zero iff `r ≥ fil−α(deg−1)+e = 2`; `Kℓ`: nothing enters `(0,0)` | true |
| `HasConvergenceBounds` (124) | `K₂`, `n=1`: `(a,b)=(−2,0)`, `(−1,0)`, `(−2,−1)`; zero object `(5,0)`; `K=ℤ`, `G≡0` | `H^1(G_{−2})=0`; `H^1(G_{−1})=ℤ≠0`; `H^1(G_{−1})=ℤ→ℤ/2` not iso; zero: holds; `0→ℤ` mono, not iso: fails | sharp; mono-model excluded |
| `convergence_of_hasConvergenceBounds` (150) | `K₂`, `n=1`, `q=−2`: `r=3`, `r=2`; `q=0`; zero object `a=5,b=0,q=1`; `a>b` | bounds `q−a+2=2`, `b−q+1=3`: `r=3` allowed, page `=ℤ/2=EInfty`; `r=2` excluded and indeed `d_2=×2≠0` enters; `q=0`: `r≥4`, `EInfty 0 1=(ℤ/2)/(ℤ/2)=0`; `a>b` forces `H^n=0` | true; boundary side proved from mono at `j=q+r−1` |
| `isIso_hom_app_abutment_of_hasConvergenceBounds` (175) | `id`; `K′=ℤ → K=(ℤ→(id)ℤ)` in degrees `−1,0`, non-exhaustive | second: pages iso, `H^0: ℤ→0` not iso, and `H^0(⊥≤j)=ℤ→H^0(⊥≤⊤)=0` violates the top bound of `K` | true; hypothesis needed |
| `sum_negOnePow_homology_eq_sum_negOnePow_page` (194) | `ℚ→(×2)ℚ`; same over `𝔽₂`; `K=ℤ` in degree 0 with `F_i=⊥ (i<0), ⊤ (i≥0)`; `s=∅`; `P` = uniquely divisible groups | page 2: `ℚ` at `(1,−1)`, `(3,−2)`, sum `1−1=0=0`; `𝔽₂`: `0 = 1−1`; `ℤ`: `s={(1,−1)}`, `1=1`; `s=∅` ⇒ all `H^n=0`; sign `(−1)^p` gives `−2` | true |
| `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow` (224) | `ℤ→ℤ_ℓ` `ℓ`-adic; `K′→K` non-exhaustive; `K₂` identity, `a=−2` | first: `G_a=ℓ^{−a}ℤ≠0`, `hFa` fails; second: `⊔ im = 0 ≠ ⊤` in degree `n−1=−1`, `hGex` fails; third: all hold | true; `Z^t/B^t = colim_r Z^t/B_r` uses exact `ℕ`-colimits |
| `isReplete_iff_countableAB4Star_and_epi_towerDifference` (250) | `ModuleCat ℤ`, tower `ℤ/ℓ^{n+1}↠ℤ/ℓ^n`; discrete `Gal(ℚ̄/ℚ)`-modules, `μ_{ℓ^n}`; route tower `P_n=F_n⊕∏F_k` | `x_{n+1}` lifts `x_n−y_n`: `1−s` onto; `lim μ_{ℓ^n}` = smooth vectors of `ℤ_ℓ(1)` = `0`, projection not epi; cone compatibility `f_nx_{n+1}+(x_n−f_nx_{n+1})=x_n` | both directions hold |
| `IsMittagLeffler` (261) | `ℤ/ℓ` with zero maps; `×ℓ` on `ℤ`; epi tower | images `0` for `k>n` (`m=n+1`); images `ℓ^{k−n}ℤ` strictly decreasing; `m=n` | "eventually epi" model rejected by the first |
| `epi_towerDifference_of_isMittagLeffler` (270) | zero-map tower; finite groups; `×ℓ` on `ℤ` | pro-zero: `1−s` iso; stable images epi subtower + pro-zero quotient; `×ℓ`: not ML, `lim¹=ℤ_ℓ/ℤ` | true |

### README targets (31)

| Target | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 | `ℤ/4` from `4ℤ ≤ ℤ`; swap marking on `ℤ²`; `X=0` | `2ℤ/4 ↦ 2ℤ`; axis `ℤ×0 ↦ 0×ℤ`; interval a point | holds |
| 1.2 | `×2` example | `Z_3(0,1)=0=B_3`, `Z_3(2,0)=ℤ`, `B_3(2,0)=2ℤ` | holds |
| 1.3 | `×2` example | stabilises at `(2,0)` from 3, not 2 | holds |
| 1.4 | `Kℓ` | `gr^0=ℤ` (deg 0), `gr^p=ℤ/ℓ` (deg 1); `Z_r(0,0)=ℓ^{r−1}ℤ`, `Z_∞=0`, every `E_r^{0,0}≅ℤ` | holds |
| 2.1 | `coreE₂HomologicalNat` `(p,q)↦(−p,−p−q)` | rel `(p,q)→(p−r,q+r−1)`: `Δdeg=1`, `Δfil=r`, `e=0` | holds |
| 2.2 | first quadrant `β=n+1`, `α=−1`; `Kℓ` | `r ≥ q+2` and `r ≥ p+1`, i.e. `r>max(p,q+1)`; `Kℓ`: degree 1 unbounded below, `(0,0)` not regular | holds |
| 2.3 | `ℤ/4→ℤ/2`; `finrank` on `k^(ℕ)` | `−2+1=−1=−1+0`; `0≠1+0` | holds |
| 3.1 | `ℓ`-adic `ℤ`, `ℤ_ℓ`; constant; finite | `lim ℤ/ℓ^p=ℤ_ℓ≠ℤ`; complete ⇒ separated | holds |
| 3.2 | `K₂` data; `ℓ`-adic `ℤ`; zero + constant | `E_∞^{1,0}=ℤ/2=gr^1H^1`; exhaustive, separated, not complete; all `gr=0` | holds |
| 3.3 | `(−1, id)` | `gr^0(id)=1≠−1` | holds (Checks: R04) |
| 3.4 | Euler route; two controls | `f+r′−e > f₊` when `r′>f₊−f₋+e`; `0` vs `−1`; `0` vs `1` | holds |
| 3.5 | `0`/constant `ℤ`; `ℤ→ℤ_ℓ` | `h` not iso in both; strong case: colimit then limit | holds |
| 3.6 | two rows `S¹→S³→S²`; `m≥1` sequence; `m=0` | `H^1=H^2=0`, `H^0=H^3=ℤ`; `d_r` from `(0,m)` lands at `q=m+1−r∈[1,m−1]` for `2≤r≤m`; `m=0` not exact at `H^0` | holds |
| 4.1 | `K₂` at `(1,−1)`; `Fin 3`, `r=3`; `K=(ℤ→(id)ℤ)`, `G_1=K^1` | `Z_3=ker(×2)=0`; indices `(0,0,1,2)`, `(0,1,2,2)`; `E^1(−1≤0≤1≤2)=0` while `ℕ×ℕ` homology is `ℤ`, `H^0(1≤2)=ℤ≠0` | holds; Mathlib indices `q−r+2, q, q+1, q+r−1` confirmed |
| 4.2 | `K₂`, `n=1` | `F^3=Filt(−1)=ℤ/2`, `F^4=Filt(−2)=0` | holds |
| 4.3 | cycle side; boundary side with `j<q+r−1`; continuity example; `K₂` at `(3,−2)` | `H^{n+1}(⊥≤q−r+2)→H^{n+1}(⊥≤q)` factors through `H^{n+1}(⊥≤i)=0`; `B_{j−q+1}=Bᵗ` and `B_r` increasing, bounded by `Bᵗ`; `ℤ→0` onto, not injective; `max(2,3)=3` | holds |
| 4.4 | page bounds; first quadrant | `F^p=H^n` iff `p≤n+1−b`, `=0` iff `p≥n+1−a`; `q<b ⇒ q−a+2, b−q+1 ≤ b−a+1`; first quadrant `a=0`, `b=n+1` from `isZero₁`, `isZero₂` | holds |
| 4.5 | third quadrant `m=−2` | `isZero₁: 0<i`, `isZero₂: j≤n` give `b=1`, `a=m`; positions `(p,2−p)`; `gr^s=EInfty(−q)` | holds |
| 4.6 | as Lean row | | holds |
| 5.1 | `K₂` | classical `(0,0)`, `(1,0)` ↔ native `(1,−1)`, `(3,−2)`; `d=+2` | holds |
| 5.2 | `K^0=ℤ^(ℕ)⊕ℤ` | comparison = projection with kernel `0⊕ℤ`; `B_∞=0≠Bᵗ` | holds |
| 5.3 | `K^m=ℤ (m≥0)`, `F^pK^m=ℤ` iff `p≤m`; `Kℓ`; degree-`n` mono suffices | `p₁=n`, `p₀=n+2`, `gr^nH^n=ℤ`; `H^1(F^sKℓ)=ℓ^{s−1}ℤ≠0`; `x=dy∈F^s`, class dies in `H^n(K)` ⇒ `x∈d(F^s)` | holds |
| 5.4 | route | `colim G_j/G_{q+1} → K/G_{q+1}` iso in degree `n−1`, mono in degree `n` ⇒ same `(n−1)`-cycles ⇒ epi on `H^{n−1}` | holds |
| 6.1 | `ℤ²` couple; degrees; shift | `jk(x,y)=(y,0)`, page 2 `=0`; `(1,0)+(r−1)(1,−1)=(r,1−r)`; `e′=e−k=0` | holds |
| 6.2 | Bockstein; `ℤ/ℓ²` couple | `Z_2=k^{−1}(ℓℤ/ℓ²)=E`; wrong model gives `ℤ/ℓ⊕0` | holds |
| 6.3 | degrees; `K₂` | `c=(2,−1)`, `d_r` of degree `(r+1,−r)`; tower `0, ℤ, ℤ/2` at `p≥4, 3, ≤2` | holds |
| 7.1 | completeness ⇒ `lim¹=0` | `(1−s)σ=−incl`; `τ=Δc−σ`, `(1−s)τ=id` | holds without `AB4*` |
| 7.2 | as Lean rows; enough projectives | lift `P→F_0` along the tower, factor through any limit cone | holds |
| 7.3 | `i=×ℓ` | `×ℓ` on `ℤ_ℓ/ℤ` bijective (`ℤ_ℓ=ℓℤ_ℓ+ℤ`; `ℓx∈ℤ ⇒ x∈ℤ`); `0→0→ℤ_ℓ/ℤ→ℤ_ℓ/ℤ→0` | Check holds; route see Not verifiable |
| 7.4 | limit and colimit step couples; Example 8.1 | `A_1^{+∞}=ℤ`, `gr^0=ℤ=E_∞^{0,0}`, `A_0^{+∞}=0`; `E_1^{s,−s}=k (s≥0)`, `E_1^{s,−1−s}=k (s<0)`, `K∞Im^r=⨁_{i≥r−m}k`, `lim¹=∏_{i≥m}/⨁_{i≥m}`; half-plane: `coker i ⊂ E` (degree `n`), `ker i = im k` (degree `n−1`) | holds |
| 7.5 | `ℤ_ℓ`; `ℤ`; first-quadrant class | `1−s` iso on `∏F^sK` ⇒ `lim=lim¹=0` on cohomology; `β=n+1`, `α=−1` | holds |

## Verified sound

- **Declarations read: 11 of 11** (1 structure, 2 definitions, 8 theorems), every line of
  `Suggested.lean`. Elaborated types: compared the worker's `signatures.md` (11 declarations; its
  twelfth entry `that`, "line 59", is the word "that" of the module docstring read as a
  declaration, not a declaration and not an elaboration error) with the README statements; all
  agree, no binder is lost, there is no `variable` block. No Lean was run in this pass.
- **Targets read: 31 of 31**, every line of the README (1874 lines).
- **Locators verified: 59 of 59 line locators** against the cached texts: stacks-012K 36,
  helle-rognes2024 20, bhatt-scholze2015 2, browning-sawin2020 1 (two ranges). All point at the
  stated item. The 26 mentions of uncertified sources were not checked (below).
- **Checks: 116 read**; every Check that carries values was recomputed (rows above); R04 is the
  only defect.
- **Pinned declarations.** The citation resolver finds every backticked Lean name of the README at the pins or in a sibling (its two leads are DerivedModuleAlgebra names, below); 64 names of the supplier contracts and `*Needs:*` lines were also grepped by hand at the
  pins; all exist; R02 and R03 are the only defects. `coreE₂Cohomological` indices,
  `IsFirstQuadrant`/`IsThirdQuadrant` fields, `mapFourδ₁Toδ₀'`/`mapFourδ₄Toδ₃'` directions and
  their isomorphism criteria, `TauCeti.IsReplete`, `towerDifference`,
  `IsReplete.countableAB4Star`, `IsReplete.of_reflectsEpimorphisms`, the hypotheses of Tau Ceti's
  `isIso_hom_app_abutment_of_isIso_page` and `…_of_exhaustive` were read at the pin and agree
  with what the README says of them.
- **Duplication by object.** No pinned declaration proves any of the 8 theorems: Tau Ceti has the
  comparison only under endpoint vanishing with `a ≤ b`, the exhaustive comparison only for
  modules with a bound on graded pieces, Mittag–Leffler vanishing only for module towers, and no
  statement relating `IsReplete` to `towerDifference`. `roadmaps grep` finds no other
  `Suggested.lean` declaring any of the 11 names.
- **Sibling citations checked: 13**, all on main and all resolve: StableHomotopyKTheory §§7.21,
  7.22, 7.23–7.26; DGFloer Layer 1 items 2 and 3 (reindexing `(2p+q+1, −p−1)` agrees);
  AlgebraicTopology Stage 6 item 0 (§6.0); DerivedModuleAlgebra §S.1 (`r > max(p, q+1)`,
  `DoubleComplex.edgeBottom`, `DoubleComplex.edgeLeft` are that roadmap's names, its README line
  65); SchemeAndStackFoundations §§2.2, 2.17 (`IsReplete.derived_limits`, the `μ_{ℓ^n}` tower on
  `Spec ℚ`); ComplexKahlerGeometry K8; EnhancedDerivedSheaves E2:towers.1, E2.1, E2.2. HeegaardFloer and MorseTheory (named as owners of instances, no section) exist on main.
  Ownership against the open pull requests: no open or main roadmap owns the limit page,
  convergence structures, `lim¹` in an abelian category or the repleteness characterisation.
- **Gap.** `gap:exact-couple-morphisms` has the same slug and sentence in `design/plan.json` and
  README line 340, supplier StableHomotopyKTheory §7.22 (which exists and states couples and
  derived couples but no morphisms); precise and minimal.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 242 roadmaps, 2194 edges, 0
  problem(s)`; no UPWARD or CYCLE line. StableHomotopyKTheory is line 17 of the merge order, this
  roadmap line 18.
- **Policy.** The pull request changes only `packages/SpectralSequencesAndConvergence/`; no
  `lemma`, `set_option`, `#eval`, `#check`, `True` placeholder or sorry'd data; no pull-request
  number or process narrative in README or docstrings; imports are `import Mathlib` and five
  `TauCeti.*` modules that exist at the pin.
- **Padding.** None found: the three definitions are each used by a stated theorem; no
  declaration follows from one library lemma.

Source independence: 59 passages compared with 4 sources (and 6 further prose passages: 1.1, 2.3
route, 4.3 continuity, 7.1 completeness, 7.2 route, the `BidegreeAssignment` docstring), none
shared beyond formulae and standard names; largest share stacks-012K, 36 of 85 source mentions
(36 of 59 line locators); contents compared with stacks-012K, Homological Algebra §§10, 19–24, 31:
independent (§24 is split over Layers 2, 3, 4 and 5; §21 and §23 come after it, in Layer 6; Layer 4
has no counterpart; the order 1→3→4→5→6→7 is forced by the `*Needs:*` lines 3.2←1.4, 2.1;
4.4←3.2; 5.3←4.4; 6.3←4.1, 5.1; 7.4←6.2). weibel1994, boardman1999, eilenberg-moore1962,
mccleary2001, massey1952 and cartan-eilenberg1956 could not be read (settled uncertified).

## Not verifiable

- weibel1994 (Definitions 5.2.5, 5.2.11, Theorems 5.2.12, 5.5.1, 5.5.10, §§3.5, 5.9),
  boardman1999, eilenberg-moore1962 §7, mccleary2001, massey1952: uncertified, text not
  available; locators taken as given. The mathematics they are cited for was checked directly.
- 7.3, the route's claim that only exactness of countable products is used for the double-tower
  sequence in an arbitrary abelian category (the source proves it for graded modules): the
  `×ℓ` instance and an epimorphic tower were checked; the general cofinality step for the
  bi-indexed system was not reproved.
- 7.1, invariance of `lim¹` under cofinal subsequences "in any additive category": plausible by
  the split telescope argument, not reproved.
- `Suggested.lean` and the repair statement of R01 were not elaborated: this pass runs no Lean.
- 7.2 Check on light condensed modules and 4.6's second Check rely on Tau Ceti theorems whose
  statements were read but whose instances were not recomputed.

## Source issues

- **Misprint** in bhatt-scholze2015 at proof of Proposition 3.1.10, line 766 of the cached arXiv v2: the source says the auxiliary object `G_n` is the product over `i ≤ n` of `F_n`; it should be the product over `i ≤ n` of `F_i`; affects nothing.
- **Misprint** in helle-rognes2024 at proof of Lemma 3.13, line 186 of the cached draft: the source says the map from the limit to `A_s` is the colimit structure map; it should be the limit structure map; affects nothing.

## For the human reviewers

- **Licence.** boardman1999 is recorded uncertified with six locators taken second-hand from
  helle-rognes2024 and StableHomotopyKTheory §7.26; main's `TauCetiRoadmap/StableHomotopyKTheory/README.md`
  line 2874 links a copy on a university faculty page whose status was not classified here.
- **Not tested.** weibel1994 is the second most cited source (12 mentions) and could not be read;
  wording and arrangement were not compared with it. The largest-share source, stacks-012K, was.
- **Scope.** 5.4 and 7.5 state in abelian categories the theorems DGFloer Layer 1 item 3 owns for
  module complexes, and 7.4 the algebra of StableHomotopyKTheory §7.26 (`README.md:72–87`); the
  README declares both as specialisations. Whether the owners should later cite this roadmap is
  an ownership decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ef909e4b87a42d6ade2bd8c841aba03d0dfdbb3a", "job": "RT-SpectralSequencesAndConvergence~1b", "model": "fable", "worker": "chris-x55"} -->
