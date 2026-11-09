# Review of TangentialBordism (pull request #942 at d2fece9)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/TangentialBordism/` at d2fece9. Since 4e86746 the folder changed by 169 lines. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with nine `sorry` warnings and nothing else.

There are three findings:
- one P2: a B6.3 headline is statable at the pins, but the module docstring says it is not;
- two P3: the description still omits the revision that defines a cited id, and the central isomorphism of a sampled target has no locator.

## R01 (P2) — Thom's mod-2 realization theorem (B6.3) is statable at the pins but absent; the docstring's reason does not hold

**Location.**
- `TauCetiRoadmap/TangentialBordism/Suggested.lean:61–63` lists "the mod-2 realization theorem of B6.3, `ΩO_n(X) → H_n(X; F2)` onto in every degree" as not statable, because "there is no mod-2 fundamental class of a non-orientable closed manifold".
- `README.md:320–322` makes the same claim.
- README 10.1 states the theorem at `:2924–2925`.

**Claim.** A mod-2 fundamental class cannot be expressed at the pins, so Thom III.2 cannot be stated.

**Witness.**
- The pinned gluing theorem `TauCeti.existsUnique_singularHomology_localHomologyRestriction_eq_of_invariant` (`TauCeti/AlgebraicTopology/Singular/LocalHomology/Section.lean:99`) is stated for every coefficient module `N : ModuleCat Λ` (`:39`). With `N = ModuleCat.of ℤ (ZMod 2)` it gives every compact boundaryless M exactly one class whose local images are the nonzero elements. That class is [M]₂, orientable or not (Hatcher §3.3, Theorem 3.26 and the definition after it, p.236: hatcherAT lines 10229, 10243–10246; millerCobordism lines 63–67).
- The statement below elaborates on a scratch copy against the pins with one `sorry` warning and no other message.

**Repair.**

1. Add the following statement to the Layer 10 section of `Suggested.lean`. It was tested as written with the file's existing imports and `open scoped Manifold ContDiff`.

   ```lean
   /-- Thom's mod-2 realization theorem (B6.3 for `A = ∅`; Thom, Théorème III.2, p.59, for finite
   polyhedra): every class `z ∈ Hₙ(X; ℤ/2)` of every topological space `X` is `f_*[M]₂` for a
   closed smooth `n`-manifold `M` and a continuous `f : M → X`. The mod-2 fundamental class is the
   class whose image in every local homology group `Hₙ(M, M ∖ {x}; ℤ/2)` is nonzero (Hatcher,
   §3.3, Theorem 3.26 and the definition after it, p.236); every closed `M` has exactly one. -/
   theorem exists_modTwoFundamentalClass_map_eq (n : ℕ) (X : Type) [TopologicalSpace X]
       (z : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
         (ModuleCat.of ℤ (ZMod 2))).obj (TopCat.of X)) :
       ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
         (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M)
         (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M)
         (μ : ((TopCat.toSSet.obj (TopCat.of M)).homology (ModuleCat.of ℤ (ZMod 2)) n :
           ModuleCat.{0} ℤ)) (f : C(M, X)),
         (∀ x : M, TauCeti.localHomologyRestriction (ModuleCat.of ℤ (ZMod 2))
             (Set.subset_univ {x}) n
             (((TopPair.ofSubset ((Set.univ : Set (TopCat.of M))ᶜ)).singularHomologyπ
               (C := ModuleCat.{0} ℤ) (ModuleCat.of ℤ (ZMod 2)) n).hom μ) ≠ 0) ∧
         (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
           (ModuleCat.of ℤ (ZMod 2))).map (TopCat.ofHom f)).hom μ = z := by
     sorry
   ```

2. In the module docstring:
   - delete the bullet at `:61–63`;
   - add the mod-2 statement to the Layer 10 sentence at `:30–34`.

   The pair form (`:57–60`) stays as not statable.
3. In the README:
   - Name `exists_modTwoFundamentalClass_map_eq` in the summary (`:15–20`) and as a fourth bullet in 10.1 (`:2982–2990`).
   - Replace "and no mod-2 fundamental class of a non-orientable closed manifold" (`:321–322`). The new text should say that the pin names no mod-2 class, but that `TauCeti.existsUnique_singularHomology_localHomologyRestriction_eq_of_invariant`, stated for every coefficient module, characterizes [M]₂ by its local images.
   - Add that declaration and `TauCeti.localHomologyRestriction` to 10.1's *Needs:* line.
   - Add a Check: H₂(RP²;ℤ)=0, but [RP²]₂≠0 is realized by the identity of RP², so no integral statement contains this case.

