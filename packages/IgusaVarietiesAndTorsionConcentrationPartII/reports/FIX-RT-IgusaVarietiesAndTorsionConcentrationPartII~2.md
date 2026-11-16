# FIX-RT-IgusaVarietiesAndTorsionConcentrationPartII~2

Red-team round 2 (passes a and b) on `packages/IgusaVarietiesAndTorsionConcentrationPartII`. Files changed: `README.md`, `sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged; no gap was added.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~2a/F01 (P1) — applied differently

The finding is right that the §9.1 route cited "§6.9 at `S′_fin ⊂ Spl_{F/F⁺}`", while §6.9(a) only covers places split in `𝒦`, and every Case 2 `S` contains primes ramified in `𝒦`.

Changed: "§6.9 at `S′_fin`" → a local matching statement in §9.1 (CS17 lines 3563–3582; Shin11 lines 1474–1527, 1685–1716). Its proof: at `v ∈ Spl_{F/F⁺}` the norms are the elements with similitude in `N(𝒦_v^×)`; cut a transfer off by `1_Y`; apply supplier §6.9(b)–(d) and §8.20. Added three Layer 9 Examples and updated Needs, Dependencies and contracts.

Why not the proposed gap: §9.1 only needs some base-change transfer `f^n⃗_v` of an endoscopic transfer of `φ_v`, because §9.3 keeps the functions at the bad places fixed. That follows from what the supplier already states at its head: §6.9(b) (existence of a transfer, vanishing at non-norms), §6.9(c) (inverse transfer), §6.9(d) (the norm criterion at every finite place, split in `F₀` or not) and §8.20 (only the stable orbital integrals of the transfers matter). A gap asking for (4.20) for the particular choice `ζ̃*(f_v)` would ask for more than is used.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~2a/F02 (P3) — applied differently

The finding is right that §6.8 is stated outside a set containing `ℓ`, and `ℓ ∉ S′` can happen.

Changed: the §9.1 route now handles `v = ℓ` explicitly. The Satake-dual maps (SR.4.1, square of §6.6(c)) are transfers by supplier §4.9(b) (`ℓ` inert in `𝒦`), §6.9(a) (`ℓ` split) and §4.10a (endoscopic, every residue characteristic). §6.8(c) holds at every place. §9.3 and the contracts are updated to match.

Why not the proposed gap: §§4.9(b) and 4.10a state the spherical fundamental lemmas at every unramified place, with no exclusion of `ℓ`. A gap for §6.8(a)–(b) at `v = ℓ` would ask the supplier for what it already states.

The same pattern occurred in §10.4: §6.8 was used at `q = p`, which it also excludes. That place now cites the split-place base change of §6.9(a).

## RT-IgusaVarietiesAndTorsionConcentrationPartII~2a/F03 (P3) — applied differently

The finding is right: the witness holds (`(q^k gM₀)^∨ = q^{−1−k}gM₀`), and with two inert places of opposite parity a rational rescaling of the form does not help.

Changed: §11.2(c) now uses `G ↪ GSp(V ⊕ V)` and `Λ_q = M ⊗ e + M^∨ ⊗ f`, with `H(e,e) = H(f,f) = 0` and `H(e,f) = 1`. This lattice is self-dual for any `K_q`-stable `M`. §11.2's Needs no longer cite the parent's §0.11. The witness was added as a Layer 11 Example.

Why differently: the suggested text begins from the claim that each hyperspecial `K_q` stabilizes some `⊕_u M_u` with `M_u^∨ = q^{a_u}M_u`. No cited source or supplier states this classification. The hyperbolic-plane lattice needs only that `K_q` is compact (its similitudes are units) and that `−1` is a norm from `F ⊗ ℚ_q`, which holds because `F` is unramified at `q ∉ S`.

The same pattern occurred in §8.2, whose route through PELModuli §M2.8 silently assumed that a hyperspecial `K_p` stabilizes a self-dual lattice. §8.2 now assumes `K_p` is the stabilizer of a self-dual `O_B`-stable lattice, and proves that every hyperspecial `K_p` is of this form when `p` splits in `𝒦`. That covers every auxiliary prime and every consumer (§§8.6, 8.9(3), 11.3, Layers 9–11), and it is the setting of CS17 §5.1 (CS17 line 3288). §8.6 now says "at any prime `p ∉ S` split in `𝒦`".

## RT-IgusaVarietiesAndTorsionConcentrationPartII~2a/F04, RT-IgusaVarietiesAndTorsionConcentrationPartII~2b/F01 (P3) — applied

Changed: the Iwahori Example is now restricted to rank `n ≥ 2` and to `q₁ ∈ S` split in `𝒦` with `F` and `G` unramified there. The vague claim about "upper unipotent entries" is replaced by the argument of 2b, which works for any self-dual `Λ` of `V` or `V ⊕ V`: `(u_1 − 1)⋯(u_n − 1) = q₁e` with `e` a nonzero idempotent, then Nakayama. The `n = 1` negative control was added: `ℚ(i)`, `S = {2,5}`, `q₁ = 5`, `Λ = ℤ[i]`, giving `K ⊂ Γ(5)`.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~2a/F05 (P3) — applied

Changed: the Conventions now record that CS17 fixes `ι_p : ℚ̄_p ≅ ℂ` (CS17 line 3976), so the remark that CS17's printed composite is undefined is correct for CS17's own `ι_p`. They also record that PELModuli §M0.27's `ι_p` is `ι_p⁻¹` here, with the same sets `S_i`. A two-term witness was added to the §8.3 Checks: for `ℚ(i)`, `p = 5`, `i ↦ 2` gives `(2 − i)` and `i ↦ 3` gives `(2 + i)`.

## RT-IgusaVarietiesAndTorsionConcentrationPartII~2b/F02 (P3) — applied

Changed: deleted the subsection "From TauCetiRoadmap.ArithmeticGaloisDuality" (R02.2.1), and removed R02.2.1 from the §11.2 Needs and from the Layer 11 Dependencies.

Checked first: R02.2.1 at its head is `RΓ(G, A) ≃ RΓ(G/H, RΓ(H, A))` for a closed normal subgroup. The route of §11.2 takes its spectral sequences from ClassicalAdicEtaleCohomology §1.3 and SchemeAndStackFoundations §2.15, and no other line of the README cites R02.2.1.

## Checks

- **Elaboration**, `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout: no errors. There are two warnings, `declaration uses 'sorry'`, at lines 80 and 92 (the two headline theorems).
- **Signatures**: a scratch copy with `#check @name` for all four declarations was elaborated once. Every elaborated type equals `scratch/signatures.md` and the README §§8.7–8.8 statements, with binders `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n}` and `r`. Nothing changed: no finding touched `Suggested.lean`.
- **Dependency check** (the command of the brief):

      depcheck: 248 roadmaps, 2344 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The README no longer names ArithmeticGaloisDuality. The newly cited sections, EndoscopicTransferAndUnitaryTraceComparison §§4.9, 4.10a and 8.20 and SmoothRepresentationsOfLocalGroups SR.4.1, belong to suppliers that are already cited.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures listed in the brief**: none.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §9.1 local matching, norm set | `v` split in `𝒦`; `𝒦 = ℚ(√−3)`, `v = 3` | split: `N(𝒦_v^×) = ℚ_v^×`, `Y` everything. `v = 3`: `N = {a² + 3b²}` has index 2, contains `3 = N(√−3)`, and excludes `−1` because `(−1, −3)_3 = (−1/3) = −1`; so `−1, −3 ∉ N` | holds; added as Examples |
