# Repair report: red-team round 2 of ComplexMultiplicationAndExplicitReciprocityPartII

The two reviews number their findings independently: pass a has F01–F03 and pass b has F01–F02. They are grouped below under one heading per review (r2a, r2b). None of the findings overlap.

# Review r2a

## F01 (P1) — applied

Old: GeometryOfNumbersAndQuadraticArithmetic "§§0.1–0.3, 1.2, 1.5" in the contract, in §13.2 *Needs* and in the Layer 13 Dependencies. Its head has no §0.1 and no §1.5. New: a contract "From SuccessiveMinima, IntegralLattices and HeightsAndUnits", citing SuccessiveMinima Layer 1, IntegralLattices 2F and HeightsAndUnits §2.1. GoNQA is now cited only for §1.2 (1.2.14) and §§2.2, 2.7–2.9. The covolume now comes from Mathlib `covolume_integerLattice` and `covolume_div_covolume_eq_relIndex'`. Both gap sections in the plan and the README now read §2.7. The §13.2 route now states the trace-form bound. Scope line updated.

Evidence: at head f1c97f8, GoNQA's Layer 0 has only §§0.2–0.3 and its Layer 1 only §§1.1–1.2. In the pinned Tau Ceti, `successiveMin` and `successiveMinimum` do not occur, so the contract consumes the roadmap targets and says so. Route check: on ℤ[i] the trace form has Gram diag(2,2) and determinant 4=D_E. The lower bound λ₁≥2g holds because β(x,x)=Σ_σ|σx|² ≥ 2g|Nm x|^(1/g) (AM–GM), with equality at x=1. So every λ_i ≤ γ_n^n D_E[O_E:I]²/(2g)^(n−1), which is polynomial.

## F02 (P2) — applied

§5.3 old: "symmetric difference is {τ₁,τ₂}, with τ₂=cτ₁". New: "each difference Φ_i∖Φ_(3−i) is a singleton; τ_i is its unique member, so τ_i∈Φ_i". The locator is now Y lines 674–677, which define τ_i exactly this way. I added a Check with the swapped Gaussian labels: τ₁=(i↦−i)∉Φ₁, so h(Φ₁,τ₁) is undefined. §6.4 already attaches τ_i to A_i of type Φ_i and is consistent; no other occurrence.

## F03 (P3) — applied

§6.1 Checks: the two bullets "rejected unless it equals the required graph" and "projection images equal δ⁻¹Λ_i/Λ_i" are replaced by the ℚ(√−3) Checks. The relative different δ=(√−3) has norm 3 and O_E/δ≅𝔽₃. The identity graph has 3 elements, while the product has 9 and is not a graph. The graphs of ±1 are {(0,0),(1,1),(2,2)} and {(0,0),(1,2),(2,1)}. Both project bijectively, yet they differ.

# Review r2b

## F01 (P2) — applied

Conventions old: "divide by the matching weighted complex degree". New: deg_C Y=Σ_(y∈Y(ℂ))1/|Aut y| over Y viewed as an E-stack, with 2d·deg_C Y weighted points on Y×_ℤℂ, and deĝ taken over Spec O_E with an archimedean term over all 2d embeddings. Locator: A §6.3, lines 3403–3414, which state exactly this. I added a d=1 Check for ℚ(i): deg_C Y₀=1/4 and the ratio is 2h=Σ_Φ h, whereas the ℤ-stack count gives h. This agrees with A line 5289. The convention covers both Y₀ (Layer 3) and Y (Layer 4). Every use in §§3.6, 3.8, 4.2b, 4.2c and 4.3 now has a defined deg_C. sources.toml: "Conventions" is added to A's `cited_for`, and §6.3 is already in its locator.

## F02 (P3) — applied

§2.5 now says that for d≥2, H₀ is a T_E-representation and not a T-representation. Its global realizations live on the T_E-cover Ỹ_K̃→Y_K, and only V₀ descends (A lines 1522–1542). §2.7: the crystal is now the Breuil–Kisin realization of H₀⊗ℚ_p, with Γ_y acting through local Artin into E_q×⊂T_E(ℚ_p). §2.1 records that it also applies to T_E. *Needs* now includes §2.1 and §2.4. The 3+2√2 witness is in the Layer 2 Examples.

One correction to the suggested repair: I do not claim that Ỹ_K̃→Y_K is surjective. ker N_F/ℚ is the norm-one torus of F, which is not split, so H¹(ℚ_p, ker N_F/ℚ)=ℚ_p×/Nm F_p× can be nonzero. That is why §2.7 is phrased locally. Recomputed: t∈T_E acts on f_a by t∘f_a∘t⁻¹=f_(a t/t̄), which is trivial for t∈F×. So V₀ factors through T, and in fact through T_so.

## Checks

- Elaboration: `lake env lean packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean` gives only two `declaration uses 'sorry'` warnings (lines 49 and 71) and no errors. `Suggested.lean` is unchanged.
- `#check @name` on both declarations, in one scratch file: the elaborated types match README §§10.1–10.2. `relative_class_number_growth` has ∃C>0 before ∀E, `[Field E] [NumberField E] [NumberField.IsCMField E]`, finrank 2g, and real division. `distant_cm_isogenies` has ∃c>0 before ∀E A ι, ∃B κ with an intertwining isogeny, then a bound for every isogeny via `Scheme.Hom.finrank` at `B.zeroPoint`. No binder is lost and nothing changed.
- Dependency check, full output:

```text
depcheck: 56 roadmaps, 661 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The new suppliers SuccessiveMinima, IntegralLattices and HeightsAndUnits are all on main.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name was found missing.

## Adversarial pass on new and changed text

| Statement | Instances | Values | Result |
|---|---|---|---|
| deg_C convention (Conventions) | d=1, ℚ(i) | E-stack count 1/4, ℤ-stack count 1/2; weighted deĝ(Ω♯)=2h/4; ratios 2h and h; Σ_Φ h=2h | E-stack reading matches §3.8 and A line 5289 |
| §5.3 labels | ℚ(i); g=2 adjacent types {τ₁,τ₂′},{cτ₁,τ₂′} | Gaussian: forced τ₁=id, τ₂=c; g=2: Φ₁∖Φ₂={τ₁}, Φ₂∖Φ₁={cτ₁}; swapping endpoints swaps the summands | well defined, symmetric |
| §6.1 Checks | ℚ(√−3) | graph has 3 elements vs product 9; ±1 graphs meet only in (0,0) | discriminating |
| §13.2 route | ℤ[i], I=O_E; I=ℤ+2ℤi | det β = 4 and 4·2²=16 (β Gram on (1,2i): diag(2,8)); λ₁=2=2g in both cases | bound holds; [O_E:I]² factor confirmed |
| §2.5/§2.7 | F=ℚ(√2), u=3+2√2 | Nm u=1, u·1=u≠1 on E; t f_a t⁻¹=f_(at/t̄) | H₀ is not a T-representation; V₀ is |
| Covolume | ℤ[i] | 2⁻¹√4·1=1 | agrees |

## Ownership and other notes

- No new target was added. Ownership of successive minima is cited to SuccessiveMinima, IntegralLattices and HeightsAndUnits on main. Ownership against open pull requests was checked through `roadmaps grep`/`roadmaps show` (GoNQA at head f1c97f8).
- No name that another roadmap cites has changed. The two GoNQA gaps keep their slugs and obligations; only their section is now §2.7.
- No suspicious instructions were found in the reviews.
