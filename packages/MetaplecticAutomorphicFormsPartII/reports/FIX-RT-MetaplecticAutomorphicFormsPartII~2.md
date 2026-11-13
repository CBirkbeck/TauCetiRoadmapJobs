# FIX-RT-MetaplecticAutomorphicFormsPartII~2: repair of red-team round 2 (passes a and b)

Eight findings, all P3. The two §0.1 locator findings overlap and are settled once. Seven sections follow.

## RT-MetaplecticAutomorphicFormsPartII~2a/F01, RT-MetaplecticAutomorphicFormsPartII~2b/F02 (P3) — applied

Verified. N02 §2 (N02 lines 51–81) has no isotropic subspace. FS25 line 540 assumes a given partial polarization, defined at FS25 line 1698 (Appendix A, p. 44); neither text proves that a prescribed `I` has one.

Change: in §0.1, "(FS25, Lemma 3.3.4 and the paragraph before it, p. 15, and N02, §2, p. 16, …)" → "Equivalently … a partial polarization with `V⁺ = I`, `V⁻ = J` in the sense of FS25, Appendix A, p. 44, the notion used before Lemma 3.3.4, p. 15; existence for a prescribed `I` is proved here". The FS25 References entry and `sources.toml` locator were updated to match.

## RT-MetaplecticAutomorphicFormsPartII~2a/F02 (P3) — applied

Verified. `1 ⊕ J₀` is none of `u(C)`, `m(A)`, `J`, and `Sp₂(𝔽₃)` has characters of order 3.

Change: the §3.2 route now gives the `Sp(V₀)` step: Schur makes the action `c·W₀` with `c` a character, and `c(u(C₀)) = c(m(d)) = 1` (§2.3). `c` is trivial on the upper shears (`J₀`-conjugates of the lower ones), and generation (Tau Ceti `TauCeti.GLSymplecticFin.eq_top_of_root_subgroups`) gives `c = 1`. That declaration was added to the supplier contracts and to *Needs*.

Unlike the reviewer's text, the generation step rests on a pinned declaration rather than on the N02 citation alone, because a citation is not a supplier.

## RT-MetaplecticAutomorphicFormsPartII~2a/F03 (P3) — applied differently

Change: a new Scope paragraph says Layers 1–4 are the odd-characteristic theory, and that in characteristic 2 the centre-fixing automorphisms map onto `O(P/Z(P), x ↦ x²)` (FS25, Fact 3.4.1(b), p. 17). That case is not part of this roadmap, while Layer 0, §1.4 and §3.4 also cover 2-groups. A new §1.4 Check covers `Q₈`.

Why it differs from the suggested repair:
- **No splitting bound.** "Splits only for `dim V ≤ 2`" rests on Griess (1973), which was not read here.
- **No claim that the image avoids `Sp`.** It would fail for `Q₈`, where `O⁻(2,2) ≅ S₃ = Sp₂(𝔽₂)`.

## RT-MetaplecticAutomorphicFormsPartII~2a/F04 (P3) — applied

Verified. The phase `−y(x)/2` gives the same `T` and `M` and passes all four Checks.

Change: a new §1.2 Check. The product `(0,(1,0))(0,(0,1))` is `(2,(1,1))`, and `π(2,1,1)f(z) = ζ^{z+1}f(z+1) = TMf`. The wrong phase gives `ζ^z f(z+1) = MTf ≠ TMf`. The other sign conventions of §1.1 and §1.2 were already pinned.

## RT-MetaplecticAutomorphicFormsPartII~2b/F01 (P3) — applied differently

Verified. `J = C₃`, `H = 1`, `θ = 1` satisfies the existence conclusion without `hnd`, and `ψ = 1` does the same for the Heisenberg group.

Change: `finite_stoneVonNeumann_exists` and `fullyRamified_exists` are both deleted from `Suggested.lean`. §1.3 and §1.4 now say that existence needs only a normal `H` and an invariant `θ`, as the invariant case of Clifford theory (InductionRestriction Layer 5). The docstrings were updated to match.