Instances tested:
- n=0: the local condition forces μ=Σ[x]. Any Σεᵢ[xᵢ] is realized by one point over each xᵢ with εᵢ=1.
- M=∅: μ=0 and the condition is vacuous, so z=0 is realized.
- Dropping the condition would also accept μ=0 on a nonempty M, so the condition is what pins [M]₂.

## R02 (P3) — The description still lists the closed #1663 and omits #886, the only head that defines DifferentialGeometry 5.5b

Re-raised: H04

**Location.** In the pull-request description, quoted as data:
- "- [ ] depends on: #1663";
- "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

#886 appears nowhere in it.

**Claim.** The description names every open revision whose numbering the README cites, and names only open pull requests.

**Witness.**
- The README cites DifferentialGeometry 5.5b at `:96`, `:418–419`, `:514`, `:552–565`, `:773`, `:999` and `:1091`.
- DifferentialGeometry on main (3090489) contains "5.5b" 0 times; #886 defines it (`TauCetiRoadmap/DifferentialGeometry/README.md:224`).
- `scratch/overlaps.md` lists §5.5b as defined only by #886.
- The roadmap index of 2026-11-09 has no #1663.

**Why the reason in H04 fails.** H04 says the change is "to the description only". The brief's overlap rule makes an uncited revision P3 until the description names it. The description is part of the pull request and is still unchanged after the repair round.

**Repair.** No file in the folder changes; edit the description only:
- delete "depends on: #1663";
- add #886 to the Depends-on block;
- write the revision line as "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".

## R03 (P3) — 5.4 (B5.4) states its central isomorphism without a source locator

**Location.**
- `README.md:1787–1791`: "G3.3's arbitrary-CW comparison theorem gives the natural group isomorphisms `Ω^ξ_n(X,A)≃π_n(Mξ∧Σ∞(X/A))` on all CW pairs".
- The only literature mention in 5.4 (`:1824`) says what the passage is *not* attributed to.

**Claim.** Every theorem of a sampled target carries a locator.

**Witness.** millerCobordism lines 1562–1566 (Chapter 2, §1, Theorem 1.4, p.41) state Thom's isomorphism Ω^G_*(X)≅π_*(MG∧X₊) for every fibration over BO and every space X. 5.5 cites the same theorem (`:1844`), but only for the framed case.

**Repair.** After "no separate cell induction is carried out here" (`:1791`), add: "For absolute X and a fibration B→BO this is Thom's theorem as stated in Miller, Chapter 2, §1, Theorem 1.4, p.41; the pair form, the fixed-rank inverse and the morphism of theories are the targets owned here."

## Verified sound

### The previous review's findings (PRREVIEW-TangentialBordism~27, repair report H01–H05)

- **R01, integral part: repaired.**
  - `Suggested.lean:199–247` adds `exists_mapFundamentalClass_eq`, `exists_pos_forall_mapFundamentalClass_eq_nsmul` and `exists_not_mapFundamentalClass_eq_seven`.
  - The README names all three at `:15–20` and `:2982–2990`.
  - The mod-2 part is R01 above.
- **R02, BordismFormalGroups ownership: answered and not re-raised.**
  - #1854 (80ff9a4) still says BordismFormalGroups F2 is the "single owner of the mod-p Steenrod operations" (`:56`) and that "TangentialBordism consumes F2's Steenrod operations" (`:62`, `:681`, `:3410`).
  - Main's BordismFormalGroups consumes TB B4 (`:172`, `:1006`, `:2759`), exactly as this README says at `:40–46` and `:3364–3367`.
  - The folder cannot cite another author's revision of a roadmap on main, so the answer's reason holds. The settlement is #1854's.
- **R03, K3BlochGroups: repaired.** `:79–84` now reads "later roadmaps that use the relation consume B3.3; FourManifolds, which lists B3.3 among its suppliers, uses it for the Lie framing of T³". The Downstream sentence about K3BlochGroups is gone.
  - #1430 (dcd87e4) still proves `etaCube_eq_twelveNu` itself (`:1347–1369`). That duplicate is #1430's to replace by a citation of B3.3: TangentialBordism is line 14 of ORDER.txt, K3BlochGroups line 138.
  - FourManifolds #936 (`:2881`) uses the relation with a Kirby–Melvin locator.