| §9.1 local matching, cut-off | `γ ∉ Y` regular; `n⃗ = (n)`; `φ_v = 0` | `SO_γ(φ′) = Δ·O_δ(φ_v)`, with `δ` the Levi image of the same similitude, and `O_δ = SO_δ = 0` by §6.9(b); `(n)`: the transfer is `φ_v` itself; `0 ↦ 0` | transfer preserved; supported on norms, so §6.9(c) applies |
| §9.1 norm criterion at `v ∈ Spl_{F/F⁺}` | `δ′ = (λ, g₊, g₋)` | similitude of `N(δ′)` is `λλ^c`; the GL part `g₊λ^c g₋^♯` is onto (take `g₋ = 1`) | norm ⟺ similitude in `N(𝒦_v^×)` |
| §9.1 at `v = ℓ` | `ℓ ∈ S ∪ Ram(ϖ)`; `ℓ` inert; `ℓ` split; `ℓ` ramified in `𝒦` | in `S′`: nothing needed. Inert: §4.9 with `E = 𝒦_ℓ` unramified. Split: §6.9(a), where the convolution of spherical functions is the Satake image. Ramified: `ℓ ∈ S` | covered |
| §11.2(c), `e`, `f` | split `u`: `t = (1, −1)`; inert `u`: unit norm | `t̄t = (−1, −1) = −1`; `H(e,e) = 1 + t̄t = 0`, `H(f,f) = (1 + t̄t)/4 = 0`, `H(e,f) = ½ − t̄t/2 = 1`, `det(e,f) = −t`, a unit; `q = 2`: `f` has a denominator 2, still a basis | holds |
| §11.2(c), self-duality | `M = gM₀` (`a = −1`); `n = 1`; `M = M^∨` | `⟨a⊗e + b⊗f, x′⊗e⟩ = ⟨b, x′⟩` and `⟨…, y′⊗f⟩ = ⟨a, y′⟩`, so the dual is `M ⊗ e + M^∨ ⊗ f`; for `gM₀`: `gM₀⊗e + q⁻¹gM₀⊗f` | self-dual for every `M` |
| §11.2(c) witness | `q = 3`, quaternion datum, `g = diag(q, 1)` | `h(ge₀, gf₀) = q`; `(gM₀)^∨ = ⟨e₀, q⁻¹f₀⟩ = q⁻¹gM₀`; `(q^kgM₀)^∨ = q^{−1−k}gM₀`, so `k = −1−k` has no integer solution; the mixed parities `a_{u₁} = 0` and `a_{u₂} = −1` are not both moved to `0` by `c ∈ ℚ_q^×` or by `q^k` | the original claim was false; the repair holds |
| §8.2 at split `p` | `n = 2`, one `𝔭`; `(g, λ)` | stabilizer of `L ⊕ L^⊥` is `g ∈ GL(L)` and `λ ∈ ℤ_p^×`, so it is `GL(L) × ℤ_p^×` | every hyperspecial `K_p` stabilizes a self-dual lattice |
| Iwahori Example | `n = 2`, `n = 3`, `n = 1`; `N = 4, 6, 5, 10` | `n = 2`: product `q₁(E₁₁ ⊕ E₂₂)`; `n = 3`: `q₁E₁₁ ⊕ 0`; `eΛ ⊂ q₁^{n−1}Λ`, so `eΛ = q₁eΛ = 0`, a contradiction. `n = 1`: `K₅ = (1+5ℤ_5)²` lies in `Γ(5)`, and the units `−1, ±i ≢ 1` at the primes above 5, so `K` is neat. `q₁ ∤ N`: `−1 ≢ 1 mod 4` and `mod 3` | `n ≥ 2` holds; `n = 1` is the negative control |
| `ι_p` witness | `ι_p⁻¹(i) ≡ 2`, `≡ 3 (mod 5)` | `2 − i ↦ 0`; `2 + i ↦ 5 ≡ 0` | `(2 − i)` and `(2 + i)` respectively |
| `n = 1` self-dual `ℤ[i]` | `⟨x, y⟩ = Tr(xȳ·i/2)` | `⟨1,1⟩ = Tr(i/2) = 0`; `⟨1,i⟩ = Tr(½) = 1`; `⟨i,1⟩ = −1`; `⟨i,i⟩ = 0` | Gram matrix unimodular |

