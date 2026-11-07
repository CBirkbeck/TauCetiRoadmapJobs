# GATE-EllipticCurveModularityPartII~12 — answers to human review

Head before: `d2cbd93`. Head after: `ad7b092` (one commit, `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` only; `Suggested.lean` unchanged).

One review (roed-math, 2026-11-06) with two points.

## H01 (roed-math) — applied differently

§6.0f cannot consume lemmas from FaltingsFinitenessAndIsogenyTheoremsPartII: that roadmap is line 351 of the merge order and this one is line 187, so the dependency would point upward. The fix goes the other way. The one object both roadmaps really share, the minimal period subvariety, is now defined here in full generality, and FaltingsFinitenessAndIsogenyTheoremsPartII §2.1 should import it from §6.0f.

Old: §6.0f used "the smallest abelian subvariety of E²×E′² whose tangent contains a vector formed from full period bases" without defining it. New: §6.0f defines A_ω for every algebraically closed K⊆ℂ, every abelian variety A/K and every ω∈t_A⊗ℂ (Gaudron–Rémond §1 p. 2, §7.2 p. 27; `GaudronRemond2011` lines 63–64 and 1530–1531). It has:
- an existence argument;
- three API facts: minimality, A_0=0 with scaling invariance, and φ(A_ω)=A′_(dφ(ω)) for every homomorphism φ;
- a *Needs:* line on AbelianSchemesAndArithmeticModuli §§A5.1 and A6.3–A6.5;
- three new Checks.

The multiplicity estimate and the auxiliary-section construction are not the same lemmas in the two roadmaps, so both stay:
- The estimate used here is the one Gaudron–Rémond apply in the proof of Proposition 6.1 (`GaudronRemond2011` lines 918–922). For a section vanishing to order gT along the whole tangent space at the origin, it gives T^(g−dim A′)·deg_L A′ ≤ n^(g−dim A′)·deg_L A. §6.0f now states it explicitly.
- Bost's Theorem 4.1, in FaltingsFinitenessAndIsogenyTheoremsPartII §2.2, counts the length of the (T−1)-th neighbourhood of the origin instead. At g=2, A′=0, T=2 that is binomial(3,2)=3 against T²=4, so it gives a weaker inequality and cannot give the 10⁷d² constant.
- In the other direction, §2.2 handles translated points and partial jets, and §2.3 has constants C_g depending only on g. The origin estimate here gives neither.
- A new §6.0f Check records the 4-versus-3 computation.

This matches #1738 at its current head `fca9497`. Its Scope says that §6.0f owns the Gaudron–Rémond explicit estimates and the E²×E′² period graph, and that its Layer 2 statements are different.

Three further changes:
- Scope (line 11) now lists what §6.0f owns.
- Downstream consumers gains a paragraph: FaltingsFinitenessAndIsogenyTheoremsPartII Layer 6 consumes quantitative-elliptic-isogeny, its Layer 2 uses A_ω from §6.0f, and the two sets of multiplicity and interpolation estimates are different statements.
- The §6.0f *Needs:* now says the minimal period subvariety is proved within the subsection.

Follow-up for the other pull request: #1738 §2.1 still defines its own G_ω. It should import A_ω from §6.0f, specialised to K=ℚ̄ and to periods ω.

## H02 (roed-math) — applied differently

Every ModularForms citation that used main's numbering ("Layers 3, 4, 6, 8, 8G and 10") is replaced; none is left. Where the content is already in Tau Ceti at the pin `2fd255d`, the README now cites the declaration, which needs no dependency. Where it is still planned in ModularForms, the README cites the section at #1706 head `a24d49a`: §§0.2, 1.1, 3.1, 8.2 and 10C.

The section headings at that head match the reviewer's pinned `65c1a735`, except that `a24d49a` adds §0.2. I checked the content of each section.

Where the repair differs from the suggestion:
1. **Sturm bound names.** The declarations sit in namespace `ModularForm`, not `TauCeti.ModularForm`: `namespace ModularForm` … `end ModularForm`, lines 48–91 of TauCeti/NumberTheory/ModularForms/SturmBound.lean. So the suggested `TauCeti.ModularForm.sturm_bound_finiteIndex` does not exist at the pin. The README's own `TauCeti.ModularForm.eq_of_sturm_bound` was the same defect; both are now `ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound`. #1706's "From Tau Ceti" carries the same wrong prefix.
2. **Bad-prime coefficients (Layer 4)** are already at the pin, so they cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `…_eq_zero_of_factorization_conductor_lt` (Newforms/BadPrime/Classification.lean lines 66 and 115). The suggested #1706 §§4.1 and 8.1 do not contain them: §4.1 is the conductor of a good eigenform, and §8.1 is rational descent and the weight-one lattice. The all-index eigenform property cites `HeckeRing.GL2.Newform.toEigenform` (Newforms/FullEigenform.lean line 128).
3. **Layer 6 (Atkin–Lehner)** cites `TauCeti.Nat.IsExactDivisor.normalizedAtkinLehnerOperatorCusp` (AtkinLehner/Normalized.lean line 134) on S_k(Γ₀(N)). §6.3 needs only the trivial-character case at weight two, where the factor (√Q)^(2−k) is 1. #1706 §6.1 is the general-nebentypus extension and is not needed.
4. **Integral coefficients and integral Hecke algebra (Layer 8)** cite:
   - `HeckeRing.GL2.Newform.isIntegral_qExpansion_coeff`, with k≥2 (Newforms/NumberField.lean line 152);
   - `TauCeti.numberField_CoefficientField`;
   - `TauCeti.heckeTCuspAlgebra` and `TauCeti.heckeTCuspAlgebra_finite` (HeckeSlash/Finite.lean lines 51 and 122).