- **R04, description: not repaired.** See R02.
- **R05, 3.4 locators: repaired.** `:1187–1188` cites Miller Ch.1 §1, pp.1–2 (millerCobordism lines 76–91 and 119–126). `:1195–1197` cites Milnor–Stasheff §17.2, p.209 (milnorStasheff line 5503, printed p.209). `milnorStasheff` is now in the manifest.

### Gate, order, build, signatures and padding

- **Gate** (rerun on this head): every check is 0 and OK, the same as `scratch/gate.md`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** (`--movable`):

  ```
  depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. In ORDER.txt this roadmap is line 14, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). No roadmap on the never-cite list occurs in the README: I grepped all 13 names.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 in 9 s. Its only output is nine `declaration uses sorry` warnings, at `:87`, `:108`, `:126`, `:142`, `:171`, `:189`, `:207`, `:222` and `:238`.
- **`#check @` on all nine declarations**, in one scratch file. Every README binder is present:
  - the three new statements quantify `X : Type` and `M : Type` with `T2Space`, `CompactSpace`, `ChartedSpace (EuclideanSpace ℝ (Fin n))` and `IsManifold (𝓡 n) ∞`;
  - the hypotheses `n ≤ 6` and `0 < N` are kept;
  - `CompactSpace X` is kept in the degree-seven statement.

  The file has no section `variable`s, so no binder can be lost. I changed no file.
- **Padding probe.** I replaced every `sorry` by `first | rfl | trivial | simp | aesop` on a scratch copy. All nine fail: seven with "unsolved goals" and two (`:118`, `:134`) with "aesop made no progress". None is padding.

### Headline theorems

Stated:
- relative smoothing (`exists_contMDiff_homotopicRel`);
- unequal-dimension Sard for boundaryless and for half-space sources;
- oriented three-manifold parallelization;
- ΩSO_n=0 for 1≤n≤3 and ΩO_n=0 for n=1,3, as nullbordism statements;
- integral realization for n≤6, Thom's uniform multiple, and degree-seven sharpness.

Statable but absent: mod-2 realization (R01).

Named as not statable, with each reason checked at the pins:
- corner Sard: the pin has no face structure;
- transversality: the pin has no map-transversality predicate;
- bordism groups and Wall's ring: `SingularManifold` has no quotient;
- Spin entries: there is no manifold Spin structure;
- PT isomorphisms: there are no Thom spectra;
- Steenrod operations, ABS and KO: none of these exist at the pin;
- the B6.3 pair form: `fundamentalClassOn` covers only compact subsets of boundaryless manifolds;
- B6.5: there are no transfers;
- the Cayley plane: the compact Albert algebra is not at the pin.

### Seeded sample: locators read in the text

