# FIX-PKG-InertAnticyclotomicCMMainConjecture~4: repair report

Findings resolved: the five findings of REV-PKG-InertAnticyclotomicCMMainConjecture~3 (one P1, one P2, three P3). Files changed: `packages/InertAnticyclotomicCMMainConjecture/README.md`, `Suggested.lean` (module docstring only), `sources.toml`, and `design/plan.json` (top-level `gaps` list only, one entry added).

## REV-PKG-InertAnticyclotomicCMMainConjecture~3/F01 (P1) — applied

Change: §4.3's unsupplied "by Brumer's theorem" → gap `leopoldt-abelian-over-imaginary-quadratic` (IntegralIwasawaTheory §4.4, Ax–Brumer: δ(F,ℓ)=0 for F abelian over imaginary quadratic k). It is in `plan.json` gaps, the supplier contracts, Scope, the §4.3 Needs line and Layer 4 Dependencies. The tower is corrected from K̃∞/K to Billot's K₀(E[p^∞])/K₀ with K₀=H(E[p]). Added the dihedral-K_1 Check. BRU67 is recorded as waived.

Evidence: BIL86 lines 285–295 (setup) and 380 (Leopoldt for all intermediate fields of F(E_(p^∞))/F). These fields are abelian over K, since G_H acts on E[p^∞] through φ_p restricted to G_H. IntegralIwasawaTheory (merge order line 29; this roadmap is line 348) owns the defect (§2.2) and Baker–Brumer (§§4.1e–4.2), and proves Leopoldt only for abelian E/ℚ (§4.4), read at its pull-request head.

## REV-PKG-InertAnticyclotomicCMMainConjecture~3/F02 (P2) — applied differently

Change: the §1.2 Check "conjugation acts on R by a semilinear map" → the conjugate embedding uses R as an O-algebra through c (F[π^∞]⊗_(O,c)R, or c̃(R)≠R), plus the cubic negative control. In §4.3 the symmetry is stated R-linearly from W to W^τ, whose character is φ_p⁻¹χ_cyc (the Cartier-dual avatar). No automorphism of R and no descent are used. Added the ℚ(i), p=7 Check.

Evidence: the cubic example is verified: a⁴∉μ_8=(μ_24)³, a cube root of a⁴ has order 18, and 9∤24. The identity φ_p(τ⁻¹gτ)=φ_p⁻¹χ_cyc(g) follows from φ(ā)=conjugate(φ(a)) and φ(a)·conjugate(φ(a))=Na, checked at Frobenius. The suggested route has two flaws. First, no extension of c is an involution: Gal(ℚ̄_p/ℚ_p) has no element of order 2, by Artin–Schreier, since ℚ_p is not orderable. So L·c̃(L) need not be c̃-stable. Second, a c̃-semilinear transport lands on the character c̃∘φ_p∘(τ-conj). That equals φ_p only if c̃∘φ_p=φ_p⁻¹χ_cyc, which is automatic for O-valued φ_p (E over K) and otherwise needs complex conjugation on the value field of φ to fix the prime selected by ι_p. I have not exhibited a datum where it fails. So the invariance-then-descent argument is not valid for every inert CM datum.

## REV-PKG-InertAnticyclotomicCMMainConjecture~3/F03 (P3) — applied

Change: §0.2 "BKO21 §3.0.2, p.950" → "§3.0.1, p.950, for H_𝔭=Φ; §6.0.1, p.961; §6.0.2, pp.961–962". The same mislabel is fixed in §0.1 ("§3.0.2, pp.951–952" → "§§3.0.1–3.0.2, pp.950–952"), in the References BKO21 entry and in the `sources.toml` BKO21 locator.

Evidence: BKO21 line 371 (p.950, §3.0.1: H completes to Φ); line 388 (§3.0.2 begins, p.951); lines 828–829 (p.961); lines 853–860 (pp.961–962); Gross datum at lines 373–387.

## REV-PKG-InertAnticyclotomicCMMainConjecture~3/F04 (P3) — applied

Change: §0.1 Check "E defined over the cubic field H" → "E defined over H … H is a cubic extension of K, so [H:ℚ]=6, not a cubic field". The other uses of the example already say "cubic extension" and needed no change: Layer 0 Examples and the §§3.2, 6.4 Checks.