Why `fullyRamified_exists` is deleted rather than weakened as the reviewer suggested: the weakened statement is Clifford theory owned on main, and it is two steps from the pins (`H` acts by `θ` on all of `Ind θ`). It is not a headline of this roadmap.

## RT-MetaplecticAutomorphicFormsPartII~2b/F03 (P3) — applied

Verified. For `n = 0`, §2.1 forces `μ(1) = 1`, so the scalar `a` is 1.

Change: the §2.2 Check "μ(g) = a(g); κ = a⁻¹" → "`n = 0`: `1 = 1²`, `κ` not exercised; `q = 3`, `g = u(1)`: `det W = ζ²`, `(det W|_{S⁺})² = (1·ζ)² = ζ²`; the twist by `λ(g) = ζ` gives `ζ²` against `1`". No other `n = 0` Check claims anything it does not exercise.

## RT-MetaplecticAutomorphicFormsPartII~2b/F04 (P3) — applied

Verified. `polarizationForm` (§0.2) and `schrodingerOp` (§1.2) sat under the Layer 2 heading.

Change: `Suggested.lean` gains a Layer 0 heading with `polarizationForm`, whose locator is now "(README §0.2)". `schrodingerOp` moves into Layer 1 in README order, between the §1.1 definitions and `finite_stoneVonNeumann`. Layer 2 keeps `evenPart`, `IsNormalizedWeil` and `existsUnique_isNormalizedWeil`. All elaborated types are unchanged.

## Checks run

- **Elaboration.** `lake env lean packages/MetaplecticAutomorphicFormsPartII/Suggested.lean`, run from the content checkout: exit 0. Seven warnings `declaration uses 'sorry'`, one per remaining theorem (lines 153, 182, 232, 268, 331, 366, 396), and no errors. The three `TauCeti.*` imports had object files, so nothing was built.
- **Signatures.** I copied the file to scratch with `#check @name` for all 15 declarations, elaborated it once, and compared each elaborated type with the earlier `signatures.md`. All 15 are identical. The only change is the removal of `finite_stoneVonNeumann_exists` and `fullyRamified_exists`. No binder was lost, and each type matches its README statement.
- **Dependency check** (exact output):

```text
depcheck: 207 roadmaps, 1901 edges, 0 problem(s)
```