| Target | README locator | Where in the source | Result |
| --- | --- | --- | --- |
| 2.3 (B1.5) | Munkres Thm 10.6, p.104 | not readable | Not verifiable |
| 2.4 (B1.2) | Milnor–Stasheff Thm 17.1, Lemma 17.2, pp.206–207; Miller Defs 1.1–1.2, pp.1–2; Ch.2 Defs 1.1, 1.3, pp.39–41 | milnorStasheff 5439 (p.206), 5457–5465 (p.207); millerCobordism 95, 104 (p.2), 1453 (p.39), 1538 | supports |
| 2.6 (B1.4) | none; the embedding is Mathlib `exists_embedding_euclidean_of_compact` | — | constructions only; no locator needed |
| 3.2 (B2.2) | Miller Ch.1 §1, p.2; Milnor–Stasheff Ch.17, pp.207–208 | millerCobordism 114–118; milnorStasheff 5470–5481 (sign (−1)^(mn), p.208) | supports |
| 3.3 (B2.3) | Freed Lecture 12, p.103; Miller Thm 4.2 and remark, p.10 | freedBordism 4226–4246; millerCobordism 392, 407 | supports |
| 3.4 (B2.4) | Miller Ch.1 §1, pp.1–2; Milnor–Stasheff §17.2, p.209 | millerCobordism 76–91, 119–126; milnorStasheff 5503 | supports |
| 4.3 (B4.3) | Milnor–Stasheff Thm 11.14 (no page) | milnorStasheff 3651, printed p.141 (the manifest record says p.140) | supports |
| 5.2 (B5.2) | Thom IV.8, p.75 | thom1954 2462 (page ends "75") | supports; the four-point word was recomputed |
| 5.4 (B5.4) | none for the main isomorphism | Miller Thm 1.4, lines 1562–1566 | R03 |
| 5.5 (B5.5) | Miller Ch.2 Thm 1.4, p.41; Ch.1 §1, pp.1–2; §5, pp.12–14 | millerCobordism 1565; 119–126; contents line 22 | supports |
| 6.6 (B6.2) | Wall, Lemmas 7–13, Thm 1, pp.292–311 | image scan from the References' Edinburgh URL: Lemma 7 p.300; Lemmas 8–9 p.303 (∂₂σ(1)=0, ∂₂σ(2)=1, ∂₂σ(i)=σ(i−2); τ coefficient {i−k,2k−i−1}); proof of Thm 1, §6, p.302 | supports the parts read |
| 7.1 (B3.0) | Atiyah–Bott–Shapiro §§10–11 | uncertified | Not verifiable |
| 8.3 (B3.3) | Hatcher §4.2, p.385; Freed (5.57), p.45; Beaudry–Campbell Fig. 31, p.41 | hatcherAT 16749–16752; freedBordism 1805, 1817; beaudryCampbell 1740–1741 | supports |
| 9.3 (B3.8) | Borel–Hirzebruch §19, Thm 19.4 | borelHirzebruchI 3021–3023 | supports |
| 10.4 (B6.6) | Rosenberg–Stolz Thm 3.3, p.8; Kreck–Stolz Prop 4.2, Lemma 4.3 | rosenbergStolz 302–313; Kreck–Stolz uncertified | first supports; second Not verifiable |

