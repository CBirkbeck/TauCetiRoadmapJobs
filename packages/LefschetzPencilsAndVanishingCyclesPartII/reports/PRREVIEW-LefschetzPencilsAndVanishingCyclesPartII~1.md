# Review of LefschetzPencilsAndVanishingCyclesPartII (pull request #2254 at ab1e4ae)

**Verdict:** needs changes

## R01 (P3) — §2.4 shrinking step rests on Stacks citations, not on a pinned supplier

**Location:** `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:582–585`, "Since `V₀` is smooth over `k` it is normal (Stacks, Lemma 33.25.4 (056T)), and as it is Noetherian it is a disjoint union of integral open subschemes"; line 600, "Stacks 056T and 033N for the shrinking step".

**Claim:** The step "a connected scheme smooth over `k` is integral" is not given by any target, supplier section or pinned declaration in the route. Stacks tags are citations, not suppliers. The pinned Tau Ceti declarations that prove the step are not cited.

**Witness:** Tau Ceti `TauCeti.AlgebraicGeometry.isRegularLocalRing_stalk_of_smooth` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/Regular.lean:43`) and `TauCeti.AlgebraicGeometry.isIntegral_of_connected_of_isRegularLocalRing_stalk` (`TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean:408`). Together they prove `IsIntegral X` for connected `X` smooth over `Spec k` in three lines, elaborated at the pins.

**Repair:** In step 1, replace the sentence with: "The connected component of `V₀` through `y` is open, since `V₀` is Noetherian. It is integral, being connected with regular local rings (Tau Ceti `TauCeti.AlgebraicGeometry.isRegularLocalRing_stalk_of_smooth` and `TauCeti.AlgebraicGeometry.isIntegral_of_connected_of_isRegularLocalRing_stalk`; Stacks, Lemmas 33.25.4 (056T) and 28.7.7 (033N)). Replace `V₀` by an affine open of it containing `y`." In the *Needs:* line, replace "Stacks 056T and 033N for the shrinking step" with "Tau Ceti `TauCeti.AlgebraicGeometry.isRegularLocalRing_stalk_of_smooth`, `TauCeti.AlgebraicGeometry.isIntegral_of_connected_of_isRegularLocalRing_stalk`; Mathlib `TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, `isClosed_connectedComponent`". Add the modules `TauCeti.AlgebraicGeometry.Morphisms.Smooth.Regular` and `TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk` under `### From Tau Ceti` and under Layer 2 `### Dependencies`.

## R02 (P3) — §2.2 *Needs:* line omits inputs that its API targets use

**Location:** `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:481–486`, "*Needs:* §1.2, §2.1; SchemeAndStackFoundations §0.8 `rational_point_component`; Mathlib … `AffineSpace.SpecIso_inv_over`, `MvPolynomial.uniqueAlgEquiv`."

**Claim:** The relative-dimension bullet uses three declarations that the line does not list. The good-open bullet uses openness of étale maps and density in irreducible spaces, also unlisted.

**Witness:** README.md:501–503 names `Etale.iff_smoothOfRelativeDimension_zero`, `smoothOfRelativeDimension_comp` and `AffineSpace.SpecIso`. README.md:556–557 lists `Scheme.Hom.isOpenMap`, `IsOpenMap.denseRange_of_isPreirreducibleSpace` and `IsOpen.dense` for the same good-open argument.

**Repair:** Append to the §2.2 *Needs:* line: "`AlgebraicGeometry.Etale.iff_smoothOfRelativeDimension_zero`, `AlgebraicGeometry.smoothOfRelativeDimension_comp`, `AlgebraicGeometry.AffineSpace.SpecIso`, `AlgebraicGeometry.Scheme.Hom.isOpenMap`, `IsOpenMap.denseRange_of_isPreirreducibleSpace`, `IsOpen.dense`."

## R03 (P3) — The description misstates Poonen's hypotheses

**Location:** Pull-request description, ¶1: "Poonen's finite-field Bertini needs a projective ambient variety, while the smooth charts in Kisin–Zhou's independence-of-ℓ argument (Corollary 5.2.7, Proposition 5.3.5) are affine."