5. **Γ₀ index and cusp orders (Layer 10).**
   - The Γ₀ index is `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (CongruenceSubgroups/Basic.lean line 1076).
   - The cusp orders in §6.0a are now ModularForms §0.2 (eta-quotient transformation law and cusp orders) and §1.1 (order dictionary).
6. **Two inputs that were missing from proof routes** are added:
   - `TauCeti.cuspFormCharSpaceOneEquiv` (TrivialNebentypus.lean line 221), so the Sturm bound in §3.1 is taken at the Γ₀(N) index, which gives μ(N)/6.
   - `TauCeti.EisensteinSeries.correctedE2` (EisensteinSeries/WeightTwo/Basic.lean line 81) for the odd Eisenstein series in §4.3.
7. **Layer 1 Dependencies** drops the old "Layer 8": no Layer 1 target uses coefficient fields or the Hecke algebra.

The suggestions taken as given:
- Layer 8G → §8.2 (existsUniqueGaloisConjugate, character transport, orbit cardinality [K_f:ℚ]).
- Coefficient fields → `TauCeti.CoefficientField` / `TauCeti.numberField_CoefficientField`.
- Dimensions → §10C (exact dimension formulas and the newspace identity with β the Dirichlet square of the Möbius function).
- Layer 3 → `TauCeti.cuspFormsOld`, `TauCeti.isCompl_cuspFormsOld_cuspFormsNew` and §3.1.

Lines changed: 9 (Scope), 41 (From Tau Ceti), 49 (From ModularForms), the *Needs:* of §§1.4, 2.2, 3.1, 3.2, 4.2, 4.3, 6.0a, 6.0d, 6.0f, 6.3 and 6.5, the prose of §§3.1 and 3.2, and the Dependencies of Layers 1, 2, 3 and 6.

As the reviewer asks, the pull-request description must name #1706 (the ModularForms revision) as a dependency, with §§0.2, 1.1, 3.1 and 8.2 defined only there. §10C also exists on main ("#### 10C — modular forms as section spaces, and the dimension formulas").

## Ids cited that only an open revision defines

- ModularForms §0.2, §1.1, §3.1 and §8.2: defined only at the head of the ModularForms revision, pull request #1706, head `a24d49a`. Main uses the numbering Layer 0–11 and 8G.

## Declarations checked at the pins

Every new backticked library name was found by grep in the content checkout's pinned packages, at TauCeti `2fd255d` and Mathlib `1b1ccf4` (the content repository's manifest):
- the 16 names listed under H02 (file and line given there for the ones newly cited);
- `UpperHalfPlane.qExpansion`, in Mathlib NumberTheory/ModularForms/QExpansion.lean line 172, namespace UpperHalfPlane.

`roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere. It notes that it did not check Lean names outside TauCetiRoadmap, which is why the grep above was done.

## Ownership against open work