Further locators read:
- Thom III.2–III.4, p.59 (thom1954 1818–1828; III.4 says that N depends only on the dimension), Corollaire III.7, p.62 (1911), III.9 with the L⁷×L⁷ example, pp.62–63 (1936–1969), and IV.6, p.74 (2410).
- Borel–Hirzebruch (13), p.519 (2417).
- StringOrientation S2.2 (#948 `:551–606`): it states only the coefficient isomorphism, as 5.4 says.
- The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_mapFundamentalClass_eq` | n=0, X=pt; n=1, X=S¹; n=6, X=B(ℤ/3); n=7 | z=k[pt]: \|k\| points with sign of k, and z=0 by M=∅. k[S¹]: the k-fold cover, orientation reversed for k<0 (`mapFundamentalClass_neg`, `:316`). H₆(B(ℤ/3);ℤ)=ker(3)=0. n=7 is excluded by the sharpness statement. | pass |
| `exists_pos_forall_mapFundamentalClass_eq_nsmul` | N=0; n≤6; n=7 | N=0 gives 0•z=f_*[∅] for every z, which is vacuous, so `0<N` is needed. N=1 for n≤6. Thom's z has 3z=0, and N≡1,2 mod 3 gives ±z, which is not realized, so 3 divides N₇. Quantifier order ∃N∀X matches thom1954 1826. | pass |
| README route for N_n (10.1 `:2931–2943`) | π_qF; n=5 | π₀F=0 because π₀MSO≅π₀HZ. τ_(≥n)F∧X/A has π_(n−1)=0. [HZ,Σ⁵HZ]=H⁵(HZ;ℤ) is finite. | pass |
| `exists_not_mapFundamentalClass_eq_seven` | z=0; V=L×L | ∅ realizes 0, so the witness is nonzero. V is a closed 14-manifold, hence compact. 3z=0. P¹β pairing −v₁v₂u₁³u₂³≠0 mod 3 (thom1954 1961). ∀o ranges over the orientations only (AlgebraicTopology 6.3 at #1652 `:2588`). | pass |
| R01 statement | n=0; ∅; RP² | μ=Σ[x]; μ=0; [RP²]₂ is realized by id while H₂(RP²;ℤ)=0. Elaborates. | to add |
| 10.1 integral range (AHSS) | n=5, 6 | d₂–d₄ hit ΩSO_1–3=0. d₅: H₅→H₀ is torsion-free, so d₅=0. For n=6, d₅ into H₁ is killed through B(ℤ/m) because H₆(B(ℤ/m))=0. d₆ into H₀(ΩSO₅) is killed through S⁰. | pass |
| `exists_contMDiff_homotopicRel` | C=M; S¹ with D={\|p−q\|<1} | g=f with the constant homotopy. g=−z has \|g−f\|=2∉D, so it is excluded. | pass |
| Sard, boundaryless | t↦(t,0); ℝ_δ→ℝ | The line is null. ℝ_δ is critical everywhere with image ℝ, which is not null, so `LindelofSpace` is needed. | pass |
| Sard, half-space | [0,∞), t and t² | t is regular at 0 but critical on the stratum {0}; t² is critical at 0 with image {0}. | pass |
| Parallelization | ℝ³ frame; e₁ negated; RP²×S¹ | det 1; det −1 fails positivity; RP²×S¹ has no oriented atlas, so it is excluded. | pass |
| ΩSO_n=0 headline | n=0,…,4 | pt has count 1 (excluded); S¹=∂D²; Σ_g bounds a handlebody; n=3 is Thom IV.13; CP² has σ=1 (excluded). | pass |
| ΩO_n=0 headline | n=0,…,3 | a point has odd count; S¹=∂D²; RP² has χ=1 (excluded); RP²×S¹=∂(RP²×D²). | pass |
| 2.3 Checks | ℝ/ℤ; S³/S¹; mapping tori; [−1,1] | S¹; CP¹ with fibre S¹; T² and the Klein bottle; 2 boundary points; rank-0 disc a point with empty sphere | pass |
| 2.4 Checks | glue [0,1]∪[1,2] | endpoints −[0]+[2], total 0 | pass |
| 2.6 Checks | pt, two points | ℝ⁰ holds one point; two points need ℝ¹ | pass |
| 3.2 Checks | 1-dim × 1-dim | (−1)^(1·1)=−1; even dimensions give +1 | pass |
| 3.3 Check | ([0,1],{0,1}) | ∂=(−1,+1), sum 0 | pass |
| 3.4 Checks | ±pt; RP² | ±1, both 1 in F₂; [RP¹]·[RP¹]=1 | pass |
| 4.3 Checks | RP², S², tautological line | w=1+a+a²=Sq(1+a); w₂[S²]=2≡0; Sq¹U=aU | pass |
| 5.2 four points | S¹∨S¹=Σ({a,b}₊) | aba⁻¹b⁻¹≠1 in F₂; aa⁻¹bb⁻¹=1 | pass |
| 5.4 Checks | θ=π/2; X={x,y} | (cos θ·e, sin θ·e)↦(e,0); (1,0),(0,1) in MSO₀(X)=ℤ²; abelianized counts (0,0) | pass |
| 5.5 Checks | framed points; interval | +1, −1, 0; 1−1=0 | pass |
| 6.6 Checks | RP²; oriented point; σ₄; Y₆Y₅ | H¹(RP²;ℤ)=0; 1−ρ=2; ∂₂²σ₄=1; δ(Y₆Y₅)=Y₅². Dold P(1,2) has dimension 1+4=5 for k=3 | pass |
| 7.1 Checks | K3, K3×K3, Spin S¹ | Â=48/24=2, c(a)=2u², α=a; a²=4b; η∈KO₁ with zero complexification | pass |
| 8.3 | ℤ/24 | ord(12ν)=2, ord(4ν)=6; 12≡4 mod 8, which is h₀²h₂. Adams E₂ in stems ≤5 leaves no room for differentials in stems 1–3. | pass |
| 8.4 Checks | RP⁴, RP²×RP², CP² | (w₄,w₂²)=(1,0), (1,1), (1,1) | pass |
| 9.3 Checks | OP² | (381·39−19·36)/14175=14175/14175=1; H³=H⁴=0; χ=3 | pass |
| 10.4 Checks | Kreck–Stolz; KO-Pontryagin | n=2: −2(6−1)=−10. n=3, r=0,1: −28, gcd 28=2²·7. k(2)=8, k(3)=10. λ_t(ℓ−2)=1+(ℓ−2)t/(1+t)². a² and h₀²b both sit at (6,14). | pass |

### Library declarations opened at the pins

- `TauCeti.HomologicalOrientation` (`Orientation/Homological.lean:75`): needs `[T2Space M] [ChartedSpace E M]` and a transport-invariant choice of local generators.
- `fundamentalClass` (`LocalHomology/FundamentalClass.lean:204`), with `CompactSpace M` and `hn : finrank ℝ E = n`; `mapFundamentalClass` (`:275`); `mapFundamentalClass_neg` (`:316`); `fundamentalClassOn` (`:139`).
- `TauCeti.existsUnique_singularHomology_localHomologyRestriction_eq_of_invariant` (`Section.lean:99`), whose coefficients are any `N : ModuleCat Λ` (`:39`).
- `TauCeti.localHomology` (`System.lean:85`) and `TauCeti.localHomologyRestriction` (`System.lean:90`).
- `TopPair.singularHomologyπ` (`Singular/Relative.lean:394`).
- Mathlib: `AlgebraicTopology.singularHomologyFunctor` (`SingularHomology/Basic.lean:52`) and `Rep.FiniteCyclicGroup.groupHomologyIsoEven` (`GroupHomology/FiniteCyclic.lean:85`).

### Cross-roadmap citations resolved

- **AlgebraicTopology (#1652).** The checkout moved from db70d31 to c204943 during this review; I re-read it.
  - 6.3 (`:2491`) has the bijection between smooth and homological orientations (`:2588`).
  - 8.13 (`:4222`): smoothing for boundaryless, sigma-compact, Hausdorff, second-countable sources into compact targets (`:4265–4290`), relative transversality for smooth f (`:4303`) and parametric transversality (`:4309`). Its text says that TB B1.6 consumes all three.
- **StringOrientation (#948, 07f0981):** S1.5 `:458`, S2.2 `:551`, S2.3 `:607`, S5.3 `:1158`.
- **IndexTheory (#1077, 6d85f5d):** I2.5 `:648`, I5.4 `:1187`, I7.2 `:1371`, I7.5 `:1514`.
- **On main:**
  - GeometricTopology 1.1 `:788`, 4.3.1 `:2430`, 11.3 `:7887`;
  - GeneralizedCohomology G3.8 `spectrumConnectiveCover` `:797`;
  - ClassifyingSpaces Stage 4 `:74–76`;
  - SpinGeometry `realSpinDiracIndexClass` `:655`.
- **Overlaps** (`scratch/overlaps.md`, five items):
  - No open pull request changes this roadmap or drops a cited id.
  - The AlgebraicTopology layers come from #1652, which the description names. DifferentialGeometry 5.5b comes from #886, which it does not (R02).
  - Vocabulary neighbours:
    - HomotopySpheres is not cited.
    - StringOrientation is an earlier supplier.
    - FourManifolds is a later consumer.
    - GeneralizedCohomology is cited at its main numbering.
- **Ownership sweep** (`roadmaps grep` for `mapFundamentalClass`, Steenrod realization, Thom III.3/4/9 and η³): no other roadmap states realization. DGFloer #1798 and DGFloerPartII #1799 use `mapFundamentalClass` only in degree identities. The only second owner found is the η³ duplicate in K3BlochGroups, noted above.

## Not verifiable

- **Munkres**, *Elementary Differential Topology* (2.3, Thm 10.6 p.104, Def 8.3 pp.80–81): the sources service found only a JSTOR landing page and no legal open copy.
- **Atiyah–Bott–Shapiro** (7.1) and **Kreck–Stolz** (10.4): recorded `uncertified` in the manifest. The Kreck–Stolz numbers were recomputed as in the table, and the HP² case (n=2, r=0) agrees with p(HP²)=1+2u+7u², s₂=4−14=−10.
- **Wall 1960** (6.6): Lemmas 10–13 and the statement of Theorem 1 were not read page by page; the scan is image-only and OCR is unavailable. The paper is legally readable at the References' URL and is not yet in `sources.toml`.
- **Milnor 1960** (6.4), Lee, Stong, Anderson–Brown–Peterson, Stolz 1992, McCleary and Gompf–Stipsicz: books or paywalled articles, not in the cache, and outside the sample.

## Source issues

- **Misprint** in milnorStasheff at §17.2, p.207: the word "manifold" is misspelled in the definition of −M; it should read "manifold"; affects nothing.
- **Misprint** in milnorStasheff at §17.2, p.209: a letter is dropped from "and" in the Ω₀ entry; it should read "and"; affects nothing.
- **Misprint** in freedBordism at Lecture 12, p.104: a section heading drops one letter "s" from the word "Missing"; it should read "Missing steps"; affects nothing.