Evidence: [H:K]=h_K=3 and [K:ℚ]=2.

## REV-PKG-InertAnticyclotomicCMMainConjecture~3/F05 (P3) — applied

Change: Scope and the Tau Ceti contract now cite `TauCeti.ContCohomology.SelmerStructure` (with `.localization`, `.selmerGroup`, `.mem_selmerGroup_iff`), `WeierstrassCurve.selmerGroup`/`selmerStructure` and `WeierstrassCurve.kummerSelmerMap`/`_injective`. §1.4 is an explicit `SelmerStructure` instance. The EllipticCurves Layer 7 citations are replaced in §§1.4, 6.4 and Layers 1, 6. The §6.4 route gains `WeierstrassCurve.Affine.fg_point_of_numberField`. The Suggested.lean docstring is corrected, with no new import.

Evidence: at Tau Ceti 2fd255d9, SelmerStructure.lean lines 69, 86, 97, 103; Selmer/Basic.lean lines 147, 176, 223, 238; MordellWeil/FinitelyGenerated.lean line 145. Finite generation is needed for the §6.4 limit: for A=ℚ, A⊗ℤ_p=ℚ_p while lim A/p^kA=0. No headline becomes statable, because the signed local conditions and L_p are still absent.

## Checks run

- `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean` from the content checkout: exit 0, no output, no warnings. The file still has `import Mathlib` only, one module docstring, the namespace and zero declarations.
- `#check @name` comparison: Suggested.lean declares nothing, so there are zero elaborated signatures to compare and nothing changed. The new Tau Ceti names cited in the README could not be `#check`ed: their object files are not built, and the brief allows `lake build` only for modules Suggested.lean imports. I confirmed each one instead by reading its declaration and namespace in the pinned sources (Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`), file and line as listed under F05.
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 236 roadmaps, 2142 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The edge count rose by one, for IntegralIwasawaTheory, which is earlier in the order.
- `roadmaps resolve` on the README: no cross-roadmap citation and no roadmap Lean name found nowhere. Library names were not checked by the tool ("no pinned Lake packages on this host"), so I checked them by hand as above.
- No gate failures were listed for this round.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Gap `leopoldt-abelian-over-imaginary-quadratic` | F=k; F=K_1 at p=5; F=H for ℚ(√−23); ℓ=2; archimedean places | F=k: unit rank 0, δ=0. K_1: Gal(K_1/K)=C₅, every lift τ gives τγτ⁻¹=γ⁴, so Gal(K_1/ℚ) is D₅. H: Gal(H/K)=C₃ and Gal(H/ℚ) has order 6 and is nonabelian. At complex places the decomposition groups are trivial, so Gal(F/k) acts simply transitively on the [F:k] infinite places and the unit rank is [F:k]−1. Ax–Brumer holds for every prime, including 2. | True as stated; the owner is IntegralIwasawaTheory §4.4. |
| §4.3 Billot hypotheses at K₀=H(E[p]) | BIL86 (1)–(4) | K⊆K₀; p inert; good reduction above p; E[p]⊆E(K₀). Gal(K₀(E[p^∞])/K₀)≅1+pO≅ℤ_p². H(E[p^∞]) is the compositum of H with the field cut out by ker φ_p, so it is abelian over K. | Hypotheses met; the tower is corrected from K̃∞/K. |
| §4.3 W^τ has character φ_p⁻¹χ_cyc | K=ℚ(i), p=7, f=(2+2i), α=−1+2i | α−1=i(2+2i). φ_p(Frob_(α))=α. The W^τ value is φ_p(Frob_(ᾱ))=ᾱ=−1−2i, and 5/α=ᾱ because αᾱ=5. c∘φ_p gives ᾱ. | Identity holds and the character changes (α≠ᾱ); added as a Check. |
| §4.3 c̃-semilinear alternative | general R; R=O | The transported character is c̃∘φ_p∘(τ-conj). It equals φ_p iff c̃∘φ_p=φ_p⁻¹χ_cyc: true for O-valued φ_p, a condition otherwise. No involutive extension of c exists in Gal(ℚ̄_p/ℚ_p). | Not used; recorded in a Check. |
| §1.2 conjugate-embedding Check | p=5, a a Teichmüller generator, L=Φ(∛(aπ)) | v(aπ)=1, so the polynomial is Eisenstein and [L:Φ]=3, totally ramified. σ(β)³/β³=a⁵π/(aπ)=a⁴. The cubes in μ_24 are a^(3k) and 4≢3k mod 24. A cube root of a⁴ has order 18, and 9∤24. | c does not extend to L; negative control added. |
| §1.2 conjugate comparison | G_Φ-character of F[π^∞]⊗_(O,c)R | g acts by c(κ(g)), and c∘κ≠κ because κ has image O^× and c≠id on O^×. | It is a different R[G_Φ]-module, consistent with "not covered". |
| §0.2 locator | BKO21 lines 371, 388, 828–829, 853–860 | p.950 is §3.0.1 (H completes to Φ). §3.0.2 begins at line 388, p.951. Lines 828–829 are p.961 (§6.0.1). Lines 853–860 are pp.961–962 (§6.0.2). | Locators corrected; same pattern fixed in §0.1, References and sources.toml. |
| §0.1 Check degrees | K=ℚ(√−23) | h=3 from three reduced forms; [H:K]=3 and [K:ℚ]=2, so [H:ℚ]=6. −23≡2 mod 5 is not a square, so 5 is inert. | Wording corrected. |
| §1.4 as a `SelmerStructure` instance | conditions L_n^s / ordinary / 0 / full at 𝔭, 0 at v∤p | `mem_selmerGroup_iff`: c∈Sel iff loc_𝔭c∈L and loc_v c=0 for all v∤p, which is the displayed kernel. Full at 𝔭 gives Sel_rel; 0 at 𝔭 gives Sel_str. With the identity coefficient map, localisation is R-linear, so the groups are R-submodules. | Instance matches the API bullets. |
| §6.4 Kummer injection | m=p^k over K_n; A=ℚ as a non-example | IsUnit(p^k:K_n) holds in characteristic 0. For A=ℚ, A⊗ℤ_p=ℚ_p while lim A/p^kA=0, so finite generation is needed. E(K_n) is finitely generated by `fg_point_of_numberField`. | Mordell–Weil input added. |
| §3.2 Check against the new T′≅T^τ | ℚ(i) example | T′ has value ᾱ and T has α, with ᾱ≠α. | Consistent: T′ is the τ-conjugate of T, not T. |
| Suggested.lean docstring | names at the pin | All cited names exist at 2fd255d9. Without the signed conditions and L_p, none of §§4.2, 4.4, 4.6, 6.4 is statable. | Inventory corrected; file still has zero declarations. |

## Sources

No source was fetched. BRU67 is added to `sources.toml` under its existing key with `status = "waived"`, `licence_class = "none"`, locator pp.121–124. The worker may attach the waiver's resolution link, which I do not have. `needs-references.toml` was not created, because no text is missing.

## Ownership and overlaps

- Leopoldt for abelian extensions of an imaginary quadratic field: `roadmaps grep` found it planned nowhere. EllipticCurvePeriodsAndModularParametrizations only cites Brumer in its references. IntegralIwasawaTheory owns the defect, Baker–Brumer and abelian Leopoldt over ℚ, so the gap goes to it.
- The discrete Selmer carrier is at the Tau Ceti pin; EllipticCurves Layer 7 is its plan and SelmerIwasawaCohomology §2.1 its extension.
- The overlap report lists no conflicting heads and no dropped ids. Ownership was checked against the open pull requests the tools index.

## For the maintainer

- IntegralIwasawaTheory receives a new supplier request (`gap:leopoldt-abelian-over-imaginary-quadratic`, §4.4): extend abelian Leopoldt from abelian extensions of ℚ to finite abelian extensions of an imaginary quadratic field, by the §4.3 unit-resolvent argument over Gal(F/k).
- No section, target or Lean name of this roadmap changed, so nothing other roadmaps cite is affected.
- §4.3 feeds only §4.4(1). The main conjecture §4.6 still uses §4.4(2) and §4.5, not §4.3. The F02 analysis shows that the coefficient-semilinear form of the conjugation symmetry is valid only when φ_p is O-valued. The R-linear form now in the README is the general one.