**Claim:** The head says the opposite for Theorem 3.3 (README.md:113–117): Poonen's Theorem 3.3 allows a smooth quasi-projective `X`, and only Corollary 3.4 assumes a projective one. Kisin–Zhou's chart is a smooth scheme that the paper never says is affine.

**Witness:** Poonen2004 line 514 (Theorem 3.3: `X` a smooth quasiprojective subscheme of `ℙⁿ`). KisinZhou2024 lines 2342–2343 (a smooth scheme `Y`, with no affineness or projectivity stated).

**Repair:** "Poonen's Corollary 3.4 needs a smooth projective geometrically integral ambient variety. His Theorem 3.3 allows a quasi-projective one but does not make the hypersurface section connected. The smooth charts in Kisin–Zhou's argument (Corollary 5.2.7, Proposition 5.3.5) are not projective."

## R04 (P3) — The description misdescribes the roadmaps the README names and omits the supplier

**Location:** Pull-request description, ¶3: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README names LefschetzPencilsAndVanishingCycles, the base roadmap, which is still an open pull request. It is neither a consumer nor a prerequisite. The description names no supplier.

**Witness:** README.md:46–47 ("The base roadmap is not a supplier of any target here"); README.md:238–241 (supplier SchemeAndStackFoundations §0.8). LefschetzPencilsAndVanishingCycles is absent from main and sits at merge-order line 68.

**Repair:** Replace the sentence with: "Supplier: SchemeAndStackFoundations §0.8 (`rational_point_component`), on main. The base roadmap LefschetzPencilsAndVanishingCycles is itself an open pull request. The README cites its §3.4, §3.5 and Layer LPV.3 only to mark where it stops, and consumes nothing from it. ArithmeticInterpolationDeterminants §0.3 (on main) is cited only for comparison."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `polynomialGraph` | `m=1, B=0`; `m=2, B=3`, `h=X_0²X_1−X_0X_1²` over 𝔽_2; `m=2, B=0` at origin; ring `ℤ/1ℤ` | `X_0↦T^(0^0)=T`; weights `5, 7`, image `T⁵+T⁷`; `X_1↦1`: value 1 vs 0; both rings singletons | Checks hold; wrong model `X_i↦T^(B^(i+1))` gives `X_0↦T^B`, which the `m=1` Check excludes | none |
| §1.2 `polynomialGraph_coeff` | `B=0` with `m=0` and `m≥1`; `B=1`; `B=3` on `h` above; `X_1−X_0²`, `B=2`; `X_1`, `e=(2,0)`, `B=2` | `m=0`: `a=a`; `m≥1, B=0`: `he` unsatisfiable; `T⁶`: 0=0; `T²`: 0 vs 1; `T²`: 1 vs 0 | true; both negative controls fail exactly where stated | none |
| §1.3 `exists_avoiding_graph` | `X_0^q−X_0`; `X_1−X_0²` over 𝔽_2; `ℤ/4ℤ`, `h=2`; `m=0`; `m=2`, all `h` | `T^q−T`, no 𝔽_q-point; `B=3`: `T²(T−1)`; `φ(2)=2≠0`, `D(2)=∅`; `Spec k[T]→Spec k` not injective; image `V(X_1−X_0^B)` | true over a commutative ring; the geometry is correctly restricted to fields | none |
| §2.1 boundary polynomial | identity chart, `Z=V(X_0X_1)`; `m=0`; `k[x,x⁻¹]`, `Z={x=1}`; projection `𝔸²→𝔸¹` | `h=X_0X_1`; `h=1`; `h=X_0−1`; `π(V(x_1))=𝔸¹`, so no `h` exists (not étale) | true; `Ideal.under_ne_bot_of_algebraic_mem` needs `IsDomain S`, which holds | none |
| §2.2 marked component | 𝔽_3 chart `(x, z²−1−2x)`, `B=2`; identity 𝔸², `U=D(X_0)`; base change to 𝔽_9 | Jacobian `2z`, a unit; `π(0,1)=(0,0)`; `z²=(T+1)²`; branches differ by unit `2(T+1)`; mark on `z=T+1`; `0∉D(T)` | true; all of `W` fails integrality, and the other branch misses `c` | R02 |
| §2.3 `exists_marked_etale_curve` | `m=0`, `V=Spec k`; `U=V`; identity 𝔸², `U=D(X_0)`; constant `g` with `m>0` | `m=0`: `C∘constantCoeff = polynomialGraph k 0 B` on `MvPolynomial (Fin 0) k`; `g⁻¹U=D(T)`; constant `g` forces `q` into origin, not étale | true and not vacuous for `m>0` | none |
| §2.4 `exists_same_field_curve` | `Y=Spec k`; `y∈U`; cone `x²−aw²`, `a` a non-square, `q=3`, `a=2`; `Spec 𝔽_{q²}`; `𝔸¹⊔𝔸¹` | constant `g`: `g⁻¹U=C`; `Y(𝔽_q)={0}`; Frobenius swaps `x=±iw`, so `g⁻¹U=∅`; no section; density only on `V` | true; content only when `y∉U`; the shrinking step lacks a supplier | R01 |
| §2.4 marked residue fields | sections `c` of `s_C`, `y` of `f` | `residueFieldMap_bijective_of_section`: `k→κ(c)` and `k→κ(y)` bijective, `residueDegree` 1 at both | true | none |