The minimal period subvariety was searched by object ("smallest abelian subvariety", "minimal period subvariety", "period subvariety", "multiplicity estimate", "Masser–Wüstholz", "Nakamaye", "Gaudron") over main and the open heads, using `roadmaps grep`:
- **FaltingsFinitenessAndIsogenyTheoremsPartII §2.1** (merge order 351): later than this roadmap, so it should import A_ω (H01).
- **AbelianSchemesAndArithmeticModuli §A6.35:** the abelian subvariety generated by a curve, which is a different object.
- **EllipticModularityEffectiveComparisons §5.3a** (pull request #1810, merge order 270, later): restates quantitative-elliptic-isogeny and forms "the minimal abelian subvariety of E²×E′²". That is a duplicate of §6.0f inside a later roadmap; it should consume §6.0f. I did not edit it.

No earlier supplier owns A_ω or the Gaudron–Rémond estimates: ArakelovGeometryAndAbelianHeights cites Gaudron–Rémond only for height normalisations and Theorem 8.1. The ModularForms content was settled against main, #1706 and the pin as described under H02.

## Adversarial pass on added or changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| A_ω exists and is minimal (§6.0f) | A=0; E with ω=0 and ω≠0; E×E with ω=(η,η) | t_0=0 ⇒ A_0=0. On E the abelian subvarieties are {0,E}, so A_0=0 and A_ω=E. On E×E: dim (B₁∩B₂)⁰ ≤ min dim, and the diagonal (dimension 1) has tangent {(z,z)}∋(η,η) | holds | defined |
| A_(cω)=A_ω for c≠0 | c=2; c=0 | 2ω spans the same line as ω. c=0 gives A_0=0≠E for ω≠0 on E | holds only for c≠0 | "nonzero c" kept |
| φ(A_ω)=A′_(dφ(ω)) | identity; φ=0; [2] on E; pr₁ on E×E with ω=(η,η); inclusion B⊂A with ω∈t_B | identity: equality. 0: both sides 0. [2]: [2]E=E=E_(2ω). pr₁: diagonal ↦ E=E_η. Inclusion: B_ω=A_ω. Preimage rule: pr₁⁻¹(E)=E×E, dimension 2≠1 | image rule holds; preimage rule fails | preimage rule excluded by a Check |
| CM versus non-CM Check | y²=x³−x with lattice ϖℤ[i]; non-CM E with basis (ω₁,ω₂) | CM: (ϖ,iϖ) lies in the tangent {(z,iz)} of the graph of the order-4 automorphism, so dimension 1. Non-CM: aω₂=bω₁ with (a,b)∈ℤ²∖0 forces ω₂/ω₁∈ℚ (or ω₁=0), so dimension 2 | holds | Check added |
| Multiplicity estimate at the origin (GR, proof of Prop 6.1) | g=1, deg L=d; g=2, A′=0, T=2; T=0 | g=1: T·1≤nd, the zero count of a section of L^n. g=2: 4≤n²deg_L A against the length count 3. T=0: 0≤…, vacuous | consistent; strictly stronger than the length count | ampleness hypothesis added; Check added |
| a_q at weight two, trivial character (pin) | N=11, q=11; N=49, q=7 | cond(χ)=1, so χ^(q) is a character mod 1 with value 1, giving a_q²=1·q⁰=1. The level-11 form has a₁₁=1; at 49, q²∣N gives a₇=0 | holds | cited |
| Normalized Atkin–Lehner at k=2 | Q=p², k=2; k=4 | (√Q)^(2−k)=1 at k=2 and 1/Q at k=4 | factor 1 at weight two | stated in §6.3 |
| Γ₀ index formula (pin) | N=1, 4, 11, 30, 0 | 1·1=1·1; 6·2=4·3; 12·11=11·12; 72·30=2160=30·3·4·6; at N=0 both sides 0 | holds | cited |
| Sturm bound on Γ₀(N) (§3.1) | N=11, k=2 | ⌊2·12/12⌋=2 on Γ₀(11). On Γ₁(11) the index is 120 and the bound 20 | the trivial-character identification is needed for μ(N)/6 | `TauCeti.cuspFormCharSpaceOneEquiv` added |
| Newspace identity (§10C) | N=11; N=22 with trivial character | 1−2·0=1; 2−2·1−2·0+4·0=0 | holds | cited |
| Orbit size ≤ g⁺ (§8.2, Layer 2) | N=11; N=23 | K_f=ℚ gives orbit 1 = dim 1. K_f=ℚ(√5) gives orbit 2 = dim S₂(Γ₀(23)) = 2 | holds | cited |
| Odd Eisenstein series in span of correctedE2 (§4.3) | F₂=E₂−2E₂(2z), F₄=E₂−4E₂(4z) | a=−1/16, b=1/48. Coefficient of q: −24(a+b)=1. Coefficient of q²: −24(a+3b)=0. Constant term: −a−3b=0 | Σ_(n odd) σ(n)qⁿ = aF₂+bF₄ | cited |
| Layer 1 Dependencies without Layer 8 | §§1.1–1.8 | No coefficient field or Hecke algebra appears in localTerms, martinValue, newDimension, sharpF/G/H or the majorants | holds | Layer 8 dropped |

## Elaborated signatures

`Suggested.lean` is unchanged this round. The `#check @name` elaboration could not run: there is no built Tau Ceti for either pin. The worktree's `.lake/packages` is a dangling symlink to a missing shared directory, and the content checkout's shared package directory has no Tau Ceti build products, which is also why the signature extraction for this job failed.

## Build and gate

- `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`: **failed before elaboration**. Output: `info: TauCeti: materializing new dependency` / `error: already exists (error code: 17, file already exists)` / `file: <worktree>/.lake/packages`, exit 1.
  - Cause: the worktree's `.lake/packages` is a symlink to a shared lake directory that does not exist.
  - The branch also pins TauCeti `a91d3aa` and Mathlib `6b7abb3`, not main's `2fd255d` and `1b1ccf4`; it is based on main of 2026-10-24.
  - Neither the tooling nor the manifest was touched. No Lean changed this round.
- Gate: `gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. The new Downstream-consumers mention of FaltingsFinitenessAndIsogenyTheoremsPartII is not a supplier edge.

No source outside the manifest was needed, and no needs-references entry was written.