## Ownership and citations

- **Local matching step**: `roadmaps grep` for Shin's (4.19)–(4.20) and the open sibling checkout of EndoscopicTransferAndUnitaryTraceComparisonPartII found no roadmap that states compatibility at places of `Spl_{F/F⁺}` that do not split in `𝒦`. The step is a part of §9.1 derived from supplier statements, not a new carrier.
- **Supplier sections read at the head** (EndoscopicTransferAndUnitaryTraceComparison): §§4.9, 4.10a, 6.3, 6.6–6.9, 6.14, 6.21, 6.22, 6.25 and 8.20.
- **Other suppliers read**: PerfectoidShimuraVarieties §2.2; IgusaVarietiesAndTorsionConcentration §0.11; PELModuli §§M0.20, M0.27, M1.9, M2.8, M6.1; ArithmeticGaloisDuality R02.2.1.
- **Ownership against open pull requests** was checked through `roadmaps grep`, `roadmaps show` and the listed sibling checkouts only.

## For the maintainer

- IgusaVarietiesAndTorsionConcentration §0.11 asserts that global PEL data unramified at `p` with hyperspecial level give a self-dual lattice. That holds when every place of `F⁺` above `p` splits in `F`, but not in general (Layer 11 Example of this roadmap). This roadmap no longer relies on it at primes that do not split. The parent may want the same restriction.
- EndoscopicTransferAndUnitaryTraceComparison §6.8 excludes `p` and `ℓ` from its unramified statements. This roadmap covers those places through that roadmap's §§4.9, 4.10a and 6.9(a); if that supplier drops the exclusion, the extra clauses become redundant but stay true.
- `design/plan.json` nodes still list `ArithmeticGaloisDuality:R02.2`. Only the plan's `gaps` list may be edited in this job, and that list is unchanged.
- No Lean name, section number or gap slug changed, and no citing roadmap is affected. Sources: the `Shin11` entry in `sources.toml` gained the locators §3.4 (Cases 2–3), §4.2 ((4.6) and the explicit transfer) and §4.4 ((4.19)–(4.20)), and its `cited_for` gained 9.1 and Layer 9 Examples. No text was fetched and no text is missing.