- Source locators checked against the text (11): Stacks-Morphisms line 3743 (054L); Stacks-Varieties lines 528 (04KV), 2084 (056T), 2147 (0CDW); Stacks-Properties line 433 (033N); Poonen2004 lines 514, 536 (p. 10); KisinZhou2024 lines 2169, 2174 (p. 49), 2322–2351 (pp. 52–53), 2392–2425 (p. 54). Numbers, pages and hypotheses all match.
- Library declarations: 47 cited names `#check`ed at the pins, all present. File locations confirmed for 32 Mathlib and 8 Tau Ceti names. Mathlib `NoetherNormalization.lean:93` `sum_r_mul_ne` is private, as stated.
- Cross-roadmap citations resolved (5): SchemeAndStackFoundations §0.8 `rational_point_component` (main README:1233); ArithmeticInterpolationDeterminants §0.3 `powerSubstitution` (main README:424, Suggested.lean:49); LefschetzPencilsAndVanishingCycles §3.4, §3.5 and Layer LPV.3 (open head, README:2411, 2459, 2315).
- Gate: every check passed. Depcheck: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 4 `sorry` warnings only. The elaborated signatures of all 5 declarations match the README statements, with no binder dropped. The one-tactic probes (`simp`, `exact MvPolynomial.coeff_aeval_X_pow_weight …`, `exact?`) close neither Layer 1 theorem, so nothing is padding.
- Ownership: `roadmaps grep` over main and the 437 open heads finds no second owner. Searches: Kronecker substitution, Bertini, Poonen, curve through a point, étale chart, marked component, and the five Lean names.
- Overlap check: the three closest-roadmap lists are empty. Read by object: ArithmeticInterpolationDeterminants owns the `m = 2` power substitution, cited here for comparison. SchemeAndStackFoundations owns `rational_point_component`, consumed here. LefschetzPencilsAndVanishingCycles owns pencils and Bertini (§3.4–3.5, §5.1), and nothing is shared. DeligneWeightsAndPurity owns Bertini curves after a finite extension, and nothing is shared.
- Source independence: 8 passages compared with 5 sources, none shared beyond hypothesis lists the mathematics forces. Largest share: KisinZhou2024, 11 of 39 locators. Contents compared with KisinZhou2024 §§5.2–5.3: independent (Layers 1–2 have no counterpart there).

## Not verifiable

- KisinZhou2024, published text (Annals 202 (2025), DOI 10.4007/annals.2025.202.3.3): paywalled. Its numbering was not compared with arXiv v2, which is the version the locators cite.

## Source issues

- **Gap** in KisinZhou2024 at the proof of Corollary 5.2.7, p. 53 (reused in the proof of Proposition 5.3.5, p. 54): the source applies Poonen's Corollary 3.4 to a smooth scheme `Y` from a smooth atlas, which is not known to be projective or geometrically integral; it should apply a same-field curve result valid for smooth non-projective schemes with a rational point; affects the proof.

## For the human reviewers

- The roadmap is named as Part II of LefschetzPencilsAndVanishingCycles. That roadmap is not on main: it is an open pull request at merge-order line 68, and this roadmap is at line 4. README.md:39–47 consumes nothing from it and cites it only to mark the boundary.