- **Citations.** `roadmaps resolve` on the README found no unresolved cross-roadmap citation or Lean name. Names outside TauCetiRoadmap were not checked by the tool. I checked the one new Tau Ceti name at the pin by hand.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Scope, characteristic 2 | `Q₈`; `D₈` | `Q₈`: `Q(ī)=Q(j̄)=Q(k̄)=1`, anisotropic, `Aut/Inn = S₄/V₄ = S₃ = O⁻(2,2)`. `D₈`: `Q(r̄)=1`, `Q(s̄)=Q(rs̄)=0`, `Out = C₂ = O⁺(2,2)` | consistent with FS25 lines 623–624; no splitting bound claimed |
| §0.1 partial-polarization equivalence | `I = 0`; `𝔽₃` plane; `𝔽₃⁴`, `J = ⟨f₁+e₂, f₂⟩` | `(V⁺,V₀,V⁻) = (0,V,0)`; `(k e, 0, k f)`; `ω(f₁+e₂,f₂) = 1`, so `V⁻` is not isotropic, as the existing Check says. Converse: `V = V₀ ⊥ (I⊕J)`, so `I×J → k` is perfect, and `dim I^⊥ = dim I + dim V₀` | holds both ways |
| §1.2 new Check | `𝔽₃`, `(2,1,1)` | `2+z+2 = z+1`; wrong phase: `2+z−2 = z`; `TMf = ζ^{z+1}f(z+1)`, `MTf = ζ^z f(z+1)` | discriminates the sign |
| §1.3 existence remark | `𝔽₃` plane, `ψ = 1` and `ψ ≠ 1` | `ψ = 1`: trivial representation; `ψ ≠ 1`: `S_ψ`, dimension 3, norm `27⁻¹·3·9 = 1` | sound |
| §1.4 existence for invariant `θ` | `C₃`, `H = 1`; `S₃`, `H = A₃`, `θ` of order 3 (not invariant) | `C₃`: three characters, `d² = 1 ≠ 3`. `S₃`: irreducibles restrict to `A₃` as `1`, `1`, `θ⊕θ̄`; none is scalar `θ` | invariance is needed, the commutator hypotheses are not |
| §1.4 `Q₈` Check | `Q₈`, `H = {±1}` | `[i,j] = ijij = k² = −1`; character `(2,−2,0,0,0)`; `d² = 4 = 8/2` | sound |
| §2.2 new Check | `n = 0`; `q = 3`, `u(1)`, with and without twist | `1 = 1²`; `det = 1·ζ·ζ = ζ²`, `(1·ζ)² = ζ²`; twist: `ζ⁵ = ζ²` against `(ζ·ζ²)² = 1` | sound; the twist is excluded |
| §3.2 route, `GL(I)` factor | `m(a⊕1)` on `I = {0}×Y*` | acts on `Y*` by `a^{−T}`, `det = (det a)⁻¹`, `χ(d⁻¹) = χ(d)`; `W f(0,z₀) = χ(det a) f(0,z₀)` | sound |
| §3.2 route, `Sp(V₀)` factor | `1⊕u(C₀)`, `1⊕m(d)`; `J u(c) J⁻¹`; line in `𝔽₃⁴`; `I = 0`; `I` Lagrangian | `ψ(−z₀ᵀC₀z₀/2)f(0,z₀)` and `χ(det d)f(0,d⁻¹z₀)` are `W₀` on the nose. `(0,1;−1,0)(1,0;c,1)(0,−1;1,0) = (1,−c;0,1)`. `𝔽₃⁴`: `c` is a character of `SL₂(𝔽₃)` with `c(u(1)) = 1`, and `u(1)` generates the abelianization `C₃`, so `c = 1`. `I = 0`: `ρ₀ = W`. Lagrangian `I`: `Sp(0)` is trivial | sound; covers `Sp₂(𝔽₃)` |
| Tau Ceti `eq_top_of_root_subgroups` as supplier | root families at the pin | long roots `1 + cE_{i,m+i}`, `1 + cE_{m+i,i}`; sum roots: symmetric off-diagonal shears; difference roots `E_{ij} − E_{m+j,m+i}` = `m(1 + cE_ij)`. Gram matrix of `polarizationForm` = `−Matrix.J`, with the same isometry group | sound |
| `fullyRamified_unique` docstring | the five §1.4 Checks | unchanged elaborated type; docstring now states the hypotheses itself instead of pointing at the deleted theorem | sound |

## Notes for the maintainer

- **Removed Lean names.** `TauCetiRoadmap.MetaplecticAutomorphicFormsPartII.finite_stoneVonNeumann_exists` and `.fullyRamified_exists` are gone. `roadmaps grep` finds no citation of either on main or at any open head.
- **Ownership.** The existence half now cites InductionRestriction Layer 5 (on main) and is not restated. The generation input is the pinned Tau Ceti `TauCeti.GLSymplecticFin.eq_top_of_root_subgroups`. No new construction is owned here. Ownership against open pull requests was checked through `roadmaps grep` over the indexed heads.
- **Files.** `sources.toml` changed only in the FS25 `locator`/`cited_for` and the N02 `cited_for` (now "Layers 1-4", since §3.2 cites N02 Theorem 3.3). `plan.json` gaps are unchanged (`[]`). No new source was needed, and `needs-references.toml` was not written.
- **Untrusted text.** Nothing in the reviews, the siblings or the sources tried to direct the work.
